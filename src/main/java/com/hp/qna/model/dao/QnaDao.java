package com.hp.qna.model.dao;

import static com.hp.common.JDBCTemplate.close;

import java.io.FileInputStream;
import java.io.FileNotFoundException;
import java.io.IOException;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.InvalidPropertiesFormatException;
import java.util.Properties;

import com.hp.member.model.vo.Member;
import com.hp.qna.model.vo.Qna;


public class QnaDao {
	
	private Properties prop = new Properties();
	
	public QnaDao() {
		try {
			prop.loadFromXML(new FileInputStream(QnaDao.class.getResource("/db/sql/qna-mapper.xml").getPath()));
		} catch (InvalidPropertiesFormatException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} catch (FileNotFoundException e) {
			// TODO Auto-generated catch block
			
			e.printStackTrace();
		} catch (IOException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
	}
	
	public ArrayList<Qna> selectTutorQnaList(Connection conn, int MemNo){
		ArrayList<Qna> list = new ArrayList<>();
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		String sql = prop.getProperty("selectTutorQnaList");
		
		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, MemNo);
			
			rset = pstmt.executeQuery();
			
			while(rset.next()) {
				list.add(new Qna(rset.getInt("q_no"),
								rset.getString("q_title"),
								rset.getString("q_content"),
								rset.getDate("q_date"),
								rset.getString("q_status"),
								rset.getString("q_grade"),
								rset.getString("q_category"),
								rset.getInt("cl_no"),
								rset.getInt("q_mem_no"),
								rset.getString("a_title"),
								rset.getString("a_content"),
								rset.getDate("a_date"),
								rset.getInt("a_mem_no"),
								rset.getString("a_status")));
			}
			
		} catch (SQLException e) {
			e.printStackTrace();
		}finally {
			close(rset);
			close(pstmt);
		}
		return list;
		
	}
	
	public int insertTutorQna(Connection conn, Qna q) {
		int result = 0;
		PreparedStatement pstmt = null;
		String sql = prop.getProperty("insertTutorQna");
		
		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, q.getqTitle());
			pstmt.setString(2, q.getqContent());
			pstmt.setString(3, q.getqCategory());
			pstmt.setInt(4, q.getqMemNo());
			
			result = pstmt.executeUpdate();
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}finally {
			close(pstmt);
		}
		return result;
	}
	
	public Qna selectQnaDetail(Connection conn, int no) {
		Qna q = new Qna();
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		String sql = prop.getProperty("selectQnaDetail");
		
	
		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, no);
			rset = pstmt.executeQuery();
			
			if(rset.next()) {
				q.setqNo(no);
				q.setqTitle(rset.getString("q_title"));
				q.setqContent(rset.getString("q_content"));
				q.setqDate(rset.getDate("q_date"));
				q.setqStatus(rset.getString("q_status"));
				q.setqGrade(rset.getNString("q_grade"));
				q.setqCategory(rset.getString("q_category"));
				q.setClNo(rset.getInt("cl_no"));
				q.setqMemNo(rset.getInt("q_mem_no"));
				q.setaTitle(rset.getString("a_title"));
				q.setaContent(rset.getString("a_content"));
				q.setaDate(rset.getDate("a_date"));
				q.setaMemNo(rset.getInt("a_mem_no"));
				q.setaStatus(rset.getString("a_status"));
				
			}
			
			
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}finally {
			close(rset);
			close(pstmt);
		}
		return q;
		
	}
	
	public ArrayList<Qna> selectQnaListTutor(Connection conn){
		ArrayList<Qna> list1 = new ArrayList<>();
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		String sql = prop.getProperty("selectQnaListTutor");
		
		try {
			pstmt = conn.prepareStatement(sql);
			
			
			rset = pstmt.executeQuery();
			
			while(rset.next()) {
				list1.add(new Qna(rset.getInt("q_no"),
								rset.getString("q_title"),
								rset.getString("q_content"),
								rset.getDate("q_date"),
								rset.getString("q_status"),
								rset.getString("q_grade"),
								rset.getString("q_category"),
								rset.getInt("cl_no"),
								rset.getInt("q_mem_no"),
								rset.getString("a_title"),
								rset.getString("a_content"),
								rset.getDate("a_date"),
								rset.getInt("a_mem_no"),
								rset.getString("a_status")));
			}
			
		} catch (SQLException e) {
			e.printStackTrace();
		}finally {
			close(rset);
			close(pstmt);
		}
		return list1;
		
	}
	
	public ArrayList<Qna> selectQnaListTutee(Connection conn){
		ArrayList<Qna> list2 = new ArrayList<>();
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		String sql = prop.getProperty("selectQnaListTutee");
		
		try {
			pstmt = conn.prepareStatement(sql);
			
			
			rset = pstmt.executeQuery();
			
			while(rset.next()) {
				list2.add(new Qna(rset.getInt("q_no"),
								rset.getString("q_title"),
								rset.getString("q_content"),
								rset.getDate("q_date"),
								rset.getString("q_status"),
								rset.getString("q_grade"),
								rset.getString("q_category"),
								rset.getInt("cl_no"),
								rset.getInt("q_mem_no"),
								rset.getString("a_title"),
								rset.getString("a_content"),
								rset.getDate("a_date"),
								rset.getInt("a_mem_no"),
								rset.getString("a_status")));
			}
			
		} catch (SQLException e) {
			e.printStackTrace();
		}finally {
			close(rset);
			close(pstmt);
		}
		return list2;
		
	}
	
	public int insertQnaAnswer(Connection conn, Qna q) {
		int result = 0;
		PreparedStatement pstmt = null;
		String sql = prop.getProperty("insertQnaAnswer");
		
		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, q.getaTitle());
			pstmt.setString(2, q.getaContent());
			pstmt.setInt(3, q.getqNo());
			
			result = pstmt.executeUpdate();
		
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}finally {
			close(pstmt);
		}
		return result;
	}

}
