package com.hp.admin.model.service;

import static com.hp.common.JDBCTemplate.close;
import static com.hp.common.JDBCTemplate.getConnection;

import java.sql.Connection;
import java.util.ArrayList;

import com.hp.admin.model.dao.AdminDao;
import com.hp.common.model.vo.PageInfo;
import com.hp.lesson.model.vo.Category;
import com.hp.lesson.model.vo.Dcategory;
import com.hp.lesson.model.vo.Lesson;

public class AdminService {
	
	public int selectClassCount() { // 게시글 수 조회하기
		Connection conn = getConnection();
		int listCount = new AdminDao().selectClassCount(conn);
		
		close(conn);
		return listCount;
		
	}
	
	public ArrayList<Lesson> selectClassList(PageInfo pi){
		Connection conn= getConnection();
		ArrayList<Lesson> list = new AdminDao().selectClassList(conn,pi);
		close(conn);
		
		
		return list;

	}
	
	public ArrayList<Category> selectCategoryList(){
		Connection conn = getConnection();
		ArrayList<Category> cList = new AdminDao().selectCategoryList(conn);
		close(conn);
		return cList;
	}
	
	public ArrayList<Dcategory> selectDcategoryList(){
		Connection conn = getConnection();
		ArrayList<Dcategory> dList = new AdminDao().selectDcategoryList(conn);
		close(conn);
		return dList;
	}

	public void adminLogin(String userId, String userPwd) {
		Connection conn = getConnection();
		new AdminDao().adminLogin(conn, userId, userPwd);
		
	}
	
	public Lesson selectClass(int clNo) {
		Connection conn = getConnection();
		Lesson l = new AdminDao().selectClass(conn, clNo);
		close(conn);
		return l;
	}
	
	
	

}
