package com.hp.member.model.service;

import java.sql.Connection;

import static com.hp.common.JDBCTemplate.*;
import com.hp.member.model.dao.MemberDao;
import com.hp.member.model.vo.Member;

public class MemberService {

	/** 로그인용 서비스메소드
	 * @author 수연
	 * @param userId, userPwd
	 * @return Member m
	 */
	public Member loginMember(String userId, String userPwd) {
		Connection conn = getConnection();
		Member m = new MemberDao().loginMember(conn, userId, userPwd);
		close(conn);
		return m;
	}
	
	
	
	/**
	 * 회원가입버튼 클릭시 선행되는 이메일중복체크용메소드
	 * @author 수연
	 * @param email
	 * @return eResult
	 */
	public Member checkEmail(String email) {
		Connection conn = getConnection();
		Member eResult = new MemberDao().checkEmail(conn, email);
		
		close(conn);
		return eResult;
	
	}
	

	/** 회원가입용 서비스메소드
	 * @author 수연
	 * @param Member m
	 * @return result
	 */
	public int insertMember(Member m) {
		Connection conn = getConnection();
		
		int result = new MemberDao().insertMember(conn, m);
		
		if(result > 0 ) {
			commit(conn);
		}else {
			rollback(conn);
		}
		
		return result;
	}

	/**
	 * 아이디 중복체크용서비스메소드
	 * @author 수연
	 * @param checkId
	 * @return count
	 */
	public int idCheck(String checkId) {
		Connection conn = getConnection();
		int count = new MemberDao().idCheck(conn, checkId);
		close(conn);
		
		return count;
	}
	
	/**
	 * 닉네임 중복체크용 서비스메소드
	 * @author 수연
	 * @param checkNick
	 * @return count
	 */
	public int nickCheck(String checkNick) {
		Connection conn = getConnection();
		int count = new MemberDao().nickCheck(conn, checkNick);
		close(conn);
		
		return count;
	}

	/** (튜티)회원정보수정용 서비스메소드
	 * @author 수연
	 * @param m
	 * @return updateMem
	 */
	public Member updateMember(Member m) {

	
		Connection conn = getConnection();

		// 일단 수정된 회원정보 insert
		int result = new MemberDao().updateMember(conn, m);
		
		Member updateMem = null;
		
		//insert 성공시 수정된 회원정보 select
		if(result>0) {
			commit(conn);
			updateMem = new MemberDao().selectMember(conn, m.getMemId());
			
		}else {
			rollback(conn);
		}
		
		close(conn);
		return updateMem;
	}


	/** 비밀번호 수정용 service메소드(ajax)
	 * @author 수연
	 * @param memId
	 * @param memPwd
	 * @param newPwd
	 * @return updatePwdMem
	 */
	public Member updatePwd(String memId, String memPwd, String newPwd) {
		Connection conn = getConnection();
		// 1. 수정된 비밀번호 update
		int result = new MemberDao().updatePwd(conn, memId, memPwd, newPwd);
		
		Member updatePwdMem = null;
		// 2. update 성공시 수정된 전체회원정보 select
		if(result > 0) {
			commit(conn);
			updatePwdMem = new MemberDao().selectMember(conn, memId);
		}else {
			rollback(conn);
		}
		return updatePwdMem;
	}


	/** 회원탈퇴용 service메소드(ajax)
	 * @author 수연
	 * @param memId
	 * @param memPwd
	 * @param memDrop
	 * @return count
	 */
	public int deleteMember(String memId, String memPwd, String memDrop) {
		Connection conn = getConnection();
		int count = new MemberDao().deleteMember(conn, memId, memPwd, memDrop);

		if(count > 0) {
			commit(conn);
		}else {
			rollback(conn);
		}
		return count;
	}

	
	
	
	
	
	
}
