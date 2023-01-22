package com.hp.tutor.model.service;

import java.sql.Connection;
import static com.hp.common.JDBCTemplate.*;
import com.hp.tutor.model.vo.Tutor;

public class TutorService {
	
	
	public Tutor selectTutorInfo(int memNo) {
		Connection conn = getConnection();
		Tutor t = new TutorDao(). selectTutorInfo(conn, memNo);
		
	}

}
