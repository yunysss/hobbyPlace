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

	
	
	
	
	
	
}
