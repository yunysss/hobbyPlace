package com.hp.admin.model.dao;

import static com.hp.common.JDBCTemplate.close;

import java.io.FileInputStream;
import java.io.IOException;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.Properties;

import com.hp.admin.model.vo.Search;
import com.hp.common.model.vo.Attachment;
import com.hp.common.model.vo.PageInfo;
import com.hp.lesson.model.vo.Category;
import com.hp.lesson.model.vo.Dcategory;
import com.hp.lesson.model.vo.Lesson;
import com.hp.lesson.model.vo.Schedule;
import com.hp.member.model.vo.Like;
import com.hp.member.model.vo.Member;
import com.hp.qna.model.vo.Qna;
import com.hp.register.model.vo.Register;
import com.hp.review.model.vo.Review;
import com.hp.tutor.model.vo.Tutor;



public class AdminDao {
	
	private Properties prop = new Properties();
	public AdminDao() {
	
			try {
				prop.loadFromXML(new FileInputStream(AdminDao.class.getResource("/db/sql/admin-mapper.xml").getPath()));
			} catch (IOException e) {
				e.printStackTrace();
			}
	}
	
	
	

	/**
	 * @author 한빛
	 * @param conn
	 * @return listCount : 등록된 총 클래스 개수 
	 */
	public int selectClassCount(Connection conn) {
		int listCount = 0;
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		String sql = prop.getProperty("selectClassCount");
		try {
			pstmt = conn.prepareStatement(sql);
			rset = pstmt.executeQuery();
			
			if(rset.next()) {
				listCount = rset.getInt("count");
			}
		} catch (SQLException e) {
			e.printStackTrace();
		}finally {
			close(rset);
			close(pstmt);
		
		}
		return listCount;
		
	}
	
	
	/**
	 * @author 한빛
	 * @param conn
	 * @param pi
	 * @return list : 페이징 처리된 클래스 list
	 */
	public ArrayList<Lesson> selectClassList(Connection conn, PageInfo pi){
		ArrayList<Lesson> list = new ArrayList<>();
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		
		String sql = prop.getProperty("selectClassList");
		
		try {
			pstmt=conn.prepareStatement(sql);
			
			int startRow = (pi.getCurrentPage()-1)* pi.getBoardLimit() + 1;
			int endRow = startRow + pi.getBoardLimit() -1;
			
			pstmt.setInt(1, startRow);
			pstmt.setInt(2, endRow);
			
			rset = pstmt.executeQuery();
			
			while(rset.next()) {
				list.add(new Lesson(rset.getInt("cl_no"),
									rset.getString("ct_name"),
									rset.getString("tt_name"),
									rset.getString("cl_name"),
									rset.getDate("enroll_date"),
									rset.getString("cl_status")
						
						));
				
			}
			
		} catch (SQLException e) {
			e.printStackTrace();
		}finally {
			close(rset);
			close(pstmt);
		}
		return list;
	
	}
	
	
	/**
	 * @author 한빛
	 * @param conn
	 * @return cList  카테고리 조회
	 */
	public ArrayList<Category> selectCategoryList(Connection conn){
		ArrayList<Category> cList = new ArrayList<>();
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		
		String sql = prop.getProperty("selectCategoryList");
		
		try {
			pstmt=conn.prepareStatement(sql);
			rset = pstmt.executeQuery();
			
			while(rset.next()) {
				cList.add(new Category(rset.getInt("ct_no"),
									  rset.getString("ct_name")
						));
			}
			
			
		} catch (SQLException e) {
			e.printStackTrace();
		}finally {
			close(rset);
			close(pstmt);
			
		}
		return cList;

	}
	
	/**
	 * @author 한빛
	 * @param conn
	 * @return dList 세부카테고리 조회
	 */
	public ArrayList<Dcategory> selectDcategoryList(Connection conn){
		ArrayList<Dcategory> dList = new ArrayList<>();
		PreparedStatement pstmt = null;
		ResultSet rset =null;
		String sql = prop.getProperty("selectDcategoryList");
		
		try {
			pstmt = conn.prepareStatement(sql);
			rset = pstmt.executeQuery();
			
			while(rset.next()) {
				dList.add(new Dcategory(rset.getInt("ct_dno"),
										rset.getString("ct_no"),
										rset.getString("ct_dname")
						
						));
			}
		} catch (SQLException e) {
			e.printStackTrace();
		}finally {
			close(rset);
			close(pstmt);
		}
		
		return dList;
		
	}
	
	/**
	 * @author 한빛
	 * @param conn
	 * @param clNo
	 * @return l : Lesson객체 
	 */
	public Lesson selectClass(Connection conn, int clNo) {
		Lesson l = null;
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		
		String sql = prop.getProperty("selectClass");
		try {
			pstmt=conn.prepareStatement(sql);
			pstmt.setInt(1, clNo);
			rset = pstmt.executeQuery();
			
			
			if(rset.next()) {
				
				l = new Lesson(rset.getInt("cl_no"),
							rset.getString("ct_name"),
							rset.getString("ct_dname"),
							rset.getString("tt_name"),
							rset.getString("local_name"),
							rset.getString("distr_name"),
							rset.getString("cl_name"),
							rset.getString("cl_address"),
							rset.getInt("cl_max"),
							rset.getString("cl_level"),
							rset.getString("start_date"),
							rset.getString("end_date"),
							rset.getInt("cl_times"),
							rset.getString("cl_schedule"),
							rset.getString("cl_day"),
							rset.getString("cl_price"),
							rset.getString("cl_detail"),
							rset.getString("curriculum"),
							rset.getString("refundPolicy"),
							rset.getString("cl_supplies"),
							rset.getString("keyword"),
							rset.getDate("enroll_date"),
							rset.getString("cl_status"),
							rset.getString("cl_thumb"),
							rset.getString("introduce")
							
						);
			}
		
	     
		} catch (SQLException e) {
			e.printStackTrace();
		}finally{
			close(rset);
			close(pstmt);
		}
		
		return l;

	}
	

	
	/**
	 * @author 한빛
	 * @param clNo
	 * @return Schedule s
	 */
	public ArrayList<Schedule> selectSchedule(Connection conn, int clNo) {
		
		ArrayList<Schedule> sList = new ArrayList<>();
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		
		String sql = prop.getProperty("selectSchedule");
		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, clNo);
			
			rset = pstmt.executeQuery();
			
			while(rset.next()) {
				sList.add(new Schedule(rset.getInt("sch_no"),
								 rset.getString("cl_no"),
								 rset.getInt("session_no"),
								 rset.getString("start_time"),
								 rset.getString("end_time")
						));
			}

		} catch (SQLException e) {
			e.printStackTrace();
		}finally {
			close(rset);
			close(pstmt);
			
		}
		return sList;
		
		
		
		
		
	}


	public Member adminLogin(Connection conn, String userId, String userPwd) {
		Member m = null;
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		
		String sql = prop.getProperty("adminLogin");
		try {
			pstmt=conn.prepareStatement(sql);
			pstmt.setString(1, userId);
			pstmt.setString(2, userPwd);
			
			rset=pstmt.executeQuery();
			
			if(rset.next()) {
				m = new Member(rset.getString("mem_id"),
						       rset.getString("mem_pwd"),
						       rset.getString("mem_name"));
				
			}
		} catch (SQLException e) {
			e.printStackTrace();
		}finally {
			close(rset);
			close(pstmt);
		}
		
		return m;
	}
	
	/**
	 * @author 한빛
	 * @param conn
	 * @return listCount : 등록된 신규 클래스 개수 
	 */
	public int selectNewClassCount(Connection conn) {
		int listCount = 0;
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		String sql = prop.getProperty("selectNewClassCount");
		try {
			pstmt = conn.prepareStatement(sql);
			rset = pstmt.executeQuery();
			
			if(rset.next()) {
				listCount = rset.getInt("count");
			}
		} catch (SQLException e) {
			e.printStackTrace();
		}finally {
			close(rset);
			close(pstmt);
			
		}
		return listCount;
		
	}
	
	
	/**
	 * @author 한빛
	 * @param conn
	 * @param pi
	 * @return list : 페이징 처리된 신규클래스 list
	 */
	public ArrayList<Lesson> selectNewClassList(Connection conn, PageInfo pi){
		ArrayList<Lesson> list = new ArrayList<>();
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		
		String sql = prop.getProperty("selectNewClassList");
		
		try {
			pstmt=conn.prepareStatement(sql);
			
			int startRow = (pi.getCurrentPage()-1)* pi.getBoardLimit() + 1;
			int endRow = startRow + pi.getBoardLimit() -1;
			
			pstmt.setInt(1, startRow);
			pstmt.setInt(2, endRow);
			
			rset = pstmt.executeQuery();
			
			while(rset.next()) {
				list.add(new Lesson(rset.getInt("cl_no"),
									rset.getString("ct_name"),
									rset.getString("tt_name"),
									rset.getString("cl_name"),
									rset.getDate("enroll_date"),
									rset.getString("cl_status")
						
						));
				
			}
			
		} catch (SQLException e) {
			e.printStackTrace();
		}finally {
			close(rset);
			close(pstmt);
		}
		return list;
	
	}
	
	/**
	 * @author 한빛
	 * @param conn
	 * @param clNo
	 * @return t (클래스 번호에 따라 튜터정보조회)
	 */
	public Tutor selectTutor(Connection conn, int clNo) {
		Tutor t = null;
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		String sql = prop.getProperty("selectTutor");
		
		
		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1,clNo);
			rset=pstmt.executeQuery();
			
			if(rset.next()) {
				t = new Tutor(rset.getInt("mem_no"),
							  rset.getString("tt_name"),
							  rset.getString("introduce"),
							  rset.getString("tt_profile")
						
						);
						
			}
					
		} catch (SQLException e) {
			e.printStackTrace();
		}finally {
			close(rset);
			close(pstmt);
		}
		return t;
	}
	
	/**
	 * @author 한빛
	 * @param conn
	 * @param clNo
	 * @return result 클래스 승인 결과
	 */
	public int classApprovalUpdate(Connection conn, int clNo) {
		int result = 0;
		PreparedStatement pstmt = null;
		
		String sql = prop.getProperty("classApprovalUpdate");
		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, clNo);
			
			result = pstmt.executeUpdate();
		} catch (SQLException e) {
			e.printStackTrace();
		}finally {
			close(pstmt);
		}
		return result;
		
	}
	
	/**
	 * @author 한빛
	 * @param conn
	 * @param clNo
	 * @param refuse
	 * @return 클래스 반려 상태변경결과
	 */
	public int classRefuseUpdate(Connection conn, int clNo, String refuse) {
		int result = 0;
		PreparedStatement pstmt = null;
		
		String sql = prop.getProperty("classRefuseUpdate");
		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, refuse);
			pstmt.setInt(2, clNo);
			
			result = pstmt.executeUpdate();
		} catch (SQLException e) {
			e.printStackTrace();
		}finally {
			close(pstmt);
		}
		return result;
		
	}
	
	/**@author 한빛
	 * @param clNo
	 * @return 클래스 상세이미지 조회 리스트 
	 */
	public ArrayList<Attachment> selectAttachmentList(Connection conn, int clNo) {
		ArrayList<Attachment> list = new ArrayList<>();
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		String sql = prop.getProperty("selectAttachment");
		
		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, clNo);
			rset= pstmt.executeQuery();
			
			while(rset.next()) {
				list.add(new Attachment(rset.getString("change_name"),
										rset.getString("file_path")
										));
				     
			}
		} catch (SQLException e) {
			e.printStackTrace();
		}finally {
			close(pstmt);
			close(rset);
		}
		
		return list;
		
	}
	
	public ArrayList<Lesson> searchClass(Connection conn, Search s){
		ArrayList<Lesson> list = new ArrayList<>();
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		String sql = prop.getProperty("searchClass");
		try {
			pstmt=conn.prepareStatement(sql);
			pstmt.setString(1, "%"+s.getKeyword()+"%");
			pstmt.setString(2, "%"+s.getCategory()+"%");
			pstmt.setString(3, s.getStarDate());
			pstmt.setString(4, s.getEndDate());
			pstmt.setString(5, "%"+ s.getStatus()+"%");
			pstmt.setString(6, "%"+s.getCategory()+"%");
			
		
			rset= pstmt.executeQuery();
			while(rset.next()) {
				list.add(new Lesson(rset.getInt("cl_no"),
									rset.getString("ct_name"),
									rset.getString("tt_name"),
									rset.getString("cl_name"),
									rset.getDate("enroll_date"),
									rset.getString("cl_status")
									
						));
			}
		
		} catch (SQLException e) {
			e.printStackTrace();
		}finally {
			close(rset);
			close(pstmt);
		}
		return list;
		
	}



	/** 기본검색으로 회원조회시 회원리스트 select
	 * @author 수연
	 * @param conn
	 * @param sGroup
	 * @param fCategory
	 * @param lineup
	 * @return list
	 */
	public ArrayList<Member> selectMemberList(Connection conn, String sGroup, String fCategory, String lineup) {
		ArrayList<Member> list = new ArrayList<>();
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		String sql = prop.getProperty("selectMemberList1");
		try {
			pstmt=conn.prepareStatement(sql);
			pstmt.setString(1, sGroup);
			pstmt.setString(2, fCategory);
			//pstmt.setString(2, lineup);
			
			rset = pstmt.executeQuery();

			
			while(rset.next()) {
				list.add(new MemberList(rset.getInt("mem_no"),
						            rset.getString("mem_name"),
						            rset.getString("grade"),
						            rset.getString("enroll_date"),
						            rset.getInt("regcount"),
						            rset.getInt("revcount"),
						            rset.getInt("likecount"),
						            rset.getInt("totalpay"),
						            rset.getString("mem_email"),
						            rset.getString("mem_phone"),
						            rset.getString("mem_addr"),
						            rset.getString("gender"),
						            rset.getString("mem_status")));

			}
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(rset);
			close(pstmt);
		}
		
		return list;
	}

	/** 회원번호로 회원정보조회
	 * @author 수연
	 * @param conn
	 * @param memNo
	 * @return m
	 */
	public Member selectMemberByNo(Connection conn, int memNo) {
		Member m = null;
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		String sql = prop.getProperty("selectMemberByNo");
		
		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, memNo);
			
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
	
	/** 회원번호로 qna리스트 조회 Service메소드
	 * @author 수연
	 * @param conn
	 * @param memNo
	 * @return qnaList
	 */
	public ArrayList<Qna> selectAllQna(Connection conn, int memNo) {
		ArrayList<Qna> qnaList = new ArrayList<>();
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		String sql = prop.getProperty("selectAllQna");
		
		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, memNo);
			rset = pstmt.executeQuery();
			
			while(rset.next()) {
				qnaList.add(new Qna(rset.getInt("Q_NO"),
			            rset.getString("Q_TITLE"),
			            rset.getString("Q_CONTENT"),
			            rset.getDate("Q_DATE"),
			            rset.getString("Q_STATUS"),
			            rset.getString("Q_GRADE"),
			            rset.getString("Q_CATEGORY"),
			            rset.getInt("CL_NO"),
			            rset.getInt("Q_MEM_NO"),
			            rset.getString("A_TITLE"),
			            rset.getString("A_CONTENT"),
			            rset.getDate("A_DATE"),
			            rset.getInt("A_MEM_NO")));
				System.out.println(qnaList);
			}
			
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(rset);
			close(conn);
		}
		return qnaList;
	}

	/** 회원번호로 수강한 클래스 리스트 조회용 dao 메소드
	 * @author 수연
	 * @param conn
	 * @param memNo
	 * @return regList
	 */
	public ArrayList<Register> selectAllRegister(Connection conn, int memNo) {
		ArrayList<Register> regList = new ArrayList<>();
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		String sql = prop.getProperty("selectAllRegister");
		
		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, memNo);
			rset = pstmt.executeQuery();
			
			while(rset.next()) {
				regList.add(new Register(rset.getInt("REG_NO"),
									     rset.getString("MEM_NO"),
									     rset.getString("CL_NO"),
									     rset.getString("TEACH_DATE"),
									     rset.getString("reg_date"),
									     rset.getString("sch_no"),
									     rset.getString("reg_pay"),
									     rset.getString("reg_price"),
									     rset.getString("reg_count"),
									     rset.getString("reg_sta"),
									     rset.getString("reg_refuse"),
									     rset.getString("re_enroll"),
									     rset.getString("reg_cal")));
			}
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(rset);
			close(conn);
		}
		
		return null;
	}

	/** 회원번호로 리뷰리스트 조회 Dao 메소드
	 * @author 수연
	 * @param conn
	 * @param memNo
	 * @return revList
	 */
	public ArrayList<Review> selectAllReview(Connection conn, int memNo) {
		ArrayList<Review> revList = new ArrayList<>();
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		String sql = prop.getProperty("selectAllReview");
		
		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, memNo);
			rset = pstmt.executeQuery();
			
			while(rset.next()) {
				revList.add(new Review(rset.getInt("re_no"),
									   rset.getString("content"),
									   rset.getInt("re_star"),
									   rset.getString("re_date"),
									   rset.getString("re_update"),
									   rset.getString("re_sta"),
									   rset.getInt("reg_no"),
									   rset.getInt("cl_no"),
									   rset.getInt("mem_no")));
			}
			
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(rset);
			close(pstmt);
		}
		return revList;
	}




	public ArrayList<Like> selectAllLike(Connection conn, int memNo) {
		ArrayList<Like> likeList = new ArrayList<>();
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		String sql = prop.getProperty("selectAllLike");
		
		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, memNo);
			rset = pstmt.executeQuery();
			
			while(rset.next()) {
				likeList.add(new Like(rset.getString("cl_name"),
						              rset.getInt("mem_no"),
						              rset.getString("like_date")));
			}
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(rset);
			close(pstmt);
		}
		return likeList;
	}
	

	
	
}
