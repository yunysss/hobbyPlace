package com.hp.tutor.model.service;

import static com.hp.common.JDBCTemplate.*;

import java.sql.Connection;

import com.hp.tutor.model.dao.TutorDao;
import com.hp.tutor.model.vo.Tutor;

public class TutorService {
	
	
	public Tutor selectTutorInfo(int memNo) {
		Connection conn = getConnection();
		Tutor t = new TutorDao(). selectTutorInfo(conn, memNo);
		close(conn);
		return t;
	}

}
