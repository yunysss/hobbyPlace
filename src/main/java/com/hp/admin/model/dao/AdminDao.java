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

import com.hp.common.model.vo.PageInfo;
import com.hp.lesson.model.vo.Lesson;
import com.hp.member.model.vo.Member;

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


	public void adminLogin(Connection conn, String userId, String userPwd) {
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
//				m= new Member(rset.getString("mem_id"),
//							  rset.getString("mem_pwd"));
			}
		} catch (SQLException e) {
			e.printStackTrace();
		}
		
		
		
		
	}

}
