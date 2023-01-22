package com.hp.admin.model.dao;

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

import com.hp.common.model.vo.PageInfo;
import com.hp.lesson.model.vo.Category;
import com.hp.lesson.model.vo.Dcategory;
import com.hp.lesson.model.vo.Lesson;
import com.hp.lesson.model.vo.Schedule;
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
							rset.getString("curriculum"),
							rset.getString("refundPolicy"),
							rset.getString("cl_supplies"),
							rset.getString("keyword"),
							rset.getDate("enroll_date"),
							rset.getString("cl_status"),
							rset.getString("cl_thumb")
							
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
	public Schedule selectSchedule(Connection conn, int clNo) {
		Schedule s = null;
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		
		String sql = prop.getProperty("selectSchedule");
		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, clNo);
			
			rset = pstmt.executeQuery();
			
			if(rset.next()) {
				s = new Schedule(rset.getInt("sch_no"),
								 rset.getInt("session_no"),
								 rset.getString("start_time"),
								 rset.getString("end_time")
								 
						);
			}
			
		
		} catch (SQLException e) {
			e.printStackTrace();
		}finally {
			close(rset);
			close(pstmt);
			
		}
		return s;
		
		
		
		
		
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

	
	
}
