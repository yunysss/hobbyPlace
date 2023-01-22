package com.hp.tutor.model.service;

import static com.hp.common.JDBCTemplate.*;

import java.sql.Connection;
import java.util.ArrayList;

import com.hp.admin.model.dao.AdminDao;
import com.hp.common.model.vo.PageInfo;
import com.hp.lesson.model.vo.Lesson;
import com.hp.tutor.model.dao.TutorDao;
import com.hp.tutor.model.vo.Tutor;

public class TutorService {
	
	
	public Tutor selectTutorInfo(int memNo) {
		Connection conn = getConnection();
		Tutor t = new TutorDao(). selectTutorInfo(conn, memNo);
		close(conn);
		return t;
	}
	
	public int selectClassCount(int memNo) { // 게시글 수 조회하기
		Connection conn = getConnection();
		int listCount = new TutorDao().selectClassCount(conn,memNo);
		
		close(conn);
		return listCount;
		
	}
	
	public ArrayList<Lesson> selectClassList(PageInfo pi, int memNo){
		Connection conn= getConnection();
		ArrayList<Lesson> list = new TutorDao().selectClassList(conn,pi,memNo);
		close(conn);
		
		
		return list;

	}
	
	

}
