package com.hp.member.model.dao;

import java.io.FileInputStream;
import java.io.IOException;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.Properties;

import static com.hp.common.JDBCTemplate.*;

import com.hp.member.model.vo.Member;

public class MemberDao {
	
	private Properties prop = new Properties();
	
	public MemberDao(){
		String filePath = MemberDao.class.getResource("/db/sql/member-mapper.xml").getPath();
		
		try {
			prop.loadFromXML(new FileInputStream(filePath));
		} catch (IOException e) {
			e.printStackTrace();
		}
	}
	
	/** 회원로그인용 dao메소드
	 * @author 수연
	 * @param userId, userPwd
	 * @return conn, Member m
	 */
	public Member loginMember(Connection conn, String userId, String userPwd) {
		Member m = new Member();
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		String sql = prop.getProperty("loginMember");
		
		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, userId);
			pstmt.setString(2, userPwd);
			
			rset = pstmt.executeQuery();
			
			if(rset.next()) {
				m = new Member(rset.getInt("mem_no"),
						       rset.getString("mem_id"),
						       rset.getString("mem_pwd"),
						       rset.getString("mem_name"),
						       rset.getString("mem_nickname"),
						       rset.getString("mem_email"),
						       rset.getString("mem_phone"),
						       rset.getString("mem_addr"),
						       rset.getString("gender"),
						       rset.getString("mem_birth"),
						       rset.getString("mem_profile"),
						       rset.getString("interest"),
						       rset.getString("grade"),
						       rset.getDate("enroll_date"),
						       rset.getDate("mem_update"),
						       rset.getString("mem_status"),
						       rset.getString("mem_drop"));
			}
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(rset);
			close(pstmt);
		}
		return m;
		
	}
	/** 회원가입버튼 클릭시 선행되는 이메일중복체크용 dao메소드
	 * @author 수연
	 * @param conn
	 * @param email
	 * @return result
	 */
	public Member checkEmail(Connection conn, String email) {
		Member eResult = null;
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		String sql = prop.getProperty("checkEmail");
		
		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, email);
			
			rset = pstmt.executeQuery();
			
			if(rset.next()) {
				eResult = new Member();
				eResult.setMemNo(rset.getInt("mem_no"));
			}
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(rset);
			close(pstmt);
		}
		
		return eResult;
	}
	
	/** 회원가입용 dao메소드
	 * @author 수연
	 * @param conn
	 * @param m
	 * @return int result
	 */
	public int insertMember(Connection conn, Member m) {
		int result = 0;
		PreparedStatement pstmt = null;
		String sql = prop.getProperty("insertMember");
		
		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, m.getMemId());
			pstmt.setString(2, m.getMemPwd());
			pstmt.setString(3, m.getMemName());
			pstmt.setString(4, m.getMemNick());
			pstmt.setString(5, m.getEmail());
			pstmt.setString(6, m.getPhone());
			pstmt.setString(7, m.getMemAddr());
			pstmt.setString(8, m.getGender());
			pstmt.setString(9, m.getMemBirth());
			pstmt.setString(10, m.getMemProfile());
			pstmt.setString(11, m.getInterest());
			
			result = pstmt.executeUpdate();
			
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(pstmt);
		}
		return result;
	}
	
	/** 아이디중복체크
	 * @author 수연
	 * @param conn
	 * @param checkId
	 * @return count
	 */
	public int idCheck(Connection conn, String checkId) {
		int count = 0;
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		String sql = prop.getProperty("idCheck");
		
		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, checkId);
			rset = pstmt.executeQuery();
			if(rset.next()) {
				count = rset.getInt("count");
			}
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(rset);
			close(pstmt);
		}
		return count;
	}
	/**
	 * 닉네임 중복체크용메소드
	 * @author 수연
	 * @param conn
	 * @param checkNick
	 * @return count
	 */
	public int nickCheck(Connection conn, String checkNick) {
		int count = 0;
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		String sql = prop.getProperty("nickCheck");
		
		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, checkNick);
			rset = pstmt.executeQuery();
			if(rset.next()) {
				count = rset.getInt("count");
			}
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(rset);
			close(pstmt);
		}
		return count;
	}
	/** 회원정보업데이트요청시 기존프로필사진 DB에서 지우기위한 메소드
	 * 
	 * @param conn
	 * @param memId
	 * @return
	 */
	public Member deleteProfile(Connection conn, String memId) {
		Member delProfile = null;
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		String sql = prop.getProperty("deleteProfile");
		
		return delProfile;
	}

	
	
	
	
	
	
	
	
	

}
