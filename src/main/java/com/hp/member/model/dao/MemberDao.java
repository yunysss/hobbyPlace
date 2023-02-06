package com.hp.member.model.dao;

import java.io.FileInputStream;
import java.io.IOException;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.Properties;

import static com.hp.common.JDBCTemplate.*;

import com.hp.member.model.vo.Like;
import com.hp.member.model.vo.Member;
import com.hp.register.model.vo.Register;
import com.hp.review.model.vo.Review;

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
		Member m = null;
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
	
	/** 수정한회원정보저장요청 dao메소드
	 * @author 수연
	 * @param conn
	 * @param m
	 * @return result
	 */
	public int updateMember(Connection conn, Member m) {
		int result = 0;
		PreparedStatement pstmt = null;
		String sql = prop.getProperty("updateMember");
		System.out.println("회원정보수정");
		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, m.getMemNick());
			pstmt.setString(2, m.getEmail());
			pstmt.setString(3, m.getPhone());
			pstmt.setString(4, m.getMemAddr());
			pstmt.setString(5, m.getGender());
			pstmt.setString(6, m.getMemBirth());
			pstmt.setString(7, m.getMemProfile());
			pstmt.setString(8, m.getInterest());
			pstmt.setString(9, m.getMemId());
			
			result = pstmt.executeUpdate();
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(pstmt);
		}
		
		return result;
	}

	/** 수정한회원정보 요청메소드
	 * @author 수연
	 * @param conn
	 * @param memId
	 * @return updTeMem
	 */
	public Member selectMember(Connection conn, String memId) {
		Member updateMem = null;
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		String sql = prop.getProperty("selectMember");
		
		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, memId);
			rset = pstmt.executeQuery();
			
			if(rset.next()) {
				updateMem = new Member(rset.getInt("mem_no"),
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
		
		return updateMem;
	}

	/** 수정된 비밀번호 insert dao
	 * @author 수연
	 * @param conn
	 * @param memId
	 * @param memPwd
	 * @param newPwd
	 * @return result
	 */
	public int updatePwd(Connection conn, String memId, String memPwd, String newPwd) {
		int result = 0;
		PreparedStatement pstmt = null;
		String sql = prop.getProperty("updatePwd");
		
		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, newPwd);
			pstmt.setString(2, memId);
			pstmt.setString(3, memPwd);
			
			result = pstmt.executeUpdate();
						
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(pstmt);
		}
		
		return result;
	}

	public int deleteMember(Connection conn, String memId, String memPwd, String memDrop) {
		int count = 0;
		PreparedStatement pstmt = null;
		String sql = prop.getProperty("deleteMember");
		
		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, memDrop);
			pstmt.setString(2, memId);
			pstmt.setString(3,memPwd);
			
			count = pstmt.executeUpdate();
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(pstmt);
		}
		return count;
	}
	
	/** 튜터등록 회원 조회
	 * @author 수정
	 * @param conn
	 * @param memNo
	 * @return
	 */
	public Member selectTutorMember(Connection conn, int memNo) {
		Member tutorMem = null;
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		String sql = prop.getProperty("selectTutorMember");
		
		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, memNo);
			
			rset = pstmt.executeQuery();
			if(rset.next()) {
				tutorMem = new Member(rset.getInt("mem_no"),
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
				
		return tutorMem;
	}

	/** 이메일로 아이디 찾기 위한 이름&이메일 확인용 dao메소드
	 * @author 수연
	 * @param conn
	 * @param memName
	 * @param email
	 * @return m
	 */
	public Member emailCheckForId(Connection conn, String memName, String email) {
		Member m = null;
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		String sql = prop.getProperty("emailCheckForId");
		
		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, memName);
			pstmt.setString(2, email);
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
			close(conn);
		}
		
		return m;
	}

	/** 이메일로 비밀번호 찾기 위한 아이디&이메일 확인용 dao메소드
	 * @author 수연
	 * @param conn
	 * @param memId
	 * @param email
	 * @return m
	 */
	public Member emailCheckForPwd(Connection conn, String memId, String email) {
		Member m = null;
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		String sql = prop.getProperty("emailCheckForPwd");
		
		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, memId);
			pstmt.setString(2, email);
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
			close(conn);
		}
		return m;
	}

	public int updatePwd2(Connection conn, String memId, String memPwd) {
		int result = 0;
		PreparedStatement pstmt = null;
		String sql = prop.getProperty("updatePwd2");
		
		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, memPwd);
			pstmt.setString(2, memId);
			
			result = pstmt.executeUpdate();					
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(pstmt);
		}
		
		return result;
	}

	/** 회원이름, 연락처로 회원정보 조회하는 dao메소드
	 * @author 수연
	 * @param memName
	 * @param phone
	 * @return m
	 */
	public Member phoneCheckForId(Connection conn, String memName, String phone) {
		Member m = null;
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		String sql = prop.getProperty("phoneCheckForId");
		
		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, memName);
			pstmt.setString(2, phone);
			
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
		}finally {
			close(rset);
			close(conn);
		}
		return m;
	}

	/** 회원아이디, 연락처로 회원정보 조회하는 dao메소드
	 * @author 수연
	 * @param conn
	 * @param phone
	 * @param phone2
	 * @return m
	 */
	public Member phoneCheckForPwd(Connection conn, String memId, String phone) {
		Member m = null;
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		String sql = prop.getProperty("phoneCheckForPwd");
		
		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, memId);
			pstmt.setString(2, phone);
			
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
		}finally {
			close(rset);
			close(conn);
		}
		return m;
	}

	public ArrayList<Like> selectMyLikeClassList(Connection conn, int memNo) {
		ArrayList<Like> list = new ArrayList<>();
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		String sql = prop.getProperty("selectMyLikeClassList");
		
		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1,memNo);
			
			rset=pstmt.executeQuery();
			while(rset.next()) {
				list.add(new Like(rset.getInt("cl_no"),
								  rset.getString("cl_name"),
								  rset.getString("distr_name"),
								  rset.getString("cl_price"),
								  rset.getString("cl_thumb"),
								  rset.getInt("star_avg"),
								  rset.getInt("star_count")
						));
			}
	
			
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(rset);
			close(pstmt);
		}
		
		return list;
	}

	public int deleteLikeClassList(Connection conn, int clNo, int memNo) {
		int result=0;
		PreparedStatement pstmt=null;
		String sql = prop.getProperty("deleteLikeClassList");
		
		try {
			pstmt=conn.prepareStatement(sql);
			pstmt.setInt(1, clNo);
			pstmt.setInt(2, memNo);
			
			result=pstmt.executeUpdate();
		} catch (SQLException e) {
			e.printStackTrace();
		}finally {
			close(pstmt);
		}
		
		return result;
	}

	public int insertLikeClassList(Connection conn, int clNo, int memNo) {
		int result=0;
		PreparedStatement pstmt=null;
		String sql = prop.getProperty("insertLikeClassList");
		
		try {
			pstmt=conn.prepareStatement(sql);
			pstmt.setInt(1, clNo);
			pstmt.setInt(2, memNo);
			
			result=pstmt.executeUpdate();
		} catch (SQLException e) {
			e.printStackTrace();
		}finally {
			close(pstmt);
		}
		
		return result;
	}

	public int selectLikeStatus(Connection conn, int clNo, int memNo) {
		int likeStatus = 0;
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		String sql = prop.getProperty("selectLikeStatus");
		
		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, clNo);
			pstmt.setInt(2, memNo);
			
			rset = pstmt.executeQuery();
			if(rset.next()) {
				likeStatus = rset.getInt("like_st");
			}
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(rset);
			close(pstmt);
		}
		return likeStatus;
	}

	public Member phoneCheckForCertifi(Connection conn, String phone) {
		Member m = null;
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		String sql = prop.getProperty("phoneCheckForCertifi");
		
		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, phone);
			rset = pstmt.executeQuery();
			
			if(rset.next()) {
				m = new Member();
				m.setMemNo(rset.getInt("mem_no"));
				m.setPhone(rset.getString("mem_phone"));
			}
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(rset);
			close(pstmt);
		}
		
		return m;
	}

	public int regCount(Connection conn, int no) {
		int r = 0;
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		String sql = prop.getProperty("regCount");
		
		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, no);
			rset = pstmt.executeQuery();
			
			if(rset.next()) {
				 r = rset.getInt("reg");
			}
			
		} catch (SQLException e) {
			e.printStackTrace();
		} finally{
			close(rset);
			close(conn);
		}
		
		return r;
	}

	public int likeCount(Connection conn, int no) {
		int l = 0;
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		String sql = prop.getProperty("likeCount");
		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, no);
			rset = pstmt.executeQuery();
			
			if(rset.next()) {
				l = rset.getInt("like");
			}
			
		} catch (SQLException e) {
			e.printStackTrace();
		} finally{
			close(rset);
			close(conn);
		}
		return l;
	}

	public int revCount(Connection conn, int no) {
		int w = 0;
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		String sql = prop.getProperty("revCount");
		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, no);
			rset = pstmt.executeQuery();
			
			if(rset.next()) {
				w = rset.getInt("rev");
			}
			
		} catch (SQLException e) {
			e.printStackTrace();
		} finally{
			close(rset);
			close(conn);
		}
		return w;
	}

	public Member nickCheck2(Connection conn, int memNo, String checkNick) {
		Member m = null;
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		String sql = prop.getProperty("nickCheck2");
		
		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, memNo);
			pstmt.setString(2, checkNick);
			rset = pstmt.executeQuery();
			if(rset.next()) {
				m = new Member();
				m.setMemNick(rset.getString("MEM_NICKNAME"));
			}
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(rset);
			close(pstmt);
		}
		return m;
	}

	public Member phoneCheckForCertifi2(Connection conn, int memNo, String phone) {
		Member m = null;
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		String sql = prop.getProperty("phoneCheckForCertifi2");
		
		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, memNo);
			pstmt.setString(2, phone);
			rset = pstmt.executeQuery();
			if(rset.next()) {
				m = new Member();
				m.setPhone(rset.getString("MEM_PHONE"));
			}
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(rset);
			close(pstmt);
		}
		return m;
	}

	


	
	
	

}
