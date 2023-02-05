package com.hp.lesson.model.service;

import static com.hp.common.JDBCTemplate.close;
import static com.hp.common.JDBCTemplate.commit;
import static com.hp.common.JDBCTemplate.getConnection;
import static com.hp.common.JDBCTemplate.rollback;

import java.sql.Connection;
import java.util.ArrayList;

import com.hp.admin.model.vo.Search;
import com.hp.common.model.vo.Attachment;
import com.hp.common.model.vo.PageInfo;
import com.hp.lesson.model.dao.LessonDao;
import com.hp.lesson.model.vo.Dcategory;
import com.hp.lesson.model.vo.Lesson;
import com.hp.lesson.model.vo.Schedule;
import com.hp.review.model.vo.Review;
import com.hp.tutor.model.vo.Tutor;

public class LessonService {

	public ArrayList<Lesson> selectMainClass() {
		Connection conn = getConnection();
		ArrayList<Lesson> list = new LessonDao().selectMainClass(conn);
		close(conn);
		return list;
	}

	public ArrayList<Lesson> selectInterestClass(String interest) {
		Connection conn = getConnection();
		ArrayList<Lesson> list = new LessonDao().selectInterestClass(conn, interest);
		close(conn);
		return list;
	}

	public ArrayList<Lesson> selectLikeClass() {
		Connection conn = getConnection();
		ArrayList<Lesson> list = new LessonDao().selectLikeClass(conn);
		close(conn);
		return list;
	}

	public ArrayList<Review> selectReviewClass() {
		Connection conn = getConnection();
		ArrayList<Review> list = new LessonDao().selectReviewClass(conn);
		close(conn);
		return list;
	}

	public Lesson selectClassPage(int clNo) {
		Connection conn = getConnection();
		Lesson le = new LessonDao().selectClassPage(conn, clNo);
		close(conn);
		return le;
	}

	public ArrayList<Attachment> selectAttachment(int clNo, int refType) {
		Connection conn = getConnection();
		ArrayList<Attachment> list = new LessonDao().selectAttachment(conn, clNo, refType);
		close(conn);
		return list;
	}

	public ArrayList<Review> selectClassReview(int clNo) {
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
		if (result > 0) {
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
		if (result > 0) {
			commit(conn);
		} else {
			rollback(conn);
		}
		close(conn);
		return result;
	}

	public ArrayList<Lesson> searchCategoryList(String ct, PageInfo pi) {
		Connection conn = getConnection();
		ArrayList<Lesson> list = new LessonDao().searchCategoryList(conn, ct, pi);

		close(conn);
		return list;
	}

	public ArrayList<Lesson> searchDcategoryList(String dct, PageInfo pi) {
		Connection conn = getConnection();
		ArrayList<Lesson> dList = new LessonDao().searchDcategoryList(conn, dct, pi);
		close(conn);
		return dList;

	}

	public ArrayList<Dcategory> selectDcategory(String ct) {
		Connection conn = getConnection();
		ArrayList<Dcategory> dctList = new LessonDao().selectDcategory(conn, ct);
		close(conn);
		return dctList;
	}

	public ArrayList<Dcategory> selectCategory(String dct) {
		Connection conn = getConnection();
		ArrayList<Dcategory> dctList = new LessonDao().selectCategory(conn, dct);
		close(conn);
		return dctList;
	}

	public int dctSearchCount(String dct) {
		Connection conn = getConnection();
		int count = new LessonDao().dctSearchCount(conn, dct);
		close(conn);
		return count;
	}

	public int ctSearchCount(String ct) {
		Connection conn = getConnection();
		int count = new LessonDao().ctSearchCount(conn, ct);
		close(conn);
		return count;
	}

	public Tutor selectTutorInfo(int clNo) {
		Connection conn = getConnection();
		Tutor t = new LessonDao().selectTutorInfo(conn, clNo);
		close(conn);
		return t;
	}

	public ArrayList<Lesson> selectTutorClass(int clNo) {
		Connection conn = getConnection();
		ArrayList<Lesson> cList = new LessonDao().selectTutorClass(conn, clNo);
		close(conn);
		return cList;
	}

	public ArrayList<Review> selectTutorReview(int clNo) {
		Connection conn = getConnection();
		ArrayList<Review> rList = new LessonDao().selectTutorReview(conn, clNo);
		close(conn);
		return rList;

	}

	public int selectTtClassCount(int clNo) {
		Connection conn = getConnection();
		int cCount = new LessonDao().selectTtClassCount(conn, clNo);
		close(conn);
		return cCount;
	}

	public int selectTtReviewCount(int clNo) {
		Connection conn = getConnection();
		int rCount = new LessonDao().selectTtReviewCount(conn, clNo);
		close(conn);
		return rCount;
	}

	public int keywordSearchCount(String keyword) {
		Connection conn = getConnection();
		int kCount = new LessonDao().keywordSearchCount(conn, keyword);
		close(conn);
		return kCount;

	}

	public ArrayList<Lesson> selectKeywordSearhList(String keyword, PageInfo pi) {
		Connection conn = getConnection();
		ArrayList<Lesson> kList = new LessonDao().selectKeywordSearhList(conn, keyword, pi);
		close(conn);
		return kList;
	}

	public ArrayList<Lesson> categorySort(String category, String sort) {

		Connection conn = getConnection();
		ArrayList<Lesson> list = new LessonDao().categorySort(conn, category,sort);
		close(conn);
		return list;

	}

	public ArrayList<Schedule> getSchedule(int clNo, String calYear, String calMonth, String day) {
		Connection conn = getConnection();
		ArrayList<Schedule> list = new LessonDao().getSchedule(conn, clNo, calYear, calMonth, day);
		close(conn);
		return list;
	}

	
	
	public ArrayList<Lesson> dcategorySort(String dct,String sort) {
		Connection conn = getConnection();
		ArrayList<Lesson> list = new LessonDao().dcategorySort(conn,dct,sort);
		close(conn);
		return list;

	}
	
	
	
	
	
	
	public ArrayList<Lesson> searchDetailClass(Search s,PageInfo pi){
		Connection conn = getConnection();
		ArrayList<Lesson> list = new LessonDao().searchDetailClass(conn, s, pi);
		close(conn);
		return list; 
	}
	
	public int searchDetailCount(Search s){
		Connection conn = getConnection();
		int count = new LessonDao().searchDetailCount(conn, s);
		close(conn);
		return count; 
	}
	
	
	public ArrayList<Lesson> detailSearchSort(Search s){
		Connection conn = getConnection();
		ArrayList<Lesson> list = new LessonDao().detailSearchSort(conn,s);
		close(conn);
		return list;
		
	}

	public ArrayList<Lesson> selectActClass(int memNo) {
		Connection conn = getConnection();
		ArrayList<Lesson> cActiveList = new LessonDao().selectActClass(conn, memNo);
		close(conn);
		return cActiveList;
	}

	public ArrayList<Lesson> selectWaitingClass(int memNo) {
		Connection conn = getConnection();
		ArrayList<Lesson> list = new LessonDao().selectWaitingClass(conn, memNo);
		close(conn);
		return list;
	}

	public ArrayList<Lesson> selectRejectedClass(int memNo) {
		Connection conn = getConnection();
		ArrayList<Lesson> list = new LessonDao().selectRejectedClass(conn, memNo);
		close(conn);
		return list;
	}

	

}
