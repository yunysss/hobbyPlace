package com.hp.tutor.model.dao;

import java.io.FileInputStream;
import java.io.IOException;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.Properties;

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
	
	public Tutor selecTutorInfo(Connection conn, int memNo) {
		Tutor t = null;
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		
		String sql = prop.getProperty("selectTutorInfo");
		
	}


	
	


}
