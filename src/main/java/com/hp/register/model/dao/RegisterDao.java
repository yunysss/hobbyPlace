package com.hp.register.model.dao;

import static com.hp.common.JDBCTemplate.close;

import java.io.FileInputStream;
import java.io.IOException;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.Properties;

import com.hp.common.model.vo.PageInfo;
import com.hp.member.model.vo.Member;
import com.hp.refund.model.vo.Refund;
import com.hp.register.model.vo.Register;
import com.hp.tutor.model.dao.TutorDao;

public class RegisterDao {
	
	private Properties prop = new Properties();
	
	public RegisterDao(){
		String filePath = TutorDao.class.getResource("/db/sql/register-mapper.xml").getPath();
		
		try {
			prop.loadFromXML(new FileInputStream(filePath));
		} catch (IOException e) {
			e.printStackTrace();
		}
	}
	
	/**
	 * @author 예서
	 * @param memNo 튜터 회원번호
	 * @param status 예약 진행 상태
	 * @return 로그인한 튜터의 예약승인 페이지에 띄울 list
	 */
	public ArrayList<Register> selectTutorRegister(Connection conn, int memNo, String status){
		ArrayList<Register> rList = new ArrayList<>();
		PreparedStatement pstmt = null;
		ResultSet rset =null;
		String sql = prop.getProperty("selectTutorRegister");
		
		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, memNo);
			pstmt.setString(2, "%" + status + "%");
			rset = pstmt.executeQuery();
			while(rset.next()) {
				rList.add(new Register(rset.getInt("reg_no"),
									  rset.getString("mem_name"),
									  rset.getString("cl_name"),
									  rset.getString("teach_date"),
									  rset.getString("reg_date"),
									  rset.getString("sch_time"),
									  rset.getString("reg_price"),
									  rset.getString("reg_sta")
									  ));
			}
		} catch (SQLException e) {
			e.printStackTrace();
		}finally {
			close(rset);
			close(pstmt);
		}
		return rList;
	}
	
	/**
	 * @author 예서
	 * @param regNo 선택한 예약번호
	 * @return 선택한 예약번호의 상세정보
	 */
	public Register selectDetailApproval(Connection conn, int regNo) {
		Register r = null;
		PreparedStatement pstmt = null;
		ResultSet rset =null;
		String sql = prop.getProperty("selectDetailApproval");
		
		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, regNo);
			rset = pstmt.executeQuery();
			
			if(rset.next()) {
				r = new Register(rset.getInt("reg_no"),
								rset.getString("mem_name"),
								rset.getString("cl_name"),
								rset.getString("teach_date"),
								rset.getString("reg_date"),
								rset.getString("sch_time"),
								rset.getString("reg_price"),
								rset.getString("reg_count"),
								rset.getString("mem_phone"),
								rset.getString("mem_email"));
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
	 * @author 예서
	 * @param regSta 예약승인/신청반려
	 * @param regNo 예약번호
	 * @return 예약진행상태 update
	 */
	public int updateRegister(Connection conn, int regSta, int regNo) {
		int result = 0;
		PreparedStatement pstmt = null;
		String sql = prop.getProperty("updateRegister");
		
		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, regSta);
			pstmt.setInt(2, regNo);
			
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
	 * @param r 신청한 클래스 정보
	 * @return 신청한 클래스 상세 정보
	 */
	public Register selectLessonRegister(Connection conn, Register r) {
		Register reg = null;
		PreparedStatement pstmt = null;
		ResultSet rset =null;
		String sql = prop.getProperty("selectLessonRegister");
		
		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, r.getTeachDate());
			pstmt.setString(2, r.getRegCount());
			pstmt.setString(3, r.getRegCount());
			pstmt.setString(4, r.getClNo());
			pstmt.setString(5, r.getSchNo());
			
			rset = pstmt.executeQuery();
			if(rset.next()) {
				reg = new Register(rset.getString("cl_no"),
						rset.getString("teach_date"),
						rset.getString("teach_time"),
						rset.getString("cl_price"),
						rset.getString("people"),
						rset.getString("price"),
						rset.getString("cl_thumb"),
						rset.getString("cl_name"),
						rset.getString("tt_name"));
			}
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(rset);
			close(pstmt);
		}
		
		return reg;
		
	}
	
	/**
	 * @author 예서
	 * @param memNo 클래스 신청한 멤버번호
	 * @return 멤버의 개인정보
	 */
	public Member selectRegisterMem(Connection conn, int memNo) {
		Member m = null;
		PreparedStatement pstmt = null;
		ResultSet rset =null;
		String sql = prop.getProperty("selectRegisterMem");
		
		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, memNo);
			
			rset = pstmt.executeQuery();
			
			if(rset.next()) {
				m = new Member(rset.getInt("mem_no"),
								rset.getString("mem_name"),
								rset.getString("mem_email"),
								rset.getString("mem_phone"));
			}
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(rset);
			close(pstmt);
		}
		
		return m;
		
	}
	
	/**
	 * @author 예서
	 * @param memNo 수정할 멤버번호
	 * @param memName 수정할 이름
	 * @param phone 수정할 전화번호
	 * @param email 수정할 이메일
	 * @return 멤버 개인정보 UPDATE
	 */
	public int reviseRegisterMem(Connection conn, int memNo, String memName, String phone, String email) {
		int result = 0;
		PreparedStatement pstmt = null;
		String sql = prop.getProperty("reviseRegisterMem");
		
		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, memName);
			pstmt.setString(2, email);
			pstmt.setString(3, phone);
			pstmt.setInt(4, memNo);
			
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
	 * @param r 주문정보
	 * @return 주문테이블 INSERT
	 */
	public int insertRegister(Connection conn, Register r) {
		int result = 0;
		PreparedStatement pstmt = null;
		String sql = prop.getProperty("insertRegister");
		
		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, r.getMemNo());
			pstmt.setString(2, r.getClNo());
			pstmt.setString(3, r.getTeachDate());
			pstmt.setString(4, r.getSchNo());
			pstmt.setString(5, r.getRegPay());
			pstmt.setString(6, r.getRegPrice());
			pstmt.setString(7, r.getRegCount());
			if(r.getRegPay().equals("0")) {
				pstmt.setString(8, "Y");
			} else {
				pstmt.setString(8, "N");
			}
			
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
	 * @return 주문번호
	 */
	public int selectRegisterNo(Connection conn) {
		int regNo = 0;
		PreparedStatement pstmt = null;
		ResultSet rset =null;
		String sql = prop.getProperty("selectRegisterNo");
		
		try {
			pstmt = conn.prepareStatement(sql);
			
			rset = pstmt.executeQuery();
			if(rset.next()) {
				regNo = rset.getInt("reg_no");
			}
		} catch (SQLException e) {
			e.printStackTrace();
		}finally {
			close(rset);
			close(pstmt);
		}
		
		return regNo;
	}

	/**
	 * 마이클래스 수강내역부분 조회
	 * @author 수정
	 * @param memNo
	 * @return ArrayList<Register> list
	 */
	public ArrayList<Register> selectMyClassList(Connection conn, PageInfo pi) {
		ArrayList<Register> list = new ArrayList<>();
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		String sql = prop.getProperty("selectMyClassList");
		
		try {
			pstmt=conn.prepareStatement(sql);
			pstmt.setInt(1,pi.getMemNo());
			
			int startRow = (pi.getCurrentPage() -1 ) * pi.getBoardLimit() + 1;
			int endRow = startRow + pi.getBoardLimit() -1;
			
			pstmt.setInt(2,startRow);
			pstmt.setInt(3, endRow);
			
			rset = pstmt.executeQuery();
			
			while(rset.next()) {
				list.add(new Register(
									  rset.getString("teach_date"),
									  rset.getInt("reg_no"),
									  rset.getString("reg_date"),
									  rset.getString("reg_pay"),
									  rset.getString("reg_price"),
									  rset.getString("reg_count"),
									  rset.getString("reg_sta"),
									  rset.getString("cl_thumb"),
									  rset.getString("cl_name"),
									  rset.getString("start_time"),
									  rset.getString("distr_name"),
									  rset.getString("tt_name")));
				
			}
		} catch (SQLException e) {
			e.printStackTrace();
		}finally {
			close(rset);
			close(pstmt);
		}return list;
	}

	/**
	 * @author 수정
	 * @param memNo
	 * @return listCount
	 * 로그인한 유저의 db에 저장되어 있는 결제 클래스 총 개수
	 */
	public int selectListCount(Connection conn, int memNo) {
		int listCount = 0;
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		
		String sql = prop.getProperty("selectListCount");
		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1,memNo);
			rset = pstmt.executeQuery();
			
			if(rset.next()) {
				listCount = rset.getInt("count");
			}
		} catch (SQLException e) {
			e.printStackTrace();
		}finally {
			close(rset);
			close(pstmt);
		}
		
		return listCount;
	}
	
	public ArrayList<Register> selectRegisterMng(Connection conn, String keywordType, String keyword, String startDate, String endDate, String status){
		ArrayList<Register> list = new ArrayList<>();
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		String sql = prop.getProperty("selectRegisterMng");
		if(!keyword.equals("")) {
			if(keywordType.equals("regNo")) {
				sql += "AND REG_NO LIKE ?";
			} else {
				sql += "AND MEM_ID LIKE ?";
			}
		}
		if(!startDate.equals("") && !endDate.equals("")) {
			sql += "AND REG_DATE BETWEEN ? AND ?";
		}
		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, "%" + status + "%");
			if(!keyword.equals("")) {
				pstmt.setString(2, "%" + keyword + "%");
				if(!startDate.equals("") && !endDate.equals("")) {
					pstmt.setString(3, startDate);
					pstmt.setString(4, endDate);
				}
			}else {
				if(!startDate.equals("") && !endDate.equals("")) {
					pstmt.setString(2, startDate);
					pstmt.setString(3, endDate);
				}
			}
			rset = pstmt.executeQuery();
			while(rset.next()) {
				list.add(new Register(rset.getInt("reg_no"),
								    rset.getString("mem_id"),
								    rset.getString("reg_date"),
								    rset.getString("reg_pay"),
								    rset.getString("reg_price"),
								    rset.getString("reg_sta"),
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
	
	public int updateRegister(Connection conn, String regNo, String regSt) {
		int result = 0;
		PreparedStatement pstmt = null;
		String sql = prop.getProperty("updateRegister");
		
		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, regSt);
			pstmt.setString(2, regNo);
			
			result = pstmt.executeUpdate();
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(pstmt);
		}
		return result;
	}
	

}