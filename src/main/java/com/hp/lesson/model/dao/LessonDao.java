package com.hp.lesson.model.dao;

import static com.hp.common.JDBCTemplate.close;

import java.io.FileInputStream;
import java.io.IOException;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.Properties;

import com.hp.lesson.model.vo.Lesson;
import com.hp.review.model.vo.Review;

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

}
