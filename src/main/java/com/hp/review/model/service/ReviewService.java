package com.hp.review.model.service;

import static com.hp.common.JDBCTemplate.*;

import java.sql.Connection;
import java.util.ArrayList;

import com.hp.common.model.vo.Attachment;
import com.hp.common.model.vo.PageInfo;
import com.hp.review.model.dao.ReviewDao;
import com.hp.review.model.vo.Register;
import com.hp.review.model.vo.Review;

public class ReviewService {
	
	
	/**@author 수정
	 * @param memNo
	 * @return 리뷰안쓴 클래스 총개수
	 */
	public int selectWriteListCount(int memNo) {
		Connection conn = getConnection();
		int listCount = new ReviewDao().selectWriteListCount(conn, memNo);
		close(conn);
		return listCount;
	}

	/**
	 * @수정
	 * @param memNo
	 * @return
	 */
	public ArrayList<Register> selectWriteList(PageInfo wpi) {
		
		Connection conn = getConnection();
		ArrayList<Register> list = new ReviewDao().selectWriteList(conn, wpi);
		close(conn);
		return list;
	}

	/**
	 * @내가 쓴 리뷰 총 개수
	 * @param memNo
	 * @return
	 */
	public int selectMyReviewListCount(int memNo) {
		Connection conn = getConnection();
		int listCount = new ReviewDao().selectMyReviewListCount(conn, memNo);
		close(conn);
		return listCount;
	}

	public ArrayList<Review> selectMyReviewList(PageInfo rePi) {
		Connection conn = getConnection();
		ArrayList<Review> list = new ReviewDao().selectMyReviewList(conn, rePi);
		close(conn);
		return list;
	}

	public ArrayList<Review> selectReviewList(int memNo) {
		Connection conn = getConnection();
		ArrayList<Review> list = new ReviewDao().selectReviewList(conn, memNo);
		close(conn);
		return list;
	}


	public int deleteReview(int reNo) {
		Connection conn = getConnection();
		int result = new ReviewDao().deleteReview(conn, reNo);
		if(result>0) {
			commit(conn);
		}else {
			rollback(conn);
		}
		close(conn);
		return result;

	}

	
	
	
	public Register selectEnrollFormClass(int regNo) {
		Connection conn = getConnection();
		Register er = new ReviewDao().selectEnrollFormClass(conn, regNo);
		close(conn);
		return er;
	}

	
	
	public ArrayList<Review> selectTutorReview(Review r){
		Connection conn = getConnection();
		ArrayList<Review> list = new ReviewDao().selectTutorReview(conn, r);
		close(conn);
		return list;
	}
	
	public ArrayList<Review> selectAdminSearchReview(Review r){
		Connection conn = getConnection();
		ArrayList<Review> list = new ReviewDao().selectAdminSearchReview(conn, r);
		close(conn);
		return list;
	}
	
	public Review selectReviewDetail(int reNo) {
		Connection conn = getConnection();
		Review r = new ReviewDao().selectReviewDetail(conn, reNo);
		close(conn);
		return r;
	}
	public int insertReview(Review r, ArrayList<Attachment> list, int regNo) {
		Connection conn = getConnection();
		int result1 = new ReviewDao().insertReview(conn, r);
		int result2 = new ReviewDao().insertAttachment(conn,list);
		int result3 = new ReviewDao().updateReEnroll(conn, regNo);
		
		if(result1>0 && result2>0 && result3>0) {
			commit(conn);
		} else {
			rollback(conn);
			
		}close(conn);
		
		return result1*result2*result3;
	}

	public Review myReviewDetailView(int reNo) {
		Connection conn = getConnection();
		Review dr = new ReviewDao().myReviewDetailView(conn, reNo);
		close(conn);
		return dr;
		
	}

	public ArrayList<Attachment> selectAttachment(int reNo) {
		Connection conn = getConnection();
		ArrayList<Attachment> list = new ReviewDao().selectAttachment(conn, reNo);
		close(conn);
		
		return list;
	}
}
