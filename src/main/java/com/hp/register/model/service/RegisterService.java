package com.hp.register.model.service;

import static com.hp.common.JDBCTemplate.close;
import static com.hp.common.JDBCTemplate.commit;
import static com.hp.common.JDBCTemplate.getConnection;
import static com.hp.common.JDBCTemplate.rollback;

import java.sql.Connection;
import java.util.ArrayList;

import com.hp.lesson.model.vo.Lesson;
import com.hp.member.model.vo.Member;
import com.hp.register.model.dao.RegisterDao;
import com.hp.register.model.vo.Register;

public class RegisterService {
	
	public ArrayList<Register> selectTutorRegister(int memNo, String status){
		Connection conn = getConnection();
		ArrayList<Register> list = new RegisterDao().selectTutorRegister(conn, memNo, status);
		close(conn);
		return list;
	}
	
	public Register selectDetailApproval(int regNo) {
		Connection conn = getConnection();
		Register r = new RegisterDao().selectDetailApproval(conn, regNo);
		close(conn);
		return r;
	}
	
	public int updateRegister(int regSta, int regNo) {
		Connection conn = getConnection();
		int result = new RegisterDao().updateRegister(conn, regSta, regNo);
		if(result > 0) {
			commit(conn);
		} else {
			rollback(conn);
		}
		return result;
	}
	
	public Lesson selectLessonRegister(Lesson l) {
		Connection conn = getConnection();
		Lesson le = new RegisterDao().selectLessonRegister(conn, l);
		close(conn);
		return le;
	}
	
	public Member selectRegisterMem(int memNo) {
		Connection conn = getConnection();
		Member m = new RegisterDao().selectRegisterMem(conn, memNo);
		close(conn);
		return m;
	}

	public ArrayList<Register> selectMyClassList(int memNo) {
		Connection conn = getConnection();
		ArrayList<Register> list = new RegisterDao().selectRegisterList(conn, memNo);
		close(conn);
		return list;
	}

}
