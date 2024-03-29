package com.hp.tutor.model.dao;

import static com.hp.common.JDBCTemplate.close;


import java.io.FileInputStream;
import java.io.IOException;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.text.DecimalFormat;
import java.util.ArrayList;
import java.util.Properties;

import javax.naming.spi.DirStateFactory.Result;

import com.hp.admin.model.vo.Search;
import com.hp.common.model.vo.Attachment;
import com.hp.common.model.vo.PageInfo;
import com.hp.customerService.model.vo.Notice;
import com.hp.lesson.model.vo.Category;
import com.hp.lesson.model.vo.Dcategory;
import com.hp.lesson.model.vo.Lesson;
import com.hp.lesson.model.vo.Schedule;
import com.hp.register.model.vo.Register;
import com.hp.tutor.model.vo.Tutor;


/**
 * @author user
 *
 */
/**
 * @author user
 *
 */
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
		
		String sql = prop.getProperty("selectTutorInfo2");
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
							  rset.getDate("enroll_date"),
							  rset.getString("pub_phone"),
							  rset.getString("tt_profile"),
							  rset.getString("modify_date"));
				
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
	
	
	
	/**
	 * @author 한빛
	 * @param conn
	 * @param checkNick
	 * @return count 튜터 닉네임중복조회
	 */
	public int nickCheck(Connection conn, String checkNick) {
		int count = 0;
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		String sql = prop.getProperty("nickCheck");
		
		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1,checkNick);
			
			rset= pstmt.executeQuery();
			
			if(rset.next()) {
				count = rset.getInt("count");
			}
			
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(rset);
			close(pstmt);
		}
		return count;
	}
	
	

	/** 튜터 등록
	 * @author 수정
	 * @param conn
	 * @param t
	 * @return result
	 */
	public int insertTutor(Connection conn, Tutor t) {
		int result = 0;
		PreparedStatement pstmt = null;
		String sql = prop.getProperty("insertTutor");
		
		try {
			pstmt=conn.prepareStatement(sql);
			pstmt.setInt(1, t.getMemNo());
			pstmt.setString(2, t.getTtName());
			pstmt.setString(3,t.getTtPhone());
			pstmt.setString(4, t.getTtEmail());
			pstmt.setString(5, t.getIntroduce());
			pstmt.setString(6, t.getPubPhone());
			pstmt.setString(7, t.getTtProfile());
			
			result = pstmt.executeUpdate();
			
		} catch (SQLException e) {
			
			e.printStackTrace();
		}finally {
			close(pstmt);
		}
		
		return result;
	}
	
	/**
	 * 튜터등록시 등급이 2(튜터)로 변경
	 * @author 수정
	 * @param conn
	 * @param grade
	 * @return result
	 */
	public int updateGrade(Connection conn, String grade, int memNo) {
		int result = 0;
		PreparedStatement pstmt = null;
		String sql = prop.getProperty("updateGrade");
		try {
			pstmt=conn.prepareStatement(sql);
			pstmt.setInt(1,memNo);
			
			result=pstmt.executeUpdate();
			
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
	
	/**
	 * @author 한빛
	 * @param conn
	 * @param clNo
	 * @return result 클래스 중단처리 결과 
	 */
	public int stopClassUpdate(Connection conn, int clNo) {
		int result = 0;
		PreparedStatement pstmt = null;
		String sql = prop.getProperty("stopClassUpdate");
		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1,clNo);
			
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
	 * @param l
	 * @return  result 클래스 등록 결과
	 */
	public int insertClass(Connection conn, Lesson l) {
		int result =0;
		PreparedStatement pstmt = null;
		String sql = prop.getProperty("insertClass");
		try {
			pstmt= conn.prepareStatement(sql);
			pstmt.setString(1, l.getCtNo());
			pstmt.setString(2,l.getCtDno());
			pstmt.setString(3,l.getMemNo());
			pstmt.setString(4,l.getLocalCode());
			pstmt.setString(5, l.getDistrCode());
			pstmt.setString(6, l.getClName());
			pstmt.setString(7, l.getClAddress());
			pstmt.setInt(8, l.getClMax());
			pstmt.setString(9, l.getClLevel());
			pstmt.setString(10, l.getEndDate());
			pstmt.setInt(11,l.getClTimes());
			pstmt.setString(12, l.getClSchedule());
			pstmt.setString(13, l.getClDay());
			pstmt.setString(14,l.getClPrice());
			pstmt.setString(15, l.getClDetail());
			pstmt.setString(16,l.getCurriculum());
			pstmt.setString(17, l.getRefundPolicy());
			pstmt.setString(18, l.getClSupplies());
			pstmt.setString(19,l.getKeyword());
			pstmt.setString(20, l.getClThumb());
			
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
	 * @param list
	 * @return result 클래스 상세이미지 등록 결과 
	 */
	public int insertClassAttachment(Connection conn, ArrayList<Attachment> list) {
		
		int result = 0; 
		PreparedStatement pstmt = null;
		String sql = prop.getProperty("insertClassAttachment");
		
		try {
			for(Attachment at : list) {
				pstmt = conn.prepareStatement(sql);
				pstmt.setString(1, at.getOriginName());
				pstmt.setString(2, at.getChangeName());
				pstmt.setString(3, at.getFilePath());
				pstmt.setString(4, at.getRefType());
				
				result = pstmt.executeUpdate();
			
			}
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
				list.add(new Attachment(
										rset.getInt("file_no"),
										rset.getString("origin_name"),
										rset.getString("change_name"),
										rset.getString("file_path"),
										rset.getInt("ref_no")
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
	
	
	/**
	 * @author 한빛
	 * @param conn
	 * @param sList
	 * @return result 스케줄 등록결과 
	 */
	public int insertSchedule(Connection conn, ArrayList<Schedule> sList) {
		 int result = 0;
		 PreparedStatement pstmt = null;
		 String sql = prop.getProperty("insertSchedule");
		 try {
			for(Schedule s : sList) {
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, s.getSessionNo());
			pstmt.setString(2, s.getStartTime());
			pstmt.setString(3, s.getEndTime());
			pstmt.setString(4, s.getEndTime());
			pstmt.setString(5, s.getStartTime());
			
			result = pstmt.executeUpdate();
			}
		} catch (SQLException e) {
			e.printStackTrace();
		}finally {
			close(pstmt);
		}
		 System.out.println(result);
		 return result;
	}
	
	/**
	 * @author 한빛
	 * @param conn
	 * @param l
	 * @return result 클래스 수정 
	 */
	public int updateClass(Connection conn, Lesson l) {
		int result = 0;
		PreparedStatement pstmt = null;
		String sql = prop.getProperty("updateClass");
		
		try {
			pstmt= conn.prepareStatement(sql);
			
			System.out.println(sql);
			pstmt.setString(1, l.getCtNo());
			pstmt.setString(2,l.getCtDno());
			pstmt.setString(3,l.getLocalCode());
			pstmt.setString(4, l.getDistrCode());
			pstmt.setString(5, l.getClName());
			pstmt.setString(6, l.getClAddress());
			pstmt.setInt(7, l.getClMax());
			pstmt.setString(8, l.getClLevel());
			pstmt.setString(9, l.getEndDate());
			pstmt.setInt(10,l.getClTimes());
			pstmt.setString(11, l.getClSchedule());
			pstmt.setString(12, l.getClDay());
			pstmt.setString(13,l.getClPrice());
			pstmt.setString(14, l.getClDetail());
			pstmt.setString(15,l.getCurriculum());
			pstmt.setString(16, l.getRefundPolicy());
			pstmt.setString(17, l.getClSupplies());
			pstmt.setString(18,l.getKeyword());
			pstmt.setString(19, l.getClThumb());
			pstmt.setInt(20,l.getClNo());
			
	     result=pstmt.executeUpdate();

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
	 * @param list
	 * @return result attachment 수정 
	 */
	public int updateAttachment(Connection conn, ArrayList<Attachment> list) {
		int result =0;
		PreparedStatement pstmt = null;
		String sql = prop.getProperty("updateAttachment");
		try {
			for(Attachment at : list) {
				pstmt= conn.prepareStatement(sql);
	
				pstmt.setString(1, at.getOriginName());
				pstmt.setString(2, at.getChangeName());
				pstmt.setString(3, at.getFilePath());
				pstmt.setInt(4, at.getFileNo());
				
				result = pstmt.executeUpdate();
		
			//System.out.println(sql);
			
			}
		} catch (SQLException e) {
			e.printStackTrace();
		}finally {
			close(pstmt);
		}
		return result;
	}
	
	/**@author 한빛
	 * @param conn
	 * @param list
	 * @return result 클래스 수정시 새로운첨부파일 insert
	 */
	public int insertNewAttachment(Connection conn, ArrayList<Attachment> list) {
		int result = 0;
		PreparedStatement pstmt= null;
		String sql = prop.getProperty("insertNewAttachment");
		System.out.println(sql);
		try {
			for(Attachment at : list) {
			pstmt = conn.prepareStatement(sql);
			
			pstmt.setString(1, at.getOriginName());
			pstmt.setString(2, at.getChangeName());
			pstmt.setString(3, at.getFilePath());
			pstmt.setString(4, at.getRefType());
			pstmt.setInt(5, at.getRefNo());
			
			result = pstmt.executeUpdate();
			}
			
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
	 * @param sList
	 * @return result 클래스 수정시 스케쥴 삭제 
	 */
	public int deleteSchedule(Connection conn, Lesson l) {
		
		int result = 0;
		PreparedStatement pstmt = null;
		String sql = prop.getProperty("deleteSchedule");
		try {
			//System.out.println(l.getClNo());
			pstmt= conn.prepareStatement(sql);
			pstmt.setInt(1,l.getClNo());
			
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
	 * @param sList
	 * @return result 클래스 수정시 스케줄 재등록
	 */
	public int insertNewSchedule(Connection conn, ArrayList<Schedule> sList) {
		 int result = 0;
		 PreparedStatement pstmt = null;
		 String sql = prop.getProperty("insertNewSchedule");
		 try {
			for(Schedule s : sList) {
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1,s.getClNo());
			pstmt.setInt(2, s.getSessionNo());
			pstmt.setString(3, s.getStartTime());
			pstmt.setString(4, s.getEndTime());
			pstmt.setString(5, s.getEndTime());
			pstmt.setString(6, s.getStartTime());
			
			result = pstmt.executeUpdate();
			}
		} catch (SQLException e) {
			e.printStackTrace();
		}finally {
			close(pstmt);
		}
		// System.out.println(result);
		 return result;
	}
	
	/**@author 한빛
	 * @param conn
	 * @param s
	 * @param memNo
	 * @return 튜터 클래스 조회 
	 */
	public ArrayList<Lesson> searchClass(Connection conn, Search s,int memNo){
		ArrayList<Lesson> list = new ArrayList<>();
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		String sql = prop.getProperty("searchClass");
		
		try {
			
			String keyword = s.getKeyword();
			String startDate = s.getStarDate();
			String endDate = s.getEndDate();
			String status = s.getStatus();

			if(keyword != null && !keyword.equals("")) {
				sql += "and cl_name||ct_dname||ct_name like" + "'%"+ keyword + "%'";
			}
			
			if(startDate != null && endDate != null && !startDate.equals("") && !endDate.equals("")) {
				 sql += "and c.enroll_date between '" + startDate + "' and '" + endDate +"'";
			}
			
			if(status.length() != 0) {
				sql += "and cl_status in (" + status ;
			    sql = sql.substring(0,sql.length()-1);
				sql += ")"; 
			}
			  sql += "\r\n order by cl_no desc ";
			//System.out.println(sql);
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, memNo);
			rset = pstmt.executeQuery();
			
			while(rset.next()) {
				list.add(new Lesson(rset.getInt("cl_no"),
									 rset.getString("ct_dname"),
									 rset.getString("cl_name"),
									 rset.getDate("enroll_date"),
									 rset.getDate("update_date"),
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
	 * @return 튜터 메인 공지사항 조회
	 */
	public ArrayList<Notice> selectTutorNotice(Connection conn){
		ArrayList<Notice> list= new ArrayList<>();
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		String sql = prop.getProperty("selectTutorNotice");
		
		try {
			pstmt = conn.prepareStatement(sql);
			rset = pstmt.executeQuery();
			
			while(rset.next()) {
				list.add(new Notice(rset.getInt("nt_no"),
									rset.getString("nt_title"),
									rset.getDate("enroll_date")
								
									));
			}
		} catch (SQLException e) {
			// TODO Auto-generated catch block
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
	 * @param memNo
	 * @return 튜터 메인 통계
	 */
	public Tutor selectTutorStatistics(Connection conn, int memNo) {
		Tutor tt = null;
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		
		String sql = prop.getProperty("selectTutorStatistics");
		
		try {
			pstmt= conn.prepareStatement(sql);
			pstmt.setInt(1,memNo);
			
			rset = pstmt.executeQuery();
			
			if(rset.next()) {
				tt = new Tutor (rset.getString("avgStar"),
								rset.getInt("rCount"),
								rset.getInt("cancelCount"),
								rset.getInt("sumMonth"),
								rset.getInt("sumTotal"),
								rset.getInt("sumReg")
						);
			
				//System.out.println(tt);
				//System.out.println(tt.getrCount());
			}
		} catch (SQLException e) {
			e.printStackTrace();
		}finally {
			close(pstmt);
			close(rset);
		}
		
		return tt ;
		
		
		
	}
	public int selectIngClassCount(Connection conn, int memNo) {
		int ingClass = 0;
		
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		
		String sql = prop.getProperty("selectIngClassCount");
		try {
			pstmt=conn.prepareStatement(sql);
			pstmt.setInt(1, memNo);
			
			rset= pstmt.executeQuery();
			if(rset.next()) {
				ingClass = rset.getInt("count");
			}
		} catch (SQLException e) {
			e.printStackTrace();
		}finally {
			close(pstmt);
			close(rset);
		}
		
	  return ingClass;
	
	
	}
	
	public int selectQnaPercent(Connection conn, int memNo) {
		int qnaPer = 0;
		
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		
		String sql = prop.getProperty("selectQnaPercent");
		try {
			pstmt=conn.prepareStatement(sql);
			pstmt.setInt(1, memNo);
			pstmt.setInt(2, memNo);
			
			rset= pstmt.executeQuery();
			if(rset.next()) {
				qnaPer = rset.getInt("qnaPer");
			}
		} catch (SQLException e) {
			e.printStackTrace();
		}finally {
			close(pstmt);
			close(rset);
		}
		
	  return qnaPer;
	 	
	}
	
	/**
	 * @author 한빛
	 * @param conn
	 * @param memNo
	 * @param status
	 * @return 튜터 메인 예약관리 
	 */
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
									  rset.getString("reg_count")
									
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

	/**
	 * @author 수정
	 * @param conn
	 * @param memNo
	 * @return 수강전 클래스 리스트
	 */
	public ArrayList<Register> selectBFClassList(Connection conn, int memNo) {
		ArrayList<Register> bfList = new ArrayList<>();
		PreparedStatement pstmt = null;
		ResultSet rset =null;
		String sql = prop.getProperty("selectBFClassList");
		
		try {
			pstmt=conn.prepareStatement(sql);
			pstmt.setInt(1, memNo);
			
			rset=pstmt.executeQuery();
			
			while(rset.next()) {
				bfList.add(new Register(
										rset.getInt("reg_no"),
										rset.getString("teach_date"),
										rset.getString("reg_price"),
										rset.getString("reg_count"),
										rset.getString("reg_sta"),
										rset.getString("mem_name"),
									    rset.getString("mem_phone"),
									    rset.getString("mem_email"),
									    rset.getString("cl_name"),
									    rset.getString("cl_price"),
									    rset.getString("start_time")
						));
			}
		} catch (SQLException e) {
			e.printStackTrace();
		}finally {
			close(rset);
			close(pstmt);
		}
		
		return bfList;
	}

	/**
	 * @author 수정
	 * @param conn
	 * @param memNo
	 * @return 수강 완료 클래스 조회
	 */
	public ArrayList<Register> selectATClassList(Connection conn, int memNo) {
		ArrayList<Register> atList = new ArrayList<>();
		PreparedStatement pstmt = null;
		ResultSet rset =null;
		String sql = prop.getProperty("selectATClassList");
		
		try {
			pstmt=conn.prepareStatement(sql);
			pstmt.setInt(1, memNo);
			
			rset=pstmt.executeQuery();
			
			while(rset.next()) {
				atList.add(new Register(
										rset.getInt("reg_no"),
										rset.getString("teach_date"),
										rset.getString("reg_price"),
										rset.getString("reg_count"),
										rset.getString("reg_sta"),
										rset.getString("mem_name"),
									    rset.getString("mem_phone"),
									    rset.getString("mem_email"),
									    rset.getString("cl_name"),
									    rset.getString("cl_price"),
									    rset.getString("start_time")
						));
			}
		} catch (SQLException e) {
			e.printStackTrace();
		}finally {
			close(rset);
			close(pstmt);
		}
		
		return atList;
	}

	/**
	 * @author 수정
	 * @param conn
	 * @param regNo
	 * @return 예약관리 상세페이지 조회
	 */
	public Register selectReservationClass(Connection conn, int regNo) {
		Register r = null;
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		String sql = prop.getProperty("selectReservationClass");
		try {
			pstmt=conn.prepareStatement(sql);
			pstmt.setInt(1, regNo);
			
			rset = pstmt.executeQuery();
			if(rset.next()) {
				r = new Register(rset.getInt("reg_no"),
								 rset.getString("teach_date"),
								 rset.getString("reg_date"),
								 rset.getString("reg_price"),
								 rset.getString("reg_count"),
								 rset.getString("reg_sta"),
							     rset.getString("re_enroll"),
								 rset.getString("mem_name"),
							     rset.getString("mem_phone"),
							     rset.getString("mem_email"),
							     rset.getString("cl_name"),
							     rset.getString("cl_price"),
							     rset.getString("start_time"),
							     rset.getString("end_time"),
							     rset.getString("memo"));
					
			}
		} catch (SQLException e) {
			e.printStackTrace();
		}
			
		
		return r;
	}

	/**
	 * @author 수정
	 * @param conn
	 * @param r
	 * @return 예약상세페이지 수강상태, 메모 업데이트
	 */
	public int updateReservation(Connection conn, Register r) {
		int result = 0;
		PreparedStatement pstmt = null;
		String sql = prop.getProperty("updateReservation");
		
		try {
			pstmt = conn.prepareStatement(sql);
			
			pstmt.setString(1, r.getRegSta());
			pstmt.setString(2, r.getMemo());
			pstmt.setInt(3,r.getRegNo());
			
			result = pstmt.executeUpdate();
		} catch (SQLException e) {
			e.printStackTrace();
		}finally {
			close(pstmt);
		}
		
		return result;
		
	}


	
	
	
}
