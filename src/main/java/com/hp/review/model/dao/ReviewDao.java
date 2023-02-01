package com.hp.review.model.dao;

import static com.hp.common.JDBCTemplate.close;

import java.io.FileInputStream;
import java.io.IOException;
import java.util.Properties;


import com.hp.lesson.model.dao.LessonDao;

public class ReviewDao {
	
	private Properties prop = new Properties();
	
	public ReviewDao() {
		
		try {
			prop.loadFromXML(new FileInputStream(LessonDao.class.getResource("/db/sql/review-mapper.xml").getPath()));
		} catch (IOException e) {
			e.printStackTrace();
		}
	}
	
	

}
