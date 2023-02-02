package com.hp.review.model.service;

import static com.hp.common.JDBCTemplate.*;

import java.sql.Connection;
import java.util.ArrayList;

import com.hp.common.model.vo.PageInfo;
import com.hp.review.model.dao.ReviewDao;
import com.hp.review.model.vo.Register;

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

	

	
}
