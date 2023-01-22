package com.hp.tutor.model.dao;

import java.io.FileInputStream;
import java.io.IOException;
import java.sql.Date;
import java.util.Properties;

import com.hp.member.model.dao.MemberDao;

public class TutorDao {
	
private Properties prop = new Properties();
	
	public TutorDao(){
		String filePath = TutorDao.class.getResource("/db/sql/member-mapper.xml").getPath();
		
		try {
			prop.loadFromXML(new FileInputStream(filePath));
		} catch (IOException e) {
			e.printStackTrace();
		}
	}


	
	


}
