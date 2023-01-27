package com.hp.calculate.model.dao;

import static com.hp.common.JDBCTemplate.close;

import java.io.FileInputStream;
import java.io.IOException;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.Properties;

import com.hp.calculate.model.vo.Calculate;
import com.hp.register.model.vo.Register;

public class CalculateDao {
	
	private Properties prop = new Properties();
	
	public CalculateDao(){
		String filePath = CalculateDao.class.getResource("/db/sql/calculate-mapper.xml").getPath();
		
		try {
			prop.loadFromXML(new FileInputStream(filePath));
		} catch (IOException e) {
			e.printStackTrace();
		}
	}
	
	/**
	 * @author 예서
	 * @param memNo 튜터회원번호
	 * @param status 정산처리상태
	 * @return 수강완료된 주문 리스트
	 */
	public ArrayList<Register> selectTutorCalculate(Connection conn,int memNo, String status){
		ArrayList<Register> list = new ArrayList<>();
		PreparedStatement pstmt = null;
		ResultSet rset =null;
		String sql = prop.getProperty("selectTutorCalculate");
		
		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, memNo);
			pstmt.setString(2, status);
			rset = pstmt.executeQuery();
			
			while(rset.next()) {
				list.add(new Register(rset.getInt("reg_no"),
						  rset.getString("cl_name"),
						  rset.getString("teach_date"),
						  rset.getString("reg_date"),
						  rset.getString("sch_time"),
						  rset.getString("reg_price"),
						  rset.getString("reg_count"),
						  rset.getString("reg_cal")									  
						  ));
			}
			
		} catch (SQLException e) {
			e.printStackTrace();
		}finally {
			close(rset);
			close(pstmt);
		}
		return list;
	}
	
	/**
	 * @author 예서
	 * @param regNo 주문번호배열
	 * @return 정산신청금액합
	 */
	public int selectCalculate(Connection conn, String[] regNo) {
		int calPrice = 0;
		PreparedStatement pstmt = null;
		ResultSet rset =null;
		String sql = prop.getProperty("selectCalculate");
		
		try {
			for(int i=0; i<regNo.length; i++) {
				pstmt = conn.prepareStatement(sql);
				pstmt.setString(1, regNo[i]);
				rset = pstmt.executeQuery();
				if(rset.next()) {
					calPrice += rset.getInt("reg_price");
				}
			}
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(rset);
			close(pstmt);
		}
		return calPrice;
	}
	
	/**
	 * @author 예서
	 * @param cal 신청한 정산 객체
	 * @return Calculate 테이블 INSERT
	 */
	public int insertCalculate(Connection conn, Calculate cal) {
		int result = 0;
		PreparedStatement pstmt = null;
		String sql = prop.getProperty("insertCalculate");
		
		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, cal.getPrice());
			pstmt.setString(2, cal.getBank());
			pstmt.setString(3, cal.getCalAcc());
			pstmt.setString(4, cal.getCalNm());
			pstmt.setString(5, cal.getCalReg());
			
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
	 * @param regNoList 주문번호 배열
	 * @return Register 테이블 UPDATE
	 */
	public int updateRegister(Connection conn, String[] regNoList) {
		int result = 0;
		PreparedStatement pstmt = null;
		String sql = prop.getProperty("updateRegister");
		
		try {
			for(int i=0; i<regNoList.length; i++) {
				pstmt = conn.prepareStatement(sql);
				pstmt.setString(1, regNoList[i]);
				
				result += pstmt.executeUpdate();
			}
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(pstmt);
		}
		return result;
	}
	
	/**
	 * @author 예서
	 * @param memNo 튜터회원번호
	 * @param status 정산처리상태(전체, 정산처리중, 정산완료)
	 * @return 처리상태별 정산 리스트 (전체기간)
	 */
	public ArrayList<Calculate> selectAllCalList(Connection conn, int memNo, String status){
		ArrayList<Calculate> list = new ArrayList<>();
		PreparedStatement pstmt = null;
		ResultSet rset =null;
		String sql = prop.getProperty("selectAllCalList");
		
		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, memNo);
			pstmt.setString(2, "%" + status + "%");
			rset = pstmt.executeQuery();
			
			while(rset.next()) {
				list.add(new Calculate(rset.getInt("cal_no"),
						  rset.getString("rq_dt"),
						  rset.getString("price"),
						  rset.getString("bank"),
						  rset.getString("cal_acc"),
						  rset.getString("cal_nm"),
						  rset.getString("cal_sta")
						  ));
			}
			
			
		} catch (SQLException e) {
			e.printStackTrace();
		}finally {
			close(rset);
			close(pstmt);
		}
		return list;
		
	}
	
	/**
	 * @author 예서
	 * @param memNo 튜터회원번호
	 * @param startDate 검색시작날짜
	 * @param endDate 검색끝날짜
	 * @param status 정산처리상태(전체, 정산처리중, 정산완료)
	 * @return 처리상태별 정산 리스트 (선택한 기간)
	 */
	public ArrayList<Calculate> selectSeasonCalList(Connection conn, int memNo, String startDate, String endDate, String status){
		ArrayList<Calculate> list = new ArrayList<>();
		PreparedStatement pstmt = null;
		ResultSet rset =null;
		String sql = prop.getProperty("selectSeasonCalList");
		
		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, memNo);
			pstmt.setString(2, startDate);
			pstmt.setString(3, endDate);
			pstmt.setString(4, "%" + status + "%");
			rset = pstmt.executeQuery();
			
			while(rset.next()) {
				list.add(new Calculate(rset.getInt("cal_no"),
						  rset.getString("rq_dt"),
						  rset.getString("price"),
						  rset.getString("bank"),
						  rset.getString("cal_acc"),
						  rset.getString("cal_nm"),
						  rset.getString("cal_sta")
						  ));
			}
			
			
		} catch (SQLException e) {
			e.printStackTrace();
		}finally {
			close(rset);
			close(pstmt);
		}
		return list;
	}
	
	/**
	 * @author 예서
	 * @param calNo 
	 * @return 선택한 정산번호의 상세 내역
	 */
	public Calculate selectCalDetail(Connection conn, int calNo) {
		Calculate c = null;
		PreparedStatement pstmt = null;
		ResultSet rset =null;
		String sql = prop.getProperty("selectCalDetail");
		
		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, calNo);
			rset = pstmt.executeQuery();
			
			if(rset.next()) {
				c = new Calculate(rset.getInt("cal_no"),
							  rset.getString("rq_dt"),
							  rset.getString("price"),
							  rset.getString("bank"),
							  rset.getString("cal_acc"),
							  rset.getString("cal_nm"),
							  rset.getString("cal_sta")
							  );
			}
		} catch (SQLException e) {
			e.printStackTrace();
		}finally {
			close(rset);
			close(pstmt);
		}
		return c;
		
	}
	
	/**
	 * @author 예서
	 * @param status 정산처리상태
	 * @return 관리자 정산관리 리스트 (전체 기간, 전체 회원, 정산상태별)
	 */
	public ArrayList<Calculate> selectAllSeasonCalMng(Connection conn, String status){
		ArrayList<Calculate> list = new ArrayList<>();
		PreparedStatement pstmt = null;
		ResultSet rset =null;
		String sql = prop.getProperty("selectAllSeasonCalMng");
		
		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, "%" + status + "%");
			rset = pstmt.executeQuery();
			
			while(rset.next()) {
				list.add(new Calculate(rset.getInt("cal_no"),
						  rset.getString("rq_dt"),
						  rset.getString("price"),
						  rset.getString("bank"),
						  rset.getString("cal_acc"),
						  rset.getString("cal_nm"),
						  rset.getString("cal_sta"),
						  rset.getString("mem_id")
						  ));
			}
			
			
		} catch (SQLException e) {
			e.printStackTrace();
		}finally {
			close(rset);
			close(pstmt);
		}
		return list;
	}
	
	/**
	 * @author 예서
	 * @param memId 검색한 튜터 아이디 키워드
	 * @param status 정산처리상태
	 * @return 관리자 정산관리 리스트 (전체 기간, 선택한 회원, 정산상태별)
	 */
	public ArrayList<Calculate> selectMemSeasonCalMng(Connection conn, String memId, String status){
		ArrayList<Calculate> list = new ArrayList<>();
		PreparedStatement pstmt = null;
		ResultSet rset =null;
		String sql = prop.getProperty("selectMemSeasonCalMng");
		
		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, "%" + memId + "%");
			pstmt.setString(2, "%" + status + "%");
			rset = pstmt.executeQuery();
			
			while(rset.next()) {
				list.add(new Calculate(rset.getInt("cal_no"),
						  rset.getString("rq_dt"),
						  rset.getString("price"),
						  rset.getString("bank"),
						  rset.getString("cal_acc"),
						  rset.getString("cal_nm"),
						  rset.getString("cal_sta"),
						  rset.getString("mem_id")
						  ));
			}
			
			
		} catch (SQLException e) {
			e.printStackTrace();
		}finally {
			close(rset);
			close(pstmt);
		}
		return list;
	}
	
	/**
	 * @author 예서
	 * @param startDate 검색시작날짜
	 * @param endDate 검색끝날짜
	 * @param status 정산처리상태
	 * @return 관리자 정산관리 리스트 (선택한 기간, 전체 회원, 정산상태별)
	 */
	public ArrayList<Calculate> selectAllCalMng(Connection conn, String startDate, String endDate, String status){
		ArrayList<Calculate> list = new ArrayList<>();
		PreparedStatement pstmt = null;
		ResultSet rset =null;
		String sql = prop.getProperty("selectAllCalMng");
		
		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, startDate);
			pstmt.setString(2, endDate);
			pstmt.setString(3, "%" + status + "%");
			rset = pstmt.executeQuery();
			
			while(rset.next()) {
				list.add(new Calculate(rset.getInt("cal_no"),
						  rset.getString("rq_dt"),
						  rset.getString("price"),
						  rset.getString("bank"),
						  rset.getString("cal_acc"),
						  rset.getString("cal_nm"),
						  rset.getString("cal_sta"),
						  rset.getString("mem_id")
						  ));
			}
			
			
		} catch (SQLException e) {
			e.printStackTrace();
		}finally {
			close(rset);
			close(pstmt);
		}
		return list;
	}
	
	/**
	 * @author 예서
	 * @param memId 검색한 튜터 아이디 키워드
	 * @param startDate 검색시작날짜
	 * @param endDate 검색끝날짜
	 * @param status 정산처리상태
	 * @return 관리자 정산관리 리스트 (선택한 기간, 선택한 회원, 정산상태별)
	 */
	public ArrayList<Calculate> selectMemCalMng(Connection conn, String memId, String startDate, String endDate, String status){
		ArrayList<Calculate> list = new ArrayList<>();
		PreparedStatement pstmt = null;
		ResultSet rset =null;
		String sql = prop.getProperty("selectMemCalMng");
		
		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, "%" + memId + "%");
			pstmt.setString(2, startDate);
			pstmt.setString(3, endDate);
			pstmt.setString(4, "%" + status + "%");
			rset = pstmt.executeQuery();
			
			while(rset.next()) {
				list.add(new Calculate(rset.getInt("cal_no"),
						  rset.getString("rq_dt"),
						  rset.getString("price"),
						  rset.getString("bank"),
						  rset.getString("cal_acc"),
						  rset.getString("cal_nm"),
						  rset.getString("cal_sta"),
						  rset.getString("mem_id")
						  ));
			}
			
			
		} catch (SQLException e) {
			e.printStackTrace();
		}finally {
			close(rset);
			close(pstmt);
		}
		return list;
	}
	
	/**
	 * @author 예서
	 * @param calNo 선택한 정산번호
	 * @return 선택한 정산번호의 주문번호(,로 연결된 문자열)
	 */
	public String selectCalculateSta(Connection conn, int calNo) {
		String str = null;
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		String sql = prop.getProperty("selectCalculateSta");
		
		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, calNo);
			
			rset = pstmt.executeQuery();
			
			if(rset.next()) {
				str = rset.getString("cal_reg");
			}
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(rset);
			close(pstmt);
		}
		return str;
	}
	
	/**
	 * @author 예서
	 * @param calNo 선택한 정산번호
	 * @param calSta 선택한 정산처리상태
	 * @return Calculater 테이블 UPDATE
	 */
	public int updateCalculateSta(Connection conn, int calNo, String calSta) {
		int result = 0;
		PreparedStatement pstmt = null;
		String sql = prop.getProperty("updateCalculateSta");
		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, calSta);
			pstmt.setInt(2, calNo);
			
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
	 * @param calNo 선택한 정산번호
	 * @param calSta 선택한 정산처리상태
	 * @return Register 테이블 UPDATE 결과
	 */
	public int updateRegisterCalSta(Connection conn, String calSta, String[] calRegList) {
		int result = 0;
		PreparedStatement pstmt = null;
		String sql = prop.getProperty("updateRegisterCalSta");
		try {
			for(int i=0; i<calRegList.length;i++){
				pstmt = conn.prepareStatement(sql);
				pstmt.setString(1, calSta);
				pstmt.setInt(2, Integer.parseInt(calRegList[i]));
				
				result += pstmt.executeUpdate();
			}
		} catch (SQLException e) {
			e.printStackTrace();
		}finally {
			close(pstmt);
		}
		return result;
		
	}
	
	
	

}
