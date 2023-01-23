package com.hp.lesson.model.service;

import static com.hp.common.JDBCTemplate.*;

import java.sql.Connection;
import java.util.ArrayList;

import com.hp.common.model.vo.Attachment;
import com.hp.lesson.model.dao.LessonDao;
import com.hp.lesson.model.vo.Lesson;
import com.hp.review.model.vo.Review;

public class LessonService {
	
	/**
	 * @author 예서
	 * @return list : 튜티 메인페이지 '새로운 클래스'에 띄울 목록
	 */
	public ArrayList<Lesson> selectMainClass(){
		Connection conn = getConnection();
		ArrayList<Lesson> list = new LessonDao().selectMainClass(conn);
		close(conn);
		return list;
	}
	
	/**
	 * @author 예서
	 * @return list : 튜티 메인페이지 '찜이 가장 많은 클래스'에 띄울 목록
	 */
	public ArrayList<Lesson> selectLikeClass(){
		Connection conn = getConnection();
		ArrayList<Lesson> list = new LessonDao().selectLikeClass(conn);
		close(conn);
		return list;
	}
	
	/**
	 * @author 예서
	 * @return list : 튜티 메인페이지 '클래스 후기'에 띄울 목록
	 */
	public ArrayList<Review> selectReviewClass(){
		Connection conn = getConnection();
		ArrayList<Review> list = new LessonDao().selectReviewClass(conn);
		close(conn);
		return list;
	}
	
	/**
	 * @author 예서
	 * @param clNo : 클래스 번호
	 * @return le : 클래스 상세 정보
	 */
	public Lesson selectClassPage(int clNo) {
		Connection conn = getConnection();
		Lesson le = new LessonDao().selectClassPage(conn, clNo);
		close(conn);
		return le;
	}
	
	public ArrayList<Attachment> selectClassAttachment(int clNo){
		Connection conn = getConnection();
		ArrayList<Attachment> list = new LessonDao().selectClassAttachment(conn, clNo);
		close(conn);
		return list;
	}
	
	public ArrayList<Review> selectClassReview(int clNo){
		Connection conn = getConnection();
		ArrayList<Review> list = new LessonDao().selectClassReview(conn, clNo);
		close(conn);
		return list;
	}
	
	public int selectLikeStatus(int clNo, int memNo) {
		Connection conn = getConnection();
		int likeStatus = new LessonDao().selectLikeStatus(conn, clNo, memNo);
		close(conn);
		return likeStatus;
	}
	
	public int insertLikeClass(int clNo, int memNo) {
		Connection conn = getConnection();
		int result = new LessonDao().insertLikeClass(conn, clNo, memNo);
		if(result > 0) {
			commit(conn);
		} else {
			rollback(conn);
		}
		close(conn);
		return result;
	}
	
	public int deleteLikeClass(int clNo, int memNo) {
		Connection conn = getConnection();
		int result = new LessonDao().deleteLikeClass(conn, clNo, memNo);
		if(result > 0) {
			commit(conn);
		} else {
			rollback(conn);
		}
		close(conn);
		return result;
	}

}
