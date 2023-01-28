package com.hp.register.model.service;

import static com.hp.common.JDBCTemplate.close;
import static com.hp.common.JDBCTemplate.commit;
import static com.hp.common.JDBCTemplate.getConnection;
import static com.hp.common.JDBCTemplate.rollback;

import java.sql.Connection;
import java.util.ArrayList;

import com.hp.register.model.dao.RegisterDao;
import com.hp.register.model.vo.Register;

public class RegisterService {
	
	public ArrayList<Register> selectTutorRegister(int memNo, String status){
		Connection conn = getConnection();
		ArrayList<Register> list = new RegisterDao().selectTutorRegister(conn, memNo, status);
		close(conn);
		return list;
	}
	
	public ArrayList<Register> Register(int memNo, int num){
		Connection conn = getConnection();
		ArrayList<Register> nList = new RegisterDao().selectTutorNewRegister(conn, memNo, num);
		close(conn);
		return nList;
	}
	
	public ArrayList<Register> selectTutorFinRegister(int memNo){
		Connection conn = getConnection();
		ArrayList<Register> fList = new RegisterDao().selectTutorFinRegister(conn, memNo);
		close(conn);
		return fList;
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

}
