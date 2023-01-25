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

}
