package com.hp.review.model.service;

import static com.hp.common.JDBCTemplate.*;

import java.sql.Connection;
import java.util.ArrayList;

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

	

	

	
}
