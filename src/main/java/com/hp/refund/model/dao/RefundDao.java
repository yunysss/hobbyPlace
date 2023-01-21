package com.hp.refund.model.dao;

import java.io.FileInputStream;
import java.io.IOException;
import java.util.Properties;

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

}
