package com.hp.qna.model.service;

import static com.hp.common.JDBCTemplate.close;
import static com.hp.common.JDBCTemplate.commit;
import static com.hp.common.JDBCTemplate.getConnection;
import static com.hp.common.JDBCTemplate.rollback;

import java.sql.Connection;
import java.util.ArrayList;

import com.hp.customerService.model.dao.NoticeDao;
import com.hp.member.model.vo.Member;
import com.hp.qna.model.dao.QnaDao;
import com.hp.qna.model.vo.Qna;

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

}
