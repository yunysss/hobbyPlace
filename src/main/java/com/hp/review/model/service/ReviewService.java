package com.hp.review.model.service;

import static com.hp.common.JDBCTemplate.*;

import java.sql.Connection;
import java.util.ArrayList;

import com.hp.review.model.dao.ReviewDao;
import com.hp.review.model.vo.Register;

public class ReviewService {

	public ArrayList<Register> selectWriteList(int memNo) {
		
		Connection conn = getConnection();
		ArrayList<Register> list = new ReviewDao().selectWriteList(conn, memNo);
		close(conn);
		return list;
	}

	
}
