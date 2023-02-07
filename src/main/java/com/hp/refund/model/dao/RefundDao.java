package com.hp.refund.model.dao;

import static com.hp.common.JDBCTemplate.close;

import java.io.FileInputStream;
import java.io.IOException;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.Properties;

import com.hp.refund.model.vo.Refund;
import com.hp.register.model.vo.Register;

public class RefundDao {
private Properties prop = new Properties();
	
	public RefundDao(){
		String filePath = RefundDao.class.getResource("/db/sql/refund-mapper.xml").getPath();
		
		try {
			prop.loadFromXML(new FileInputStream(filePath));
		} catch (IOException e) {
			e.printStackTrace();
		}
	}
	
	/**
	 * @author 예서
	 * @param status 환불상태
	 * @return 관리자 검색 환불 리스트
	 */
	public ArrayList<Refund> selectRefundMng(Connection conn, String keywordType, String keyword, String dateType, String startDate, String endDate, String status){
		ArrayList<Refund> list = new ArrayList<>();
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		String sql = prop.getProperty("selectRefundMng");
		
		try {
			sql += "WHERE REF_STA LIKE '%" + status + "%'";
			if(!keyword.equals("")) {
				if(keywordType.equals("orderNo")) {
					sql += "AND ORDER_NO LIKE '%" + keyword + "%'";
				} else {
					sql += "AND MEM_ID LIKE '%" + keyword + "%'";
				}
			}
			if(!startDate.equals("") && !endDate.equals("")) {
				if(dateType.equals("regDate")) {
					sql += "AND REG_DATE BETWEEN TO_CHAR(TO_DATE('" +startDate + "', 'YYYY-MM-DD'), 'YYYY-MM-DD') AND TO_CHAR(TO_DATE('" +endDate + "', 'YYYY-MM-DD')+1, 'YYYY-MM-DD')";
				} else {
					sql += "AND REF_RQ_DT BETWEEN TO_CHAR(TO_DATE('" +startDate + "', 'YYYY-MM-DD'), 'YYYY-MM-DD') AND TO_CHAR(TO_DATE('" +endDate + "', 'YYYY-MM-DD')+1, 'YYYY-MM-DD')";
				}
			}
			pstmt = conn.prepareStatement(sql);
			rset = pstmt.executeQuery();
			while(rset.next()) {
				list.add(new Refund(rset.getInt("order_no"),
								    rset.getString("mem_id"),
								    rset.getString("ref_rq_dt"),
								    rset.getString("ref_fin_dt"),
								    rset.getString("ref_price"),
								    rset.getString("reg_date"),
								    rset.getString("reg_pay"),
								    rset.getString("cl_no"),
								    rset.getString("ref_sta"),
								    rset.getString("ref_rea"),
								    rset.getString("deposit_sta")
								    ));
			}
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(rset);
			close(pstmt);
		}
		return list;
	}
	
	/**
	 * @author 예서
	 * @param refNo 주문번호
	 * @param refSt 환불상태
	 * @return 선택한 환불상태로 UPDATE
	 */
	public int updateRefund(Connection conn, String refNo, String refSt) {
		int result = 0;
		PreparedStatement pstmt = null;
		String sql = prop.getProperty("updateRefund");
		
		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, refSt);
			pstmt.setString(2, refNo);
			
			result = pstmt.executeUpdate();
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(pstmt);
		}
		return result;
	}
	
	/**
	 * @author 예서
	 * @param refNo 주문번호
	 * @param refSt 환불상태
	 * @return 환불완료로 수정된 주문 처리날짜 SYSDATE로 UPDATE
	 */
	public int updateRefFinDt(Connection conn, String refNo) {
		int result = 1;
		PreparedStatement pstmt = null;
		String sql = prop.getProperty("updateRefFinDt");
		
		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, refNo);
			
			result = pstmt.executeUpdate();
		} catch (SQLException e) {
			e.printStackTrace();
		}finally {
			close(pstmt);
		}
		return result;
	}
	
	/**
	 * @author 예서
	 * @param refNo 주문번호
	 * @return 환불신청으로 수정된 주문 처리날짜 NULL로 UPDATE
	 */
	public int updateRefFinDtNull(Connection conn, String refNo) {
		int result = 1;
		PreparedStatement pstmt = null;
		String sql = prop.getProperty("updateRefFinDtNull");
		
		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, refNo);
			
			result = pstmt.executeUpdate();
		} catch (SQLException e) {
			e.printStackTrace();
		}finally {
			close(pstmt);
		}
		return result;
	}
	
	/**
	 * @author 예서
	 * @param refNo 주문번호
	 * @return 무통장입금 상세내역
	 */
	public Refund selectRefundDeposit(Connection conn, int refNo) {
		Refund r = null;
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		String sql = prop.getProperty("selectRefundDeposit");
		
		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, refNo);
			
			rset = pstmt.executeQuery();
			if(rset.next()) {
				r = new Refund(rset.getInt("order_no"),
							   rset.getString("ref_rq_dt"),
						       rset.getString("ref_price"),
						       rset.getString("ref_bank"),
						       rset.getString("ref_acc"),
						       rset.getString("ref_nm"),
						       rset.getString("ref_sta"),
						       rset.getString("ref_rea"));
			}
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(rset);
			close(pstmt);
		}
		return r;
	}
	
	/**
	 * @author 수정
	 * @param regNo
	 * @return 환불하려는 클래스 정보
	 */
	public Register selectRefundClass(Connection conn, int regNo) {
		//select=>한행
		Register r = null;
		PreparedStatement pstmt = null;
		ResultSet rset =null;
		
		String sql = prop.getProperty("selectRefundClass");
		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1,regNo);
			
			rset = pstmt.executeQuery();
			
			if(rset.next()) {
				r = new Register (
						          rset.getString("cl_no"),
								  rset.getInt("reg_no"),
								  rset.getString("teach_date"),
								  rset.getString("reg_pay"),
								  rset.getString("reg_price"),
								  rset.getString("deposit_sta"),
								  rset.getString("cl_thumb"),
								  rset.getString("cl_name"),
								  rset.getString("start_time"),
								  rset.getString("distr_name")
								);
			}
		} catch (SQLException e) {
			e.printStackTrace();
		}finally {
			close(rset);
			close(pstmt);
		}
		return r;
		
		
	}

	
	/**
	 * @author 수정
	 * @param conn
	 * @param r
	 * @return 환불요청페이지에서 전달(insert)되는 정보
	 */
	public int insertRefund(Connection conn, Refund ref) {
		int result = 0;
		PreparedStatement pstmt = null;
		String sql = prop.getProperty("insertRefund");
		
		try {
			pstmt=conn.prepareStatement(sql);
			
			pstmt.setInt(1, ref.getOrderNo());
			pstmt.setString(2, ref.getMemNo());
			pstmt.setString(3, ref.getRefPrice());
			pstmt.setString(4, ref.getRefBank());
			pstmt.setString(5, ref.getRefAcc());
			pstmt.setString(6, ref.getRefName());
			pstmt.setString(7, ref.getRefRea());
			
			result=pstmt.executeUpdate();
			
		} catch (SQLException e) {
			e.printStackTrace(); 
		}finally {
			close(pstmt);
		}
		
		return result;
	}
	
	public int insertRefundN(Connection conn, Refund ref) {
		int result = 0;
		PreparedStatement pstmt = null;
		String sql = prop.getProperty("insertRefundN");
		
		try {
			pstmt=conn.prepareStatement(sql);
			
			pstmt.setInt(1, ref.getOrderNo());
			pstmt.setString(2, ref.getMemNo());
			pstmt.setString(3, ref.getRefPrice());
			pstmt.setString(4, ref.getRefBank());
			pstmt.setString(5, ref.getRefAcc());
			pstmt.setString(6, ref.getRefName());
			pstmt.setString(7, ref.getRefRea());
			
			result=pstmt.executeUpdate();
			
		} catch (SQLException e) {
			e.printStackTrace(); 
		}finally {
			close(pstmt);
		}
		
		return result;
	}

	/**
	 * @author 수정
	 * @param conn
	 * @param memNo
	 * @param regSta
	 * @return
	 * 환불요청하면 수강상태 3번(예약취소)로 update
	 */
	public int updateStatus(Connection conn, int orderNo, String regSta) {
		int result = 0;
		PreparedStatement pstmt = null;
		String sql = prop.getProperty("updateStatus");
		
		try {
			pstmt=conn.prepareStatement(sql);
			pstmt.setInt(1,orderNo);
			
			result=pstmt.executeUpdate();
			
		} catch (SQLException e) {
			e.printStackTrace();
		}finally {
			close(pstmt);
		}
		return result;
	}

	/**
	 * @author 수정
	 * @param conn 
	 * @param regNo
	 * @return 사용자가 입력한 환불정보  조회
	 */
	public Refund selectRefundInfo(Connection conn, int regNo) {
		Refund ref = null;
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		
		String sql = prop.getProperty("selectRefundInfo");
		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, regNo);
			
			rset = pstmt.executeQuery();
			
			if(rset.next()) {
				ref = new Refund(rset.getString("mem_no"),
						          rset.getString("ref_price"),
						          rset.getString("ref_bank"),
						          rset.getString("ref_acc"),
						          rset.getString("ref_nm")
						);
							  
				
			}
		} catch (SQLException e) {
			e.printStackTrace();
		}finally {
			close(rset);
			close(pstmt);
		}
		
		
		return ref;
	}

	
	

}
