package com.hp.tutor.model.dao;

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
import com.hp.lesson.model.vo.Category;
import com.hp.lesson.model.vo.Dcategory;
import com.hp.lesson.model.vo.Lesson;
import com.hp.register.model.vo.Register;
import com.hp.tutor.model.vo.Tutor;

public class TutorDao {
	
private Properties prop = new Properties();
	
	public TutorDao(){
		String filePath = TutorDao.class.getResource("/db/sql/tutor-mapper.xml").getPath();
		
		try {
			prop.loadFromXML(new FileInputStream(filePath));
		} catch (IOException e) {
			e.printStackTrace();
		}
	}
	
	/**
	 * @author 한빛
	 * @param conn
	 * @param memNo
	 * @return t (로그인한 튜터정보)
	 */
	public Tutor selectTutorInfo(Connection conn, int memNo) {
		Tutor t = null;
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		
		String sql = prop.getProperty("selectTutorInfo");
		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, memNo);
			
			rset=pstmt.executeQuery();
			if(rset.next()) {
				t = new Tutor(rset.getInt("mem_no"),
							  rset.getString("tt_name"),
							  rset.getString("tt_phone"),
							  rset.getString("tt_email"),
							  rset.getString("introduce"),
							  rset.getString("pub_phone"),
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
	 * @param conn , memNo
	 * @return listCount 튜터가 등록한 클래스 개수 
	 */
	public int selectClassCount(Connection conn, int memNo) {
		int listCount = 0;
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		String sql = prop.getProperty("selectClassCount");
		try {
			pstmt = conn.prepareStatement(sql);
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
	/**
	 * @author 한빛
	 * @param conn
	 * @param pi, memNo
	 * @return list : 페이징 처리된 클래스 list
	 */
	public ArrayList<Lesson> selectClassList(Connection conn, PageInfo pi, int memNo){
		ArrayList<Lesson> list = new ArrayList<>();
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		
		String sql = prop.getProperty("selectClassList");
		
		try {
			pstmt=conn.prepareStatement(sql);
			
			int startRow = (pi.getCurrentPage()-1)* pi.getBoardLimit() + 1;
			int endRow = startRow + pi.getBoardLimit() -1;
			pstmt.setInt(1, memNo);
			pstmt.setInt(2, startRow);
			pstmt.setInt(3 , endRow);
			
			rset = pstmt.executeQuery();
			
			while(rset.next()) {
				list.add(new Lesson(rset.getInt("cl_no"),
									rset.getString("ct_name"),
									rset.getString("ct_dname"),
									rset.getString("tt_name"),
									rset.getString("cl_name"),
									rset.getDate("enroll_date"),
									rset.getString("cl_status"),
									rset.getString("cl_refuse")
						
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
	 * @param t
	 * @return result (튜터 프로필 수정) 
	 */
	public int updateTutorProfile(Connection conn, Tutor t) {
		int result = 0;
		PreparedStatement pstmt = null;
	
		String sql = prop.getProperty("updateTutorProfile");
		
		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, t.getTtName());
			pstmt.setString(2, t.getTtPhone());
			pstmt.setString(3, t.getTtEmail());
			pstmt.setString(4, t.getIntroduce());
			pstmt.setString(5, t.getPubPhone());
			pstmt.setString(6, t.getTtProfile());
			pstmt.setInt(7, t.getMemNo());
			
			result =pstmt.executeUpdate();
		} catch (SQLException e) {
			e.printStackTrace();
		}finally {
			close(pstmt);
		}
		return result;
	}
	
	public ArrayList<Register> selectTutorRegister(Connection conn, int memNo){
		ArrayList<Register> rList = new ArrayList<>();
		PreparedStatement pstmt = null;
		ResultSet rset =null;
		String sql = prop.getProperty("selectTutorRegister");
		
		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, memNo);
			rset = pstmt.executeQuery();
			while(rset.next()) {
				rList.add(new Register(rset.getInt("reg_no"),
									  rset.getString("mem_name"),
									  rset.getString("cl_name"),
									  rset.getString("teach_date"),
									  rset.getString("reg_date"),
									  rset.getString("sch_time"),
									  rset.getString("reg_price"),
									  rset.getString("reg_count"),
									  rset.getString("reg_sta"),
									  rset.getString("mem_phone"),
									  rset.getString("mem_email")
									  ));
			}
		} catch (SQLException e) {
			e.printStackTrace();
		}finally {
			close(pstmt);
		}
		return rList;
	}
	
	public ArrayList<Register> selectTutorNewRegister(Connection conn, int memNo){
		ArrayList<Register> nList = new ArrayList<>();
		PreparedStatement pstmt = null;
		ResultSet rset =null;
		String sql = prop.getProperty("selectTutorNewRegister");
		
		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, memNo);
			pstmt.setInt(2, 0);
			rset = pstmt.executeQuery();
			while(rset.next()) {
				nList.add(new Register(rset.getInt("reg_no"),
									  rset.getString("mem_name"),
									  rset.getString("cl_name"),
									  rset.getString("teach_date"),
									  rset.getString("reg_date"),
									  rset.getString("sch_time"),
									  rset.getString("reg_price"),
									  rset.getString("reg_count"),
									  rset.getString("reg_sta"),
									  rset.getString("mem_phone"),
									  rset.getString("mem_email")
									  ));
			}
		} catch (SQLException e) {
			e.printStackTrace();
		}finally {
			close(pstmt);
		}
		return nList;
	}
	
	public ArrayList<Register> selectTutorFinRegister(Connection conn, int memNo){
		ArrayList<Register> fList = new ArrayList<>();
		PreparedStatement pstmt = null;
		ResultSet rset =null;
		String sql = prop.getProperty("selectTutorFinRegister");
		
		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, memNo);
			rset = pstmt.executeQuery();
			while(rset.next()) {
				fList.add(new Register(rset.getInt("reg_no"),
									  rset.getString("mem_name"),
									  rset.getString("cl_name"),
									  rset.getString("teach_date"),
									  rset.getString("reg_date"),
									  rset.getString("sch_time"),
									  rset.getString("reg_price"),
									  rset.getString("reg_count"),
									  rset.getString("reg_sta"),
									  rset.getString("mem_phone"),
									  rset.getString("mem_email")
									  ));
			}
		} catch (SQLException e) {
			e.printStackTrace();
		}finally {
			close(pstmt);
		}
		return fList;
	}
	
	public ArrayList<Register> selectTutorRejectRegister(Connection conn, int memNo){
		ArrayList<Register> rjList = new ArrayList<>();
		PreparedStatement pstmt = null;
		ResultSet rset =null;
		String sql = prop.getProperty("selectTutorNewRegister");
		
		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, memNo);
			pstmt.setInt(2, 4);
			rset = pstmt.executeQuery();
			while(rset.next()) {
				rjList.add(new Register(rset.getInt("reg_no"),
									  rset.getString("mem_name"),
									  rset.getString("cl_name"),
									  rset.getString("teach_date"),
									  rset.getString("reg_date"),
									  rset.getString("sch_time"),
									  rset.getString("reg_price"),
									  rset.getString("reg_count"),
									  rset.getString("reg_sta"),
									  rset.getString("mem_phone"),
									  rset.getString("mem_email")
									  ));
			}
		} catch (SQLException e) {
			e.printStackTrace();
		}finally {
			close(pstmt);
		}
		return rjList;
	}


	
	


}
