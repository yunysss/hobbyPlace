package com.hp.review.model.dao;

import static com.hp.common.JDBCTemplate.*;

import java.io.FileInputStream;
import java.io.IOException;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.Properties;

import com.hp.common.model.vo.PageInfo;
import com.hp.lesson.model.dao.LessonDao;
import com.hp.review.model.vo.Register;
import com.hp.review.model.vo.Review;

public class ReviewDao {
	
	private Properties prop = new Properties();
	
	public ReviewDao() {
		
		try {
			prop.loadFromXML(new FileInputStream(LessonDao.class.getResource("/db/sql/review-mapper.xml").getPath()));
		} catch (IOException e) {
			e.printStackTrace();
		}
	}
	
	
	public int selectWriteListCount(Connection conn, int memNo) {
		int listCount = 0;
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		
		String sql = prop.getProperty("selectWriteListCount");
		try {
			pstmt= conn.prepareStatement(sql);
			pstmt.setInt(1, memNo);
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

	public ArrayList<Register> selectWriteList(Connection conn, PageInfo wpi) {
		ArrayList<Register> list = new ArrayList<>();
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		String sql = prop.getProperty("selectWriteList");
		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, wpi.getMemNo());
			
			int startRow = (wpi.getCurrentPage() -1 ) * wpi.getBoardLimit() + 1;
			int endRow = startRow + wpi.getBoardLimit() -1;
			
			pstmt.setInt(2,startRow);
			pstmt.setInt(3, endRow);
			rset = pstmt.executeQuery();
			
			while(rset.next()) {
				list.add(new Register(rset.getInt("reg_no"),
									  rset.getString("teach_date"),
									  rset.getString("reg_sta"),
									  rset.getString("cl_thumb"),
									  rset.getString("cl_name"),
									  rset.getString("start_time"),
									  rset.getString("distr_name")
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


	public int selectMyReviewListCount(Connection conn, int memNo) {
		int listCount = 0;
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		
		String sql = prop.getProperty("selectMyReviewListCount");
		try {
			pstmt= conn.prepareStatement(sql);
			pstmt.setInt(1, memNo);
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


	public ArrayList<Review> selectMyReviewList(Connection conn, PageInfo rePi) {
		ArrayList<Review> list = new ArrayList<>();
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		String sql = prop.getProperty("selectMyReviewList");
		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, rePi.getMemNo());
			
			int startRow = (rePi.getCurrentPage() -1 ) * rePi.getBoardLimit() + 1;
			int endRow = startRow + rePi.getBoardLimit() -1;
			
			pstmt.setInt(2,startRow);
			pstmt.setInt(3, endRow);
			rset = pstmt.executeQuery();
			
			while(rset.next()) {
				list.add(new Review(rset.getString("content"),
								      rset.getInt("re_star"),
								      rset.getString("re_date"),
								      rset.getString("cl_name"),
								      rset.getString("cl_thumb")
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


	public ArrayList<Review> selectReviewList(Connection conn, int memNo) {
		ArrayList<Review> list = new ArrayList<>();
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		String sql = prop.getProperty("selectReviewList");
		
		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, memNo);
			rset = pstmt.executeQuery();
			
			while(rset.next()) {
				list.add(new Review(rset.getInt("re_no"),
								   rset.getString("content"),
								   rset.getInt("re_star"),
								   rset.getString("re_date"),
								   rset.getString("re_update"),
								   rset.getString("re_sta"),
								   rset.getInt("reg_no"),
								   rset.getInt("cl_no"),
								   rset.getInt("mem_no"),
								   rset.getString("cl_name"),
								   rset.getString("mem_nickname"),
								   rset.getString("mem_profile")));
			}
		} catch (SQLException e) {
			e.printStackTrace();
		}finally {
			close(rset);
			close(pstmt);
		}
		return list;
	}


	public int deleteReview(Connection conn, int reNo) {
		int result = 0;
		PreparedStatement pstmt = null;
		String sql = prop.getProperty("deleteReview");
		
		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, reNo);
			
			result = pstmt.executeUpdate();
			
		} catch (SQLException e) {
			e.printStackTrace();
		}finally {
			close(pstmt);
		}
		return result;
	
		}
	


	
	public Register selectEnrollFormClass(Connection conn, int regNo) {
		Register er = null;
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		
		String sql = prop.getProperty("selectEnrollFormClass");
		
		try {
			pstmt=conn.prepareStatement(sql);
			pstmt.setInt(1, regNo);
			
			rset=pstmt.executeQuery();
			
			if(rset.next()) {
				er = new Register(rset.getInt("reg_no"),
								  rset.getString("teach_date"),
								  rset.getString("reg_sta"),
								  rset.getString("cl_thumb"),
								  rset.getString("cl_name"),
								  rset.getString("start_time"),
								  rset.getString("distr_name"));
			}
			
		} catch (SQLException e) {
			e.printStackTrace();
		}finally {
	}
	return er;
}
	
	public ArrayList<Review> selectAdminSearchReview(Connection conn, Review r) {
		ArrayList<Review> list = new ArrayList<>();
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		String sql = prop.getProperty("selectAdminSearchReview");
		
		
		try {
			if(!r.getTtName().equals("")) {
				sql += "AND TT_NAME LIKE '%" + r.getTtName() + "%'";
			}
			if(r.getReStar().length() != 0) {
				sql += "AND RE_STAR IN (" + r.getReStar();
			    sql = sql.substring(0,sql.length()-1);
				sql += ")"; 
			}
			if(!r.getClName().equals("")) {
				sql += "AND CL_NAME LIKE '%" + r.getClName() + "%'";
			}
			if(!r.getReviewContent().equals("")) {
				sql += "AND CONTENT LIKE '%" + r.getReviewContent() + "%'";
			}
			if(!r.getMemName().equals("")) {
				sql += "AND MEM_NAME LIKE '%" + r.getMemName() + "%'";
			}
			pstmt = conn.prepareStatement(sql);
			rset = pstmt.executeQuery();
			while(rset.next()) {
				list.add(new Review(rset.getInt("re_no"),
						            rset.getString("content"),
						            rset.getInt("re_star"),
						            rset.getString("re_date"),
						            rset.getString("cl_name"),
						            rset.getString("mem_name"),
						            rset.getString("tt_name")));
			}
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(rset);
			close(pstmt);
		}
		return list;
	}
	
	public ArrayList<Review> selectTutorReview(Connection conn, Review r){
		ArrayList<Review> list = new ArrayList<>();
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		String sql = prop.getProperty("selectTutorReview");
		
		try {
			sql += "WHERE MEM_NO = " + r.getTtNo();
			if(r.getReStar().length() != 0) {
				sql += "AND RE_STAR IN (" + r.getReStar();
			    sql = sql.substring(0,sql.length()-1);
				sql += ")"; 
			}
			if(!r.getClName().equals("")) {
				sql += "AND CL_NAME LIKE '%" + r.getClName() + "%'";
			}
			if(!r.getReviewContent().equals("")) {
				sql += "AND CONTENT LIKE '%" + r.getReviewContent() + "%'";
			}
			if(!r.getMemName().equals("")) {
				sql += "AND MEM_NAME LIKE '%" + r.getMemName() + "%'";
			}
			pstmt = conn.prepareStatement(sql);
			rset = pstmt.executeQuery();
			while(rset.next()) {
				list.add(new Review(rset.getInt("re_no"),
						            rset.getString("content"),
						            rset.getInt("re_star"),
						            rset.getString("re_date"),
						            rset.getString("mem_name"),
						            rset.getString("cl_name")));
			}
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(rset);
			close(pstmt);
		}
		return list;
	}
	
	public Review selectReviewDetail(Connection conn, int reNo) {
		Review r = null;
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		String sql = prop.getProperty("selectReviewDetail");
		
		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, reNo);
			
			rset = pstmt.executeQuery();
			if(rset.next()) {
				r = new Review(rset.getInt("re_no"),
						       rset.getString("content"),
						       rset.getString("cl_name"),
						       rset.getString("ct_name"),
						       rset.getString("mem_name"),
						       rset.getInt("re_star"),
						       rset.getString("re_date"),
						       rset.getString("re_update"),
						       rset.getString("re_sta"));
			}
		} catch (SQLException e) {
			e.printStackTrace();
		}finally {
			close(rset);
			close(pstmt);
		}
		return r;
	}

		

} 
	
