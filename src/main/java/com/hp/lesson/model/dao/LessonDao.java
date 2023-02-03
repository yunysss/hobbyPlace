package com.hp.lesson.model.dao;

import static com.hp.common.JDBCTemplate.close;

import java.io.FileInputStream;
import java.io.IOException;
import java.io.Reader;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.Properties;

import com.hp.admin.model.vo.Search;
import com.hp.common.model.vo.Attachment;
import com.hp.common.model.vo.PageInfo;
import com.hp.lesson.model.vo.Dcategory;
import com.hp.lesson.model.vo.Lesson;
import com.hp.lesson.model.vo.Schedule;
import com.hp.review.model.vo.Review;
import com.hp.tutor.model.vo.Tutor;

public class LessonDao {
	
private Properties prop = new Properties();
	
	public LessonDao() {
		
		try {
			prop.loadFromXML(new FileInputStream(LessonDao.class.getResource("/db/sql/class-mapper.xml").getPath()));
		} catch (IOException e) {
			e.printStackTrace();
		}
	}
	
	/**
	 * @author 예서
	 * @param conn
	 * @return list : 튜티 메인페이지 '새로운 클래스'에 띄울 목록
	 */
	public ArrayList<Lesson> selectMainClass(Connection conn){
		ArrayList<Lesson> list = new ArrayList<>();
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		String sql = prop.getProperty("selectMainClass");
		
		try {
			pstmt = conn.prepareStatement(sql);
			
			rset = pstmt.executeQuery();
			
			while(rset.next()) {
				Lesson ls = new Lesson(rset.getInt("cl_no"),
									   rset.getString("local_name"),
									   rset.getString("distr_name"),
									   rset.getString("cl_name"),
									   rset.getString("cl_price"),
									   rset.getString("cl_thumb"),
									   rset.getInt("star_avg"),
									   rset.getInt("star_count"));
				list.add(ls);
			}
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(rset);
			close(pstmt);
		}
		return list;
	}
	
	/**
	 * @author 예서
	 * @param conn
	 * @return list : 튜티 메인페이지 '좋아할만한 클래스'에 띄울 목록
	 */
	public ArrayList<Lesson> selectInterestClass(Connection conn, String interest){
		ArrayList<Lesson> list = new ArrayList<>();
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		String sql = prop.getProperty("selectInterestClass");
		
		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, interest);
			rset = pstmt.executeQuery();
			while(rset.next()) {
				Lesson ls = new Lesson(rset.getInt("cl_no"),
									   rset.getString("local_name"),
									   rset.getString("distr_name"),
									   rset.getString("cl_name"),
									   rset.getString("cl_price"),
									   rset.getString("cl_thumb"),
									   rset.getInt("star_avg"),
									   rset.getInt("star_count"));
				list.add(ls);
			}
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(rset);
			close(pstmt);
		}
		return list;
	}
	
	/**
	 * @author 예서
	 * @param conn
	 * @return list : 튜티 메인페이지 '찜이 가장 많은 클래스'에 띄울 목록
	 */
	public ArrayList<Lesson> selectLikeClass(Connection conn){
		ArrayList<Lesson> list = new ArrayList<>();
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		String sql = prop.getProperty("selectLikeClass");
		
		try {
			pstmt = conn.prepareStatement(sql);
			
			rset = pstmt.executeQuery();
			
			while(rset.next()) {
				Lesson ls = new Lesson(rset.getInt("cl_no"),
									   rset.getString("local_name"),
									   rset.getString("distr_name"),
									   rset.getString("cl_name"),
									   rset.getString("cl_price"),
									   rset.getString("cl_thumb"),
									   rset.getInt("star_avg"),
									   rset.getInt("star_count"));
				list.add(ls);
			}
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(rset);
			close(pstmt);
		}
		return list;
	}
	
	/**
	 * @author 예서
	 * @param conn
	 * @return list : 튜티 메인페이지 '클래스 후기'에 띄울 목록
	 */
	public ArrayList<Review> selectReviewClass(Connection conn){
		ArrayList<Review> list = new ArrayList<>();
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		String sql = prop.getProperty("selectReviewClass");
		
		try {
			pstmt = conn.prepareStatement(sql);
			
			rset = pstmt.executeQuery();
			
			while(rset.next()) {
				Review r = new Review(rset.getInt("re_no"),
									   rset.getString("content"),
									   rset.getInt("re_star"),
									   rset.getInt("cl_no"),
									   rset.getString("cl_name"),
									   rset.getString("cl_thumb"));
				list.add(r);
			}
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(rset);
			close(pstmt);
		}
		return list;
	}
	/**
	 * @author 예서
	 * @param clNo 클래스번호
	 * @return 클래스 상세페이지 내용
	 */
	public Lesson selectClassPage(Connection conn, int clNo) {
		Lesson le = null;
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		String sql = prop.getProperty("selectClassPage");
		
		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, clNo);
			
			rset = pstmt.executeQuery();
			if(rset.next()) {
				le = new Lesson(
								rset.getInt("cl_no"),
						        rset.getString("ct_name"),
						        rset.getString("ct_dname"),
						        rset.getString("tt_name"),
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
						        rset.getString("cl_supplies"),
						        rset.getString("cl_thumb"),
						        rset.getInt("star_avg"),
						        rset.getInt("star_count"),
						        rset.getInt("like_count"),
						        rset.getString("tt_profile"),
						        rset.getString("mem_no")
						        );
			}
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(rset);
			close(pstmt);
		}
		
		return le;
	}
	
	/**
	 * @author 예서
	 * @param clNo 클래스 번호
	 * @param refType 게시판 타입(0(공지사항)/1(클래스)/2(후기)/3(이용안내))
	 * @return 첨부파일 리스트
	 */
	public ArrayList<Attachment> selectAttachment(Connection conn, int clNo, int refType){
		ArrayList<Attachment> list = new ArrayList<>();
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		String sql = prop.getProperty("selectAttachment");
		
		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, clNo);
			pstmt.setInt(2, refType);
			rset = pstmt.executeQuery();
			
			while(rset.next()) {
				Attachment at = new Attachment();
				at.setFileNo(rset.getInt("file_no"));
				at.setChangeName(rset.getString("change_name"));
				at.setFilePath(rset.getString("file_path"));
				
				list.add(at);
			}
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(rset);
			close(pstmt);
		}
		
		return list;
		
	}
	
	/**
	 * @author 예서
	 * @param clNo 클래스번호
	 * @return 클래스 리뷰
	 */
	public ArrayList<Review> selectClassReview(Connection conn, int clNo){
		ArrayList<Review> list = new ArrayList<>();
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		String sql = prop.getProperty("selectClassReview");
		
		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, clNo);
			rset = pstmt.executeQuery();
			while(rset.next()) {
				list.add(new Review(rset.getInt("re_no"),
						            rset.getString("content"),
						            rset.getInt("re_star"),
						            rset.getString("re_date"),
						            rset.getString("re_update"),
						            rset.getString("mem_nickname"),
						            rset.getString("mem_profile")
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
	
	/**
	 * @author 예서
	 * @param clNo 클래스번호
	 * @param memNo 회원번호
	 * @return 찜 여부
	 */
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
	
	/**
	 * @author 예서
	 * @param clNo 클래스번호
	 * @param memNo 회원번호
	 * @return 찜하기
	 */
	public int insertLikeClass(Connection conn, int clNo, int memNo) {
		int result = 0;
		PreparedStatement pstmt = null;
		String sql = prop.getProperty("insertLikeClass");
		
		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, clNo);
			pstmt.setInt(2, memNo);
			
			result = pstmt.executeUpdate();
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(pstmt);
		}
		return result;
	}
	
	/**
	 * @author 예서
	 * @param clNo 클래스번호
	 * @param memNo 회원번호
	 * @return 찜하기 해제
	 */
	public int deleteLikeClass(Connection conn, int clNo, int memNo) {
		int result = 0;
		PreparedStatement pstmt = null;
		String sql = prop.getProperty("deleteLikeClass");
		
		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, clNo);
			pstmt.setInt(2, memNo);
			
			result = pstmt.executeUpdate();
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(pstmt);
		}
		return result;
	}
	
	
	/**
	 * @author 한빛
	 * @param conn
	 * @param ct
	 * @return list 카테고리 대분류 검색결과
	 */
	public ArrayList<Lesson> searchCategoryList(Connection conn,String ct,PageInfo pi){
		 ArrayList<Lesson> list =new ArrayList<>();
		 PreparedStatement pstmt = null;
		 ResultSet rset = null;
		 
		 String sql = prop.getProperty("searchCategoryList");
		 try {
			pstmt = conn.prepareStatement(sql);

			int startRow = (pi.getCurrentPage()-1)* pi.getBoardLimit() + 1;
			int endRow = startRow + pi.getBoardLimit() -1;
			pstmt.setString(1, ct);
			pstmt.setInt(2, startRow);
			pstmt.setInt(3, endRow);
		

			rset = pstmt.executeQuery();
			while(rset.next()) {
				list.add(new Lesson(rset.getInt("cl_no"),
						            rset.getString("ct_no"),
									rset.getString("ct_name"),
									rset.getString("ct_dno"),
									rset.getString("ct_dname"),
									rset.getString("local_name"),
									rset.getString("distr_name"),
									rset.getString("cl_name"),
									rset.getString("cl_price"),
									rset.getString("cl_thumb"),
									rset.getInt("star_avg"),
									rset.getInt("star_count")
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
	 * @param dct
	 * @return dlist 세부 카테고리 결과
	 */
	public ArrayList<Lesson> searchDcategoryList(Connection conn, String dct,PageInfo pi){
		ArrayList<Lesson> dList = new ArrayList<>();
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		
		 String sql = prop.getProperty("searchDcategoryList");
		 try {
			pstmt= conn.prepareStatement(sql);
			
			int startRow = (pi.getCurrentPage()-1)* pi.getBoardLimit() + 1;
			int endRow = startRow + pi.getBoardLimit() -1;
			pstmt.setString(1, dct);
			pstmt.setInt(2, startRow);
			pstmt.setInt(3, endRow);
		
			
			rset = pstmt.executeQuery();
			while(rset.next()){
				dList.add(new Lesson(rset.getInt("cl_no"),
						            rset.getString("ct_no"),
									rset.getString("ct_name"),
									rset.getString("ct_dno"),
									rset.getString("ct_dname"),
									rset.getString("local_name"),
									rset.getString("distr_name"),
									rset.getString("cl_name"),
									rset.getString("cl_price"),
									rset.getString("cl_thumb"),
									rset.getInt("star_avg"),
									rset.getInt("star_count")
						));
			
			}
			  //System.out.println(sql);
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
	 * @return dctList 세부카테고리 조회
	 */
	public ArrayList<Dcategory> selectDcategory(Connection conn, String ct){
		
		ArrayList<Dcategory> dctList = new ArrayList<>();
		PreparedStatement pstmt = null;
		ResultSet rset =null;
		String sql = prop.getProperty("selectDcategory");
		
		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, ct);
			rset = pstmt.executeQuery();
			
			while(rset.next()) {
				dctList.add(new Dcategory(rset.getInt("ct_dno"),
										rset.getString("ct_no"),
										rset.getString("ct_dname"),
										rset.getString("ct_dname")
						
						));
			}
		} catch (SQLException e) {
			e.printStackTrace();
		}finally {
			close(rset);
			close(pstmt);
		}
		
		return dctList;
		
	}
	
	/**
	 * @author 한빛
	 * @param conn
	 * @return ctList 카테고리 조회
	 */
	public ArrayList<Dcategory> selectCategory(Connection conn, String dct){
		
		ArrayList<Dcategory> dctList = new ArrayList<>();
		PreparedStatement pstmt = null;
		ResultSet rset =null;
		String sql = prop.getProperty("selectCategory");
		
		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, dct);
			rset = pstmt.executeQuery();
			
			while(rset.next()) {
				dctList.add(new Dcategory(rset.getInt("ct_dno"),
									rset.getString("ct_name"),
									rset.getString("ct_dname")
						));
			}
		} catch (SQLException e) {
			e.printStackTrace();
		}finally {
			close(rset);
			close(pstmt);
		}
		
		return dctList;
		
	}
	
	/**
	 * @author 한빛
	 * @param conn
	 * @param dct
	 * @return count 대분류 카테고리 조회수 
	 */
	public int dctSearchCount(Connection conn, String dct) {
		int count = 0;
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		String sql =prop.getProperty("dctSearchCount");
		try {
			pstmt= conn.prepareStatement(sql);
			pstmt.setString(1, dct);
			rset= pstmt.executeQuery();
		
			if(rset.next()) {
				count = rset.getInt("count");
			}
		} catch (SQLException e) {
			e.printStackTrace();
		}finally {
			close(rset);
			close(pstmt);
		}
		return count;
	}
	
	
	
	/**
	 * @author 한빛
	 * @param conn
	 * @param ct
	 * @return 소분류카테고리 조회수 
	 */
	public int ctSearchCount(Connection conn, String ct) {
		int count = 0;
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		String sql =prop.getProperty("ctSearchCount");
		try {
			pstmt= conn.prepareStatement(sql);
			pstmt.setString(1, ct);
			rset= pstmt.executeQuery();
		
			if(rset.next()) {
				count = rset.getInt("count");
			}
		} catch (SQLException e) {
			e.printStackTrace();
		}finally {
			close(rset);
			close(pstmt);
		}
		return count;
	}
	
	/**@author 한빛
	 * @param conn
	 * @param clNo
	 * @return t 튜터 정보조회
	 */
	public Tutor selectTutorInfo(Connection conn, int clNo) {
		Tutor t = null;
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		String sql =prop.getProperty("selectTutorInfo");
		try {
			pstmt= conn.prepareStatement(sql);
			pstmt.setInt(1, clNo);
			rset=pstmt.executeQuery();
			while(rset.next()) {
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
	 * @return cList 튜터의 모든 클래스 조회
	 */
	public ArrayList<Lesson> selectTutorClass(Connection conn, int clNo) {
		ArrayList<Lesson> cList = new ArrayList<>();
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		
		String sql = prop.getProperty("selectTutorClass");
		
		try {
			pstmt= conn.prepareStatement(sql);
			pstmt.setInt(1, clNo);
			
			rset=pstmt.executeQuery();
			while(rset.next()) {
				cList.add(new Lesson(rset.getInt("cl_no"),
						   rset.getString("local_name"),
						   rset.getString("distr_name"),
						   rset.getString("cl_name"),
						   rset.getString("cl_price"),
						   rset.getString("cl_thumb"),
						   rset.getInt("star_avg"),
						   rset.getInt("star_count")
						
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
	 * @param clNo
	 * @return rList 튜터의 모든 리뷰 조회
	 */
	public ArrayList<Review> selectTutorReview(Connection conn, int clNo) {
		ArrayList<Review> rList = new ArrayList<>();
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		
		String sql = prop.getProperty("selectTutorReview");
		
		try {
			pstmt= conn.prepareStatement(sql);
			pstmt.setInt(1, clNo);
			
			rset=pstmt.executeQuery();
			while(rset.next()) {
				rList.add(new Review(rset.getInt("re_no"),
									rset.getString("content"),
						            rset.getInt("re_star"),
						            rset.getString("re_date"),
						            rset.getString("re_update"),
						            rset.getString("cl_name"),
						            rset.getString("mem_nickname"),
						            rset.getString("mem_profile"),
						            rset.getInt("mem_no")

						));

			}
		} catch (SQLException e) {
			e.printStackTrace();
		}finally {
			close(rset);
			close(pstmt);
		}
		return rList;
	}
	
	
	/**@author 한빛
	 * @param conn
	 * @param clNo
	 * @return cCount 튜터가 등록한 클래스 개수 
	 */
	public int selectTtClassCount(Connection conn, int clNo) {
		int cCount = 0;
		PreparedStatement pstmt =null;
		ResultSet rset = null;
		String sql = prop.getProperty("selectTtClassCount");
		
		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, clNo);
			rset = pstmt.executeQuery();
			if(rset.next()) {
				cCount = rset.getInt("count");
			}
		} catch (SQLException e) {
			e.printStackTrace();
		}finally {
			close(rset);
			close(pstmt);
		}
		
		return cCount;
	}
	
	/**
	 * @author 한빛
	 * @param conn
	 * @param clNo
	 * @return rCount 튜터에게 등록된 리뷰개수 
	 */
	public int selectTtReviewCount(Connection conn, int clNo) {
		int rCount = 0;
		PreparedStatement pstmt =null;
		ResultSet rset = null;
		String sql = prop.getProperty("selectTtReviewCount");
		
		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, clNo);
			rset = pstmt.executeQuery();
			if(rset.next()) {
				rCount = rset.getInt("count");
			}
		} catch (SQLException e) {
			e.printStackTrace();
		}finally {
			close(rset);
			close(pstmt);
		}
		
		return rCount;
	
	}
	
	
	public int keywordSearchCount(Connection conn, String keyword) {
		int kCount = 0;
		PreparedStatement pstmt =null;
		ResultSet rset = null;
		String sql = prop.getProperty("keywordSearchCount");
		
		try {
			pstmt= conn.prepareStatement(sql);
			pstmt.setString(1, "%"+keyword+"%");
			
			rset= pstmt.executeQuery();
			if(rset.next()) {
				 kCount = rset.getInt("count");
				
			}
		} catch (SQLException e) {
			e.printStackTrace();
		}finally {
			close(rset);
			close(pstmt);
		}
		return kCount;
	}
	
	
	public ArrayList<Lesson> selectKeywordSearhList(Connection conn, String keyword, PageInfo pi){
		ArrayList<Lesson> kList = new ArrayList<>();
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		
		String sql = prop.getProperty("selectKeywordSearhList");
		try {
			pstmt=conn.prepareStatement(sql);
			
			int startRow = (pi.getCurrentPage()-1)* pi.getBoardLimit() + 1;
			int endRow = startRow + pi.getBoardLimit() -1;
			
			pstmt.setString(1, "%"+keyword+"%");
			pstmt.setInt(2,startRow);
			pstmt.setInt(3, endRow);
			
			rset = pstmt.executeQuery();
			
			while(rset.next()) {
				kList.add(new Lesson(rset.getInt("cl_no"),
									rset.getString("ct_name"),
									rset.getString("ct_dname"),
									rset.getString("local_name"),
									rset.getString("distr_name"),
									rset.getString("cl_name"),
									rset.getString("cl_price"),
									rset.getString("cl_thumb"),
									rset.getInt("star_avg"),
									rset.getInt("star_count")
							
						));
			}
			
		} catch (SQLException e) {
			e.printStackTrace();
		}finally {
			close(rset);
			close(pstmt);
		}
		return kList;
	}
	
	public ArrayList<Lesson> categorySort(Connection conn, String category,String sort){
		 
		ArrayList<Lesson> list =new ArrayList<>();
		 PreparedStatement pstmt = null;
		 ResultSet rset = null;
		 
		 String sql = prop.getProperty("categorySort");
		 try {
			 
			 switch(sort) {
			 case "낮은가격순" : sql += "\r\n order by cl_price asc";  break;
			 case "높은가격순" : sql += "\r\n order by cl_price desc";break;
			 case "인기순": sql += "\r\n order by star_avg desc nulls last"; break;
			 case "평점순": sql += "\r\n order by reg_count desc nulls last"; break;
			 }
	
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, category);
			

			rset = pstmt.executeQuery();
			while(rset.next()) {
				list.add(new Lesson(rset.getInt("cl_no"),
									rset.getString("ct_name"),
									rset.getString("ct_dname"),
									rset.getString("local_name"),
									rset.getString("distr_name"),
									rset.getString("cl_name"),
									rset.getString("cl_price"),
									rset.getString("cl_thumb"),
									rset.getInt("star_avg"),
									rset.getInt("star_count")
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
	
	public ArrayList<Schedule> getSchedule(Connection conn, int clNo, String calYear, String calMonth, String day){
		ArrayList<Schedule> list =new ArrayList<>();
		 PreparedStatement pstmt = null;
		 ResultSet rset = null;
		 
		 String sql = prop.getProperty("getSchedule");
		 try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, calYear + calMonth + day);
			pstmt.setInt(2, clNo);

			rset = pstmt.executeQuery();
			while(rset.next()) {
				list.add(new Schedule(rset.getInt("sch_no"),
									  rset.getInt("session_no"),
									  rset.getString("start_time"),
									  rset.getString("end_time"),
									  rset.getString("cls_hour"),
									  rset.getInt("cl_max"),
									  rset.getInt("reg_count")
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
	

	
	public ArrayList<Lesson> dcategorySort(Connection conn, String dct,String sort){
		
		ArrayList<Lesson> list = new ArrayList<>();
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		 
		String sql = prop.getProperty("dcategorySort");
		try {
			 switch(sort) {
			 case "낮은가격순" : sql += "\r\n order by cl_price asc";  break;
			 case "높은가격순" : sql += "\r\n order by cl_price desc";break;
			 case "인기순": sql += "\r\n order by star_avg desc nulls last"; break;
			 case "평점순": sql += "\r\n order by reg_count desc nulls last"; break;
			
			 }
				pstmt = conn.prepareStatement(sql);
				pstmt.setString(1, dct);
				rset = pstmt.executeQuery();
				while (rset.next()) {
					list.add(new Lesson(rset.getInt("cl_no"),
										rset.getString("ct_name"),
										rset.getString("ct_dname"),
										rset.getString("local_name"),
										rset.getString("distr_name"),
										rset.getString("cl_name"),
										rset.getString("cl_price"),
										rset.getString("cl_thumb"),
										rset.getInt("star_avg"),
										rset.getInt("star_count")
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
 * @param s
 * @return list 클래스 상세조회 
 */
public ArrayList<Lesson> searchDetailClass(Connection conn, Search s, PageInfo pi){
	ArrayList<Lesson> list = new ArrayList<>();
	PreparedStatement pstmt = null;
	ResultSet rset = null;
	
	String sql = prop.getProperty("searchDetailClass");
	
	try {

		String keyword = s.getKeyword();
		String category = s.getCategory();
		String dcategory = s.getDcategory();
		String sido = s.getSido();
		String sigungu = s.getSigungu();
		String day = s.getDay();
		String price = s.getPrice();

		  System.out.println(category);
		if(keyword != null && !keyword.equals("")) {
			sql += "and CL_NAME||CT_NAME||CT_DNAME||TT_NAME||LOCAL_NAME||DISTR_NAME||KEYWORD like" + "'%"+ keyword + "%'";
		}
		
		if(category.equals("전체")) {
			sql += "";				
		}else if(category !=null && !category.equals("")) {
		     sql += "and G.ct_no = " + "'" +category +"'";
		}else if(category == null& category.equals("")) {
			sql += "";
		
		}
		
		if(category.equals("전체") && dcategory.equals("전체")){
			sql +="";
		}else if(!category.equals("전체")&& dcategory.equals("전체")) {
			sql += "and g.ct_no =" + "'" + category + "'";
		}else if(!dcategory.equals("전체")) {
			sql += "and ct_dname= "+ "'"+ dcategory + "'";
		}
		
		if(sido.equals("00")) {
			sql += "";
		}else if(sido != null && !sido.equals("")) {
			sql += "and c.local_code = " + "'"+ sido +"'";
		}else {
			sql += "";
		}	
		if(sido.equals("00") && sigungu.equals("전체")) {
			sql += "";
		}else if(!sido.equals("00") && sigungu.equals("전체")) {
			sql += "and c.local_code = " + "'" + sido +"'";
		}else if(!sigungu.equals("전체")) {
			sql += "and distr_name =" + "'" + sigungu + "'";
		}
		//
		if(price != null && !price.equals("")) {
			sql += "and cl_price <= " + price;
		}else { 
			sql += "";
		}
		
	
		// 일정
		 if(day.length()!=0 && day.contains("weekday") && day.contains("sat")&& day.contains("sun")) {
				sql += "and cl_schedule = '매일'";
				
		 }else if(day.length()!=0 && day.contains("sat") && day.contains("sun")) {
				sql += "and cl_day like '%토%' or cl_day like '%일%'";
		 		
		 }else if((day.contains("weekday") && day.contains("sat")) || (day.contains("weekday") && day.contains("sun"))  ) {
				sql += "and cl_schedule = '매일'";
		 
		 }else if(day.length() !=0 && day.contains("weekday")) {
			sql += "and cl_day like '%월%' or cl_day like '%화%' or cl_day like '%수%' or cl_day like '%목%' or cl_day like '%금%'";		
		}else if(day.length()!= 0 && day.contains("sat")) {
			sql += "and cl_day like '%토%'";
					
		}else if(day.length()!=0 && day.contains("sun")) {
			sql += "and cl_day like '%일%'";
	
		}
		 
		 sql += "	)A\r\n"
		 		+ "		)	\r\n"
		 		+ "		WHERE RNUM BETWEEN ?  AND ?	";

		System.out.println(sql);

		pstmt = conn.prepareStatement(sql);
		int startRow = (pi.getCurrentPage()-1)* pi.getBoardLimit() + 1;
		int endRow = startRow + pi.getBoardLimit() -1;
		
		pstmt.setInt(1, startRow);
		pstmt.setInt(2, endRow);

		rset= pstmt.executeQuery();
		
		while(rset.next()) {
			list.add(new Lesson(rset.getInt("cl_no"),
								rset.getString("ct_name"),
								rset.getString("ct_dname"),
								rset.getString("local_name"),
								rset.getString("distr_name"),
								rset.getString("cl_name"),
								rset.getString("cl_price"),
								rset.getString("cl_thumb"),
								rset.getInt("star_avg"),
								rset.getInt("star_count")));
			
		}
		
	} catch (SQLException e) {
		e.printStackTrace();
	}finally {
		close(rset);
		close(pstmt);
		
	}
	return list;
}

 public int searchDetailCount(Connection conn, Search s) {
	 int count = 0;
	 
	 	PreparedStatement pstmt = null;
		ResultSet rset = null;
		
		String sql = prop.getProperty("searchDetailCount");
		
		try {

			String keyword = s.getKeyword();
			String category = s.getCategory();
			String dcategory = s.getDcategory();
			String sido = s.getSido();
			String sigungu = s.getSigungu();
			String day = s.getDay();
			String price = s.getPrice();
		

			if(keyword != null && !keyword.equals("")) {
				sql += "and CL_NAME||CT_NAME||CT_DNAME||TT_NAME||LOCAL_NAME||DISTR_NAME||KEYWORD like" + "'%"+ keyword + "%'";
			}
			
			if(category.equals("전체")) {
				sql += "";				
			}else if(category !=null && !category.equals("")) {
			     sql += "and G.ct_no = " + "'" +category +"'";
			}else if(category == null& category.equals("")) {
				sql += "";
			}
			
			if(category.equals("전체") && dcategory.equals("전체")){
				sql +="";
			}else if(!category.equals("전체")&& dcategory.equals("전체")) {
				sql += "and g.ct_no =" + "'" + category + "'";
			}else if(!dcategory.equals("전체")) {
				sql += "and ct_name= "+ "'"+ dcategory + "'";
			}else {
				sql +="";
			}
			
			if(sido.equals("00")) {
				sql += "";
			}else if(sido != null && !sido.equals("")) {
				sql += "and c.local_code = " + "'"+ sido +"'";
			}else {
				sql += "";
			}	
			if(sido.equals("00") && sigungu.equals("전체")) {
				sql += "";
			}else if(!sido.equals("00") && sigungu.equals("전체")) {
				sql += "and c.local_code = " + "'" + sido +"'";
			}else if(!sigungu.equals("전체")) {
				sql += "and distr_name =" + "'" + sigungu + "'";
			}
			
			if(price != null && !price.equals("")) {
				sql += "and cl_price <= " + price;
			}else {
				sql += "";
			}
			
		
			// 일정
			 if(day.length()!=0 && day.contains("weekday") && day.contains("sat")&& day.contains("sun")) {
					sql += "and cl_schedule = '매일'";
					
			 }else if(day.length()!=0 && day.contains("sat") && day.contains("sun")) {
					sql += "and cl_day like '%토%' or cl_day like '%일%'";
			 		
			 }else if((day.contains("weekday") && day.contains("sat")) || (day.contains("weekday") && day.contains("sun"))  ) {
					sql += "and cl_schedule = '매일'";
			 
			 }else if(day.length() !=0 && day.contains("weekday")) {
				sql += "and cl_day like '%월%' or cl_day like '%화%' or cl_day like '%수%' or cl_day like '%목%' or cl_day like '%금%'";		
			}else if(day.length()!= 0 && day.contains("sat")) {
				sql += "and cl_day like '%토%'";
						
			}else if(day.length()!=0 && day.contains("sun")) {
				sql += "and cl_day like '%일%'";
			
			}
			 
			 sql += ")";
			
			
			//System.out.println(sql);

			pstmt = conn.prepareStatement(sql);
			rset= pstmt.executeQuery();
			
			while(rset.next()) {
				 count = rset.getInt("count");
			}
			
		} catch (SQLException e) {
			e.printStackTrace();
		}finally {
			close(rset);
			close(pstmt);
			
		}
	 
	 return count;
	 
 }
 
 public ArrayList<Lesson> detailSearchSort(Connection conn, Search s){
	 ArrayList<Lesson> list = new ArrayList<>();
	 PreparedStatement pstmt = null;
	 ResultSet rset = null;
	 
	 String sql = prop.getProperty("detailSearchSort");
	 
	 try {
		 
		   String keyword = s.getKeyword();
		   String category = s.getCategory();
			String dcategory = s.getDcategory();
			String sido = s.getSido();
			String sigungu = s.getSigungu();
			String day = s.getDay();
			String price = s.getPrice();
			String sort = s.getSort();
			//System.out.println("category:" +category);
			
			if(keyword != null && !keyword.equals("")) {
				sql += "and CL_NAME||CT_NAME||CT_DNAME||TT_NAME||LOCAL_NAME||DISTR_NAME||KEYWORD like" + "'%"+ keyword + "%'";
			}
			
			if(category.equals("전체") ) {
				sql += "";				
			}else if(category !=null && !category.equals("")) {
			     sql += "and G.CT_NO = " + "'" +category +"'";
			}
			
			
			if(category.equals("전체") && dcategory.equals("전체")){
				sql +="";
			}else if(!category.equals("전체")&& dcategory.equals("전체")) {
				sql += "and g.ct_no =" + "'" + category + "'";
			}else if(!dcategory.equals("전체")) {
				sql += "and ct_dname= "+ "'"+ dcategory + "'";
			}else {
				sql +="";
			}
			
			if(sido.equals("00")) {
				sql += "";
			}else if(sido != null && !sido.equals("")) {
				sql += "and c.local_code = " + "'"+ sido +"'";
			}else {
				sql += "";
			}	
			if(sido.equals("00") && sigungu.equals("전체")) {
				sql += "";
			}else if(!sido.equals("00") && sigungu.equals("전체")) {
				sql += "and c.local_code = " + "'" + sido +"'";
			}else if(!sigungu.equals("전체")) {
				sql += "and distr_name =" + "'" + sigungu + "'";
			}
			
			
			if(price != null && !price.equals("")) {
				sql += "and cl_price <=" +  price ;
			}else { 
				sql += "";
			}
			
		
			// 일정
			 if(day.length()!=0 && day.contains("weekday") && day.contains("sat")&& day.contains("sun")) {
					sql += "and cl_schedule = '매일'";
					
			 }else if(day.length()!=0 && day.contains("sat") && day.contains("sun")) {
					sql += "and cl_day like '%토%' or cl_day like '%일%'";
			 		
			 }else if((day.contains("weekday") && day.contains("sat")) || (day.contains("weekday") && day.contains("sun"))  ) {
					sql += "and cl_schedule = '매일'";
			 
			 }else if(day.length() !=0 && day.contains("weekday")) {
				sql += "and cl_day like '%월%' or cl_day like '%화%' or cl_day like '%수%' or cl_day like '%목%' or cl_day like '%금%'";		
			}else if(day.length()!= 0 && day.contains("sat")) {
				sql += "and cl_day like '%토%'";
						
			}else if(day.length()!=0 && day.contains("sun")) {
				sql += "and cl_day like '%일%'";
			
			}		 
			
			 
			 // 정렬
			 switch(sort) {
			 case "낮은가격순" : sql += "\r\n order by cl_price asc";  break;
			 case "높은가격순" : sql += "\r\n order by cl_price desc";break;
			 case "인기순": sql += "\r\n order by star_avg desc nulls last"; break;
			 case "평점순": sql += "\r\n order by reg_count desc nulls last"; break;
			 
			 
			 }
			 
			
			System.out.println(sql);
		 
		pstmt= conn.prepareStatement(sql);
	    rset = pstmt.executeQuery();
		
		while(rset.next()) {
			list.add(new Lesson(rset.getInt("cl_no"),
								rset.getString("ct_name"),
								rset.getString("ct_dname"),
								rset.getString("local_name"),
								rset.getString("distr_name"),
								rset.getString("cl_name"),
								rset.getString("cl_price"),
								rset.getString("cl_thumb"),
								rset.getInt("star_avg"),
								rset.getInt("star_count")));
		
		
		}
	} catch (SQLException e) {
		e.printStackTrace();
	}finally {
		close(rset);
		close(pstmt);
	}
	 return list;
 }
	
	

}
