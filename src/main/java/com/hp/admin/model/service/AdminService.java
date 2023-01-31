package com.hp.admin.model.service;

import static com.hp.common.JDBCTemplate.close;
import static com.hp.common.JDBCTemplate.commit;
import static com.hp.common.JDBCTemplate.getConnection;
import static com.hp.common.JDBCTemplate.rollback;

import java.sql.Connection;
import java.util.ArrayList;

import com.hp.admin.model.dao.AdminDao;
import com.hp.admin.model.vo.Search;
import com.hp.common.model.vo.Attachment;
import com.hp.common.model.vo.PageInfo;
import com.hp.lesson.model.vo.Category;
import com.hp.lesson.model.vo.Dcategory;
import com.hp.lesson.model.vo.Lesson;
import com.hp.lesson.model.vo.Schedule;
import com.hp.member.model.vo.Member;
import com.hp.tutor.model.vo.Tutor;

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

	public Member adminLogin(String userId, String userPwd) {
		Connection conn = getConnection();
		Member m = new AdminDao().adminLogin(conn, userId, userPwd);
		close(conn);
		return m;
	}
	
	public Lesson selectClass(int clNo) {
		Connection conn = getConnection();
		Lesson l = new AdminDao().selectClass(conn, clNo);
		close(conn);
		return l;
	}
	
	public ArrayList<Schedule> selectSchedule(int clNo) {
		Connection conn = getConnection();
		ArrayList<Schedule> sList = new AdminDao().selectSchedule(conn,clNo);
		close(conn);
		return sList;
	}
	
	public int selectNewClassCount() { // 게시글 수 조회하기
		Connection conn = getConnection();
		int listCount = new AdminDao().selectNewClassCount(conn);
		
		close(conn);
		return listCount;
		
	}
	
	public ArrayList<Lesson> selectNewClassList(PageInfo pi){
		Connection conn= getConnection();
		ArrayList<Lesson> list = new AdminDao().selectNewClassList(conn,pi);
		close(conn);
		
		
		return list;

	}
	
	public Tutor selectTutor(int clNo) {
		Connection conn = getConnection();
		Tutor t = new AdminDao().selectTutor(conn, clNo); 
		close(conn);
		return t;
	}
	
	public int classApprovalUpdate(int clNo) {
		Connection conn = getConnection();
		int result = new AdminDao().classApprovalUpdate(conn, clNo);
		if(result>0) {
			commit(conn);
		}else {
			rollback(conn);
		}
		close(conn);
		return result;
	}
	
	public int classRefuseUpdate(int clNo, String refuse) {
		Connection conn = getConnection();
		int result = new AdminDao().classRefuseUpdate(conn, clNo,refuse);
		if(result>0) {
			commit(conn);
		}else {
			rollback(conn);
		}
		close(conn);
		return result;
	}
	
	public ArrayList<Attachment> selectAttachmentList(int clNo) {
		Connection conn = getConnection();
		ArrayList<Attachment> list = new AdminDao().selectAttachmentList(conn, clNo);
		close(conn);
		
		return list;
		
	}
	public ArrayList<Lesson> searchClass(Search s){
		Connection conn = getConnection();
		ArrayList<Lesson> list = new AdminDao().searchClass(conn, s);
		close(conn);
		return list; 
		
	}

	/**	회원조회 리스트 select 
	 * @author 수연
	 * @param sGroup
	 * @param fCategory
	 * @param lineup
	 * @return list
	 */
	public ArrayList<Member> selectMemberList(String sGroup, String fCategory, String lineup) {
		Connection conn = getConnection();
		ArrayList<Member> list = new AdminDao().selectMemberList(conn, sGroup, fCategory, lineup);
		close(conn);
		return list;
	}
	
	public int checkClassReject(int clNo) {
		Connection conn = getConnection();
		int result = new AdminDao().checkClassReject(conn, clNo);
		if(result>0) {
			commit(conn);
		}else {
			rollback(conn);
		}
		close(conn);
		return result;
	}
	
	
	

}
