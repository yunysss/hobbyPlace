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
	
	/** 회원가입용 서비스메소드
	 * @author 수연
	 * @param Member m
	 * @return int result
	 */
	public int insertMember(Member m) {
		Connection conn = getConnection();
		
		int result1 = new MemberDao().insertMember(conn, m);
		
		int result2 = 1;
		if(m.getMemProfile() != null) {
			result2 = new MemberDao().insertAttachment(conn, m);
		}
		
	
		if(result1 > 0 && result2 > 0) {
			commit(conn);
		}else {
			rollback(conn);
		}
		
		return result1 * result2;
	}
	
	
	
	
	
	
	
}
