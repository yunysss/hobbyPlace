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
	
	public ArrayList<Calculate> selectAllCalList(Connection conn, int memNo, String startDate, String endDate){
		ArrayList<Calculate> list = new ArrayList<>();
		PreparedStatement pstmt = null;
		ResultSet rset =null;
		String sql = prop.getProperty("selectAllCalList");
		
		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, memNo);
			pstmt.setString(2, startDate);
			pstmt.setString(3, endDate);
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
	
	public ArrayList<Calculate> selectNCCalList(Connection conn, int memNo, String startDate, String endDate, String status){
		ArrayList<Calculate> list = new ArrayList<>();
		PreparedStatement pstmt = null;
		ResultSet rset =null;
		String sql = prop.getProperty("selectNCCalList");
		
		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, memNo);
			pstmt.setString(2, startDate);
			pstmt.setString(3, endDate);
			pstmt.setString(4, status);
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
	public ArrayList<Calculate> selectAllSeasonCalList(Connection conn, int memNo){
		ArrayList<Calculate> list = new ArrayList<>();
		PreparedStatement pstmt = null;
		ResultSet rset =null;
		String sql = prop.getProperty("selectAllSeasonCalList");
		
		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, memNo);
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
	
	public ArrayList<Calculate> selectNCSeasonCalList(Connection conn, int memNo, String status){
		ArrayList<Calculate> list = new ArrayList<>();
		PreparedStatement pstmt = null;
		ResultSet rset =null;
		String sql = prop.getProperty("selectNCSeasonCalList");
		
		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, memNo);
			pstmt.setString(2, status);
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
	

}
