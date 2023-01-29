package com.hp.tutor.model.service;

import static com.hp.common.JDBCTemplate.close;
import static com.hp.common.JDBCTemplate.commit;
import static com.hp.common.JDBCTemplate.getConnection;
import static com.hp.common.JDBCTemplate.rollback;

import java.sql.Connection;
import java.util.ArrayList;

import com.hp.common.model.vo.Attachment;
import com.hp.common.model.vo.PageInfo;
import com.hp.lesson.model.vo.Category;
import com.hp.lesson.model.vo.Dcategory;
import com.hp.lesson.model.vo.Lesson;
import com.hp.lesson.model.vo.Schedule;
import com.hp.member.model.dao.MemberDao;
import com.hp.member.model.vo.Member;
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
	public ArrayList<Category> selectCategoryList(){
		Connection conn = getConnection();
		ArrayList<Category> cList = new TutorDao().selectCategoryList(conn);
		close(conn);
		return cList;
	}
	
	public ArrayList<Dcategory> selectDcategoryList(){
		Connection conn = getConnection();
		ArrayList<Dcategory> dList = new TutorDao().selectDcategoryList(conn);
		close(conn);
		return dList;
	}
	
	public Tutor updateTutorProfile(Tutor t) {
		Connection conn = getConnection();
		int result = new TutorDao().updateTutorProfile(conn,t);
	
		Tutor updateTutor = null;
		if(result>0) {
			commit(conn);
			// 갱신된 튜터 객체 다시 조회해오기 
			updateTutor = new TutorDao().selectTutorInfo(conn,t.getMemNo());
			
		}else {
			rollback(conn);
			
		}
		
		return updateTutor;
	}
	
	public int nickCheck(String checkNick) {
		Connection conn = getConnection();
		int count = new TutorDao().nickCheck(conn, checkNick);
		close(conn);
		return count; 
		
	}

	/** 튜터 등록 
	 * @author 수정
	 * @param Tutor t
	 * @return result
	 */
	public int insertTutor(Tutor t, String grade, int memNo) {
		Connection conn = getConnection();
		
		int result1 = new TutorDao().insertTutor(conn, t);
		int result2 = new TutorDao().updateGrade(conn, grade, memNo);
		
		if(result1>0 && result2>0) {
			commit(conn);
		}else {
			rollback(conn);
		}
		close(conn);
		return result1*result2;
	}
	
	public Member selectTutor(int memNo) {
		Connection conn = getConnection();
		Member tutorMem = new MemberDao().selectTutorMember(conn, memNo);
		
		close(conn);
		
		return tutorMem;
	}
	
	
	
	public Lesson selectClass(int clNo) {
		Connection conn = getConnection();
		Lesson l = new TutorDao().selectClass(conn, clNo);
		close(conn);
		return l;
	}
	
	public ArrayList<Schedule> selectSchedule(int clNo) {
		Connection conn = getConnection();
		ArrayList<Schedule> sList = new TutorDao().selectSchedule(conn,clNo);
		close(conn);
		return sList;
	}
	
	
	public int stopClassUpdate(int clNo) {
		Connection conn = getConnection();
		int result = new TutorDao().stopClassUpdate(conn, clNo);

		if(result>0) {
			commit(conn);
		}else {
			rollback(conn);
		}
		close(conn);
		return result;
	}
	
	public int insertClass(Lesson l, ArrayList<Attachment> list, ArrayList<Schedule> sList) {
		Connection conn = getConnection();
		int result1 = new TutorDao().insertClass(conn, l);
		int result2 = new TutorDao().insertClassAttachment(conn,list);
		int result3 = new TutorDao().insertSchedule(conn,sList);
		
		if(result1>0 && result2>0&& result3>0) {
			commit(conn);
		}else {
			rollback(conn);	
		}
		close(conn);
		return result1 * result2* result3;
	}
	
	public ArrayList<Attachment> selectAttachmentList(int clNo) {
		Connection conn = getConnection();
		ArrayList<Attachment> list = new TutorDao().selectAttachmentList(conn, clNo);
		close(conn);
		
		return list;
		
	}
	
	public int updateClass(Lesson l, ArrayList<Attachment> list, ArrayList<Schedule> sList) {
		Connection conn= getConnection();
		int result1 = new TutorDao().updateClass(conn, l);
		int result2 = new TutorDao().updateAttachment(conn,list);
	}
	

	

}
