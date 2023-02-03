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

}
