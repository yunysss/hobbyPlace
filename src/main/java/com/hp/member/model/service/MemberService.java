package com.hp.member.model.service;

import static com.hp.common.JDBCTemplate.close;
import static com.hp.common.JDBCTemplate.commit;
import static com.hp.common.JDBCTemplate.getConnection;
import static com.hp.common.JDBCTemplate.rollback;

import java.sql.Connection;
import java.util.ArrayList;

import com.hp.member.model.dao.MemberDao;
import com.hp.member.model.vo.Like;
import com.hp.member.model.vo.Member;
import com.hp.register.model.vo.Register;
import com.hp.review.model.vo.Review;

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
		close(conn);
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
		close(conn);
		return count;
	}


	/** 이메일로 아이디 찾기 위한 이름&이메일 확인용 service메소드
	 * @author 수연
	 * @param memName
	 * @param email
	 * @return m
	 */
	public Member emailCheckForId(String memName, String email) {
		Connection conn = getConnection();
		Member m = new MemberDao().emailCheckForId(conn, memName, email);
		
		close(conn);
		return m;
	}

	/** 이메일로 비밀번호 찾기 위한 아이디&이메일 확인용 service메소드
	 * @author 수연
	 * @param memId
	 * @param email
	 * @return m
	 */
	public Member emailCheckForPwd(String memId, String email) {
		Connection conn = getConnection();
		Member m = new MemberDao().emailCheckForPwd(conn, memId, email);
		
		close(conn);
		return m;
	}


	/** 회원아이디로 새비밀번호 설정후 새 회원정보 받아오기 위한 service
	 * @author 수연
	 * @param memId
	 * @param memPwd
	 * @return updatePwdMem
	 */
	public Member updatePwd2(String memId, String memPwd) {
		Connection conn = getConnection();
		int result = new MemberDao().updatePwd2(conn, memId, memPwd);
		
		Member updatePwdMem = null;
		// update 성공시 수정된 전체회원정보 select
		if(result > 0) {
			commit(conn);
			updatePwdMem = new MemberDao().selectMember(conn, memId);
		}else {
			rollback(conn);
		}
		return updatePwdMem;

	}


	/** 회원이름, 연락처로 회원정보 조회하는 service메소드
	 * @author 수연
	 * @param memName
	 * @param phone
	 * @return m
	 */
	public Member phoneCheckForId(String memName, String phone) {
		Connection conn = getConnection();
		Member m = new MemberDao().phoneCheckForId(conn, memName, phone);
		close(conn);
		return m;
	}


	/** 회원아이디, 연락처로 회원정보 조회하는 service메소드
	 * @author 수연
	 * @param memId
	 * @param phone
	 * @return m
	 */
	public Member phoneCheckForPwd(String memId, String phone) {
		Connection conn = getConnection();
		Member m = new MemberDao().phoneCheckForPwd(conn, memId, phone);
		close(conn);
		return m;
	}



	public ArrayList<Like> selectMyLikeClassList(int memNo) {
		Connection conn = getConnection();
		ArrayList<Like> list =new MemberDao().selectMyLikeClassList(conn, memNo);
		close(conn);
		return list;
	}



	public int deleteLikeClassList(int clNo, int memNo) {
		Connection conn = getConnection();
		int result = new MemberDao().deleteLikeClassList(conn,clNo,memNo);
		if (result > 0) {
			commit(conn);
		} else {
			rollback(conn);
		}
		close(conn);
		
		return result;
	}



	public int insertLikeClassList(int clNo, int memNo) {
		Connection conn = getConnection();
		int result = new MemberDao().insertLikeClassList(conn,clNo,memNo);
		if (result > 0) {
			commit(conn);
		} else {
			rollback(conn);
		}
		close(conn);
		
		return result;
	}



	public int selectMyLikeStatus(int clNo, int memNo) {
		Connection conn = getConnection();
		int likeStatus = new MemberDao().selectLikeStatus(conn, clNo, memNo);
		close(conn);
		return likeStatus;
	}



	public Member phoneCheckForCertifi(String phone) {
		Connection conn = getConnection();
		Member m = new MemberDao().phoneCheckForCertifi(conn, phone);
		close(conn);
		return m;
	}



	public int regCount(int no) {
		Connection conn = getConnection();
		int r = new MemberDao().regCount(conn, no);
		close(conn);
		return r;
	}



	public int likeCount(int no) {
		Connection conn = getConnection();
		int l = new MemberDao().likeCount(conn, no);
		close(conn);
		return l;
	}



	public int revCount(int no) {
		Connection conn = getConnection();
		int w = new MemberDao().revCount(conn, no);
		close(conn);
		return w;
	}



	public Member nickCheck2(int memNo, String checkNick) {
		Connection conn = getConnection();
		Member m = new MemberDao().nickCheck2(conn, memNo, checkNick);
		close(conn);
		
		return m;
	}



	public Member phoneCheckForCertifi2(int memNo, String phone) {
		Connection conn = getConnection();
		Member m = new MemberDao().phoneCheckForCertifi2(conn, memNo, phone);
		close(conn);
		
		return m;
	}





	
}
