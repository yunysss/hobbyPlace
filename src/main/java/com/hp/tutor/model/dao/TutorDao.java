package com.hp.tutor.model.dao;

import java.io.FileInputStream;
import java.io.IOException;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.Properties;

import static com.hp.common.JDBCTemplate.*;
import com.hp.tutor.model.vo.Tutor;

public class TutorDao {
	
private Properties prop = new Properties();
	
	public TutorDao(){
		String filePath = TutorDao.class.getResource("/db/sql/tutor-mapper.xml").getPath();
		
		try {
			prop.loadFromXML(new FileInputStream(filePath));
		} catch (IOException e) {
			e.printStackTrace();
		}
	}
	
	public Tutor selectTutorInfo(Connection conn, int memNo) {
		Tutor t = null;
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		
		String sql = prop.getProperty("selectTutorInfo");
		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, memNo);
			
			rset=pstmt.executeQuery();
			if(rset.next()) {
				t = new Tutor(rset.getInt("mem_no"),
							  rset.getString("tt_name"),
							  rset.getString("tt_phone"),
							  rset.getString("tt_email"),
							  rset.getString("introduce"),
							  rset.getString("pub_phone"),
							  rset.getString("tt_profile")

						);
				
			}
		} catch (SQLException e) {
			e.printStackTrace();
		}finally {
			close(rset);
			close(pstmt);
		}
		return t;
		
	}


	
	


}
