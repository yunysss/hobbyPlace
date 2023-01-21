package com.hp.lesson.model.service;

import static com.hp.common.JDBCTemplate.*;

import java.sql.Connection;
import java.util.ArrayList;

import com.hp.lesson.model.dao.LessonDao;
import com.hp.lesson.model.vo.Lesson;

public class LessonService {
	
	public ArrayList<Lesson> selectMainClass(){
		Connection conn = getConnection();
		ArrayList<Lesson> list = new LessonDao().selectMainClass(conn);
		close(conn);
		return list;
	}
	
	public ArrayList<Lesson> selectLikeClass(){
		Connection conn = getConnection();
		ArrayList<Lesson> list = new LessonDao().selectLikeClass(conn);
		close(conn);
		return list;
	}

}
