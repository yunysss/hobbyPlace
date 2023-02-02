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




	
	

}
