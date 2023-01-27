package com.hp.tutor.model.service;

import static com.hp.common.JDBCTemplate.close;
import static com.hp.common.JDBCTemplate.commit;
import static com.hp.common.JDBCTemplate.getConnection;
import static com.hp.common.JDBCTemplate.rollback;

import java.sql.Connection;
import java.util.ArrayList;

import com.hp.admin.model.dao.AdminDao;
import com.hp.common.model.vo.PageInfo;
import com.hp.lesson.model.vo.Category;
import com.hp.lesson.model.vo.Dcategory;
import com.hp.lesson.model.vo.Lesson;
import com.hp.lesson.model.vo.Schedule;
import com.hp.register.model.vo.Register;
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
	
	public ArrayList<Register> selectTutorRegister(int memNo){
		Connection conn = getConnection();
		ArrayList<Register> rList = new TutorDao().selectTutorRegister(conn, memNo);
		close(conn);
		return rList;
	}
	
	public ArrayList<Register> selectTutorNewRegister(int memNo, int num){
		Connection conn = getConnection();
		ArrayList<Register> nList = new TutorDao().selectTutorNewRegister(conn, memNo, num);
		close(conn);
		return nList;
	}
	
	public ArrayList<Register> selectTutorFinRegister(int memNo){
		Connection conn = getConnection();
		ArrayList<Register> fList = new TutorDao().selectTutorFinRegister(conn, memNo);
		close(conn);
		return fList;
	}
	
	public Register selectDetailApproval(int regNo) {
		Connection conn = getConnection();
		Register r = new TutorDao().selectDetailApproval(conn, regNo);
		close(conn);
		return r;
	}
	
	public int updateRegister(int regSta, int regNo) {
		Connection conn = getConnection();
		int result = new TutorDao().updateRegister(conn, regSta, regNo);
		if(result > 0) {
			commit(conn);
		} else {
			rollback(conn);
		}
		return result;
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

	

}
