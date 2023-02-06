package com.hp.qna.model.service;

import static com.hp.common.JDBCTemplate.close;
import static com.hp.common.JDBCTemplate.commit;
import static com.hp.common.JDBCTemplate.getConnection;
import static com.hp.common.JDBCTemplate.rollback;

import java.sql.Connection;
import java.util.ArrayList;

import com.hp.customerService.model.dao.NoticeDao;
import com.hp.lesson.model.vo.Lesson;
import com.hp.member.model.vo.Member;
import com.hp.qna.model.dao.QnaDao;
import com.hp.qna.model.vo.Qna;
import com.hp.register.model.vo.Register;

public class QnaService {
	
	public ArrayList<Qna> selectTutorQnaList(int MemNo){
		Connection conn = getConnection();
		
		ArrayList<Qna> list = new QnaDao().selectTutorQnaList(conn, MemNo);
		
		close(conn);
		return list;
	}
	
	public int insertTutorQna(Qna q) {
		Connection conn = getConnection();
		
		int result = new QnaDao().insertTutorQna(conn, q);
		if(result > 0) {
			commit(conn);
		}else {
			rollback(conn);
		}
		close(conn);
		return result;
		
	}
	
	public Qna selectQnaDetail(int no) {
		Connection conn = getConnection();
		Qna q = new QnaDao().selectQnaDetail(conn, no);
		close(conn);
		return q;
	}
	
	public ArrayList<Qna> selectQnaListTutor(){
		Connection conn = getConnection();
		
		ArrayList<Qna> list1 = new QnaDao().selectQnaListTutor(conn);
		
		close(conn);
		return list1;
	}
	
	public ArrayList<Qna> selectQnaListTutee(){
		Connection conn = getConnection();
		
		ArrayList<Qna> list2 = new QnaDao().selectQnaListTutee(conn);
		
		close(conn);
		return list2;
	}
	
	public int insertQnaAnswer(Qna q) {
		Connection conn = getConnection();
		
		int result = new QnaDao().insertQnaAnswer(conn, q);
		if(result > 0) {
			commit(conn);
		}else {
			rollback(conn);
		}
		close(conn);
		return result;
		
	}
	
	public int insertTuteeToTutorQna(Qna q) {
		Connection conn = getConnection();
		int result = new QnaDao().insertTuteeToTutorQna(conn, q);
		
		if(result > 0) {
			commit(conn);
		}else {
			rollback(conn);
		}
		close(conn);
		return result;
	}
	
	/** 튜터가 작성한 qna리스트 조회
	 * @author 수연
	 * @param memNo
	 * @return
	 */
	public ArrayList<Qna> ttSelectAllQna1(int memNo) {
		Connection conn = getConnection();
		ArrayList<Qna> qList = new QnaDao().ttSelectAllQna1(conn, memNo);
		close(conn);
		return qList;
	}

	public ArrayList<Qna> ttSelectAllQna2(int memNo) {
		Connection conn = getConnection();
		ArrayList<Qna> aList = new QnaDao().ttSelectAllQna2(conn, memNo);
		close(conn);
		return aList;
	}
	
	public ArrayList<Lesson> selectClassListQna(int MemNo) {
		Connection conn = getConnection();
		ArrayList<Lesson> list  = new QnaDao().selectClassListQna(conn, MemNo);
		close(conn);
		return list;
	}
	
	public int insertTuteeQna(Qna q) {
		Connection conn = getConnection();
		
		int result = new QnaDao().insertTuteeQna(conn, q);
		if(result > 0) {
			commit(conn);
		}else {
			rollback(conn);
		}
		close(conn);
		return result;
		
	}
	
	public int insertTuteeQnaTutor(Qna q) {
		Connection conn = getConnection();
		
		int result = new QnaDao().insertTuteeQnaTutor(conn, q);
		if(result > 0) {
			commit(conn);
		}else {
			rollback(conn);
		}
		close(conn);
		return result;
		
	}

}
