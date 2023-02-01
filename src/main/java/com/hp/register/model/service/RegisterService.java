package com.hp.register.model.service;

import static com.hp.common.JDBCTemplate.close;
import static com.hp.common.JDBCTemplate.commit;
import static com.hp.common.JDBCTemplate.getConnection;
import static com.hp.common.JDBCTemplate.rollback;

import java.sql.Connection;
import java.util.ArrayList;

import com.hp.common.model.vo.PageInfo;
import com.hp.member.model.vo.Member;
import com.hp.refund.model.dao.RefundDao;
import com.hp.refund.model.vo.Refund;
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
	
	public Register selectLessonRegister(Register r) {
		Connection conn = getConnection();
		Register reg = new RegisterDao().selectLessonRegister(conn, r);
		close(conn);
		return reg;
	}
	
	public Member selectRegisterMem(int memNo) {
		Connection conn = getConnection();
		Member m = new RegisterDao().selectRegisterMem(conn, memNo);
		close(conn);
		return m;
	}
	
	public int reviseRegisterMem(int memNo, String memName, String phone, String email) {
		Connection conn = getConnection();
		int result = new RegisterDao().reviseRegisterMem(conn, memNo, memName, phone, email);
		if(result > 0) {
			commit(conn);
		} else {
			rollback(conn);
		}
		return result;
	}
	
	public int insertRegister(Register r) {
		Connection conn = getConnection();
		int result = new RegisterDao().insertRegister(conn, r);
		
		if(result > 0) {
			commit(conn);
		} else {
			rollback(conn);
		}
		
		return result;
	}
	
	public int selectRegisterNo() {
		Connection conn = getConnection();
		int regNo = new RegisterDao().selectRegisterNo(conn);
		close(conn);
		return regNo;
	}

	/**
	 * @author 수정
	 * @param memNo
	 * @return 로그인한 유저의 결제한 클래스 목록
	 */
	public ArrayList<Register> selectMyClassList(PageInfo pi) {
		Connection conn = getConnection();
		ArrayList<Register> list = new RegisterDao().selectMyClassList(conn, pi);
		close(conn);
		return list;
	}

	/**
	 * @수정
	 * @param memNo
	 * @return listCount
	 */
	public int selectListCount(int memNo) {
		Connection conn = getConnection();
		int listCount = new RegisterDao().selectListCount(conn, memNo);
		close(conn);
		return listCount;
	}
	
	public ArrayList<Register> selectRegisterMng(String keywordType, String keyword, String startDate, String endDate, String status) {
		Connection conn = getConnection();
		ArrayList<Register> list = new RegisterDao().selectRegisterMng(conn, keywordType, keyword, startDate, endDate, status);
		close(conn);
		return list;
	}
	
	public int updateRegisterMng(String regNo, String regSt) {
		Connection conn = getConnection();
		
		int result = new RegisterDao().updateRegisterMng(conn, regNo, regSt);
		
		if(result > 0) {
			commit(conn);
		} else {
			rollback(conn);
		}
		return result;
	}

	public ArrayList<Register> selectMyRefundClassList(PageInfo pi) {
		Connection conn = getConnection();
		ArrayList<Register> refList = new RegisterDao().selectMyRefundClassList(conn, pi);
		close(conn);
		
		return refList;
	}
	


}
