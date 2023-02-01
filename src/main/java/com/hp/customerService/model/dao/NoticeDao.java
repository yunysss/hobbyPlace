package com.hp.customerService.model.dao;

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

import com.hp.common.model.vo.Attachment;
import com.hp.common.model.vo.PageInfo;
import com.hp.customerService.model.vo.Faq;
import com.hp.customerService.model.vo.Notice;

import static com.hp.common.JDBCTemplate.*;

public class NoticeDao {

	
		private Properties prop = new Properties();
		
		public NoticeDao() {
			try {
				prop.loadFromXML(new FileInputStream(NoticeDao.class.getResource("/db/sql/notice-mapper.xml").getPath()));
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
		
		public ArrayList<Notice> selectNoticeListup(Connection conn){
			ArrayList<Notice> list= new ArrayList<>();
			PreparedStatement pstmt = null;
			ResultSet rset = null;
			String sql = prop.getProperty("selectNoticeListup");
			
			try {
				pstmt = conn.prepareStatement(sql);
				rset = pstmt.executeQuery();
				
				while(rset.next()) {
					list.add(new Notice(rset.getInt("nt_no"),
										rset.getString("nt_title")));
					
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
		
		public ArrayList<Faq> selectFaqListup(Connection conn){
			ArrayList<Faq> list2= new ArrayList<>();
			PreparedStatement pstmt = null;
			ResultSet rset = null;
			String sql =prop.getProperty("selectFaqListup");
			
			try {
				pstmt = conn.prepareStatement(sql);
				rset = pstmt.executeQuery();
				
				while(rset.next()) {
					list2.add(new Faq(rset.getInt("faq_no"),
									 rset.getString("question")));
				}
			} catch (SQLException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}finally {
				close(rset);
				close(pstmt);
			}
			return list2;
		}
		
		public ArrayList<Notice> selectNoticeList(Connection conn, PageInfo pi){
			ArrayList<Notice> list= new ArrayList<>();
			PreparedStatement pstmt = null;
			ResultSet rset = null;
			String sql = prop.getProperty("selectNoticeList");
			
			try {
				pstmt = conn.prepareStatement(sql);
				int startRow = (pi.getCurrentPage()-1)*pi.getBoardLimit()+1;
				int endRow = startRow+9;
				pstmt.setInt(1, startRow);
				pstmt.setInt(2, endRow);
				rset = pstmt.executeQuery();
				
				while(rset.next()) {
					list.add(new Notice(rset.getInt("rNum"),
										rset.getInt("nt_no"),
										rset.getString("nt_mem"),
										rset.getString("nt_title"),
										rset.getString("nt_content"),
										rset.getDate("enroll_date"),
										rset.getDate("update_date"),
										rset.getString("grade"),
										rset.getString("nt_sta")));
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
		
		public ArrayList<Faq> selectFaqList(Connection conn, PageInfo pi){
			ArrayList<Faq> list= new ArrayList<>();
			PreparedStatement pstmt = null;
			ResultSet rset = null;
			String sql =prop.getProperty("selectFaqList");
			
			try {
				pstmt = conn.prepareStatement(sql);
				int startRow = (pi.getCurrentPage()-1)*pi.getBoardLimit()+1;
				int endRow = startRow+9;
				pstmt.setInt(1, startRow);
				pstmt.setInt(2, endRow);
				rset = pstmt.executeQuery();
				
				while(rset.next()) {
					list.add(new Faq(rset.getInt("rNum"),
									rset.getInt("faq_no"),
									rset.getString("mem_no"),
									rset.getString("grade"),
									rset.getString("question"),
									rset.getString("answer"),
									rset.getDate("enroll_date"),
									rset.getDate("update_date")));
				}
			} catch (SQLException e) {
				e.printStackTrace();
			}finally {
				close(rset);
				close(pstmt);
			}
			return list;
		}
		
		public int selectNoticeListCount(Connection conn) {
			int listCount = 0;
			PreparedStatement pstmt = null;
			ResultSet rset = null;
			String sql =prop.getProperty("selectNoticeListCount");
			
			try {
				pstmt = conn.prepareStatement(sql);
				rset = pstmt.executeQuery();
				
				if(rset.next()) {
					listCount = rset.getInt("count");
				}
			} catch (SQLException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}finally {
				close(rset);
				close(pstmt);
			}
			return listCount;
			
		}
		
		public int selectFaqListCount(Connection conn) {
			int listCount = 0;
			PreparedStatement pstmt = null;
			ResultSet rset = null;
			String sql =prop.getProperty("selectFaqListCount");
			
			try {
				pstmt = conn.prepareStatement(sql);
				rset = pstmt.executeQuery();
				
				if(rset.next()) {
					listCount = rset.getInt("count");
				}
			} catch (SQLException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}finally {
				close(rset);
				close(pstmt);
			}
			return listCount;
			
		}
		
		public Notice selectNoticeDetail(Connection conn, int ntNo) {
			Notice n = new Notice();
			PreparedStatement pstmt = null;
			ResultSet rset = null;
			String sql = prop.getProperty("selectNoticeDetail");
			
			try {
				pstmt=conn.prepareStatement(sql);
				pstmt.setInt(1, ntNo);
				rset=pstmt.executeQuery();
				
				if(rset.next()) {
					n.setNtNo(ntNo);
					n.setNtTitle(rset.getString("nt_title"));
					n.setNtContent(rset.getString("nt_content"));
					n.setEnrollDate(rset.getDate("enroll_date"));
				}
				
			} catch (SQLException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}finally {
				close(rset);
				close(pstmt);
			}
			return n;
		}
		
		public int selectTutorNoticeListCount(Connection conn) {
			int listCount = 0;
			PreparedStatement pstmt = null;
			ResultSet rset = null;
			String sql =prop.getProperty("selectTutorNoticeListCount");
			
			try {
				pstmt = conn.prepareStatement(sql);
				rset = pstmt.executeQuery();
				
				if(rset.next()) {
					listCount = rset.getInt("count");
				}
			} catch (SQLException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}finally {
				close(rset);
				close(pstmt);
			}
			return listCount;
			
		}
		
		public ArrayList<Notice> selectTutorNoticeList(Connection conn, PageInfo pi){
			ArrayList<Notice> list= new ArrayList<>();
			PreparedStatement pstmt = null;
			ResultSet rset = null;
			String sql = prop.getProperty("selectTutorNoticeList");
			
			try {
				pstmt = conn.prepareStatement(sql);
				int startRow = (pi.getCurrentPage()-1)*pi.getBoardLimit()+1;
				int endRow = startRow+9;
				pstmt.setInt(1, startRow);
				pstmt.setInt(2, endRow);
				rset = pstmt.executeQuery();
				
				while(rset.next()) {
					list.add(new Notice(rset.getInt("rNum"),
										rset.getInt("nt_no"),
										rset.getString("nt_mem"),
										rset.getString("nt_title"),
										rset.getString("nt_content"),
										rset.getDate("enroll_date"),
										rset.getDate("update_date"),
										rset.getString("grade"),
										rset.getString("nt_sta")));
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
		
		public Notice selectTutorNoticeDetail(Connection conn, int ntNo) {
			Notice n = new Notice();
			PreparedStatement pstmt = null;
			ResultSet rset = null;
			String sql = prop.getProperty("selectTutorNoticeDetail");
			
			try {
				pstmt=conn.prepareStatement(sql);
				pstmt.setInt(1, ntNo);
				rset=pstmt.executeQuery();
				
				if(rset.next()) {
					n.setNtNo(ntNo);
					n.setNtTitle(rset.getString("nt_title"));
					n.setNtContent(rset.getString("nt_content"));
					n.setEnrollDate(rset.getDate("enroll_date"));
				}
				
			} catch (SQLException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}finally {
				close(rset);
				close(pstmt);
			}
			return n;
		}
		
		public int selectTutorFaqListCount(Connection conn) {
			int listCount = 0;
			PreparedStatement pstmt = null;
			ResultSet rset = null;
			String sql =prop.getProperty("selectTutorFaqListCount");
			
			try {
				pstmt = conn.prepareStatement(sql);
				rset = pstmt.executeQuery();
				
				if(rset.next()) {
					listCount = rset.getInt("count");
				}
			} catch (SQLException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}finally {
				close(rset);
				close(pstmt);
			}
			return listCount;
			
		}
		
		public ArrayList<Faq> selectTutorFaqList(Connection conn, PageInfo pi){
			ArrayList<Faq> list= new ArrayList<>();
			PreparedStatement pstmt = null;
			ResultSet rset = null;
			String sql =prop.getProperty("selectTutorFaqList");
			
			try {
				pstmt = conn.prepareStatement(sql);
				int startRow = (pi.getCurrentPage()-1)*pi.getBoardLimit()+1;
				int endRow = startRow+9;
				pstmt.setInt(1, startRow);
				pstmt.setInt(2, endRow);
				rset = pstmt.executeQuery();
				
				while(rset.next()) {
					list.add(new Faq(rset.getInt("rNum"),
									rset.getInt("faq_no"),
									rset.getString("mem_no"),
									rset.getString("grade"),
									rset.getString("question"),
									rset.getString("answer"),
									rset.getDate("enroll_date"),
									rset.getDate("update_date")));
				}
			} catch (SQLException e) {
				e.printStackTrace();
			}finally {
				close(rset);
				close(pstmt);
			}
			return list;
		}
		
		public int selectAdminNoticeListCount(Connection conn) {
			int listCount = 0;
			PreparedStatement pstmt = null;
			ResultSet rset = null;
			String sql =prop.getProperty("selectAdminNoticeListCount");
			
			try {
				pstmt = conn.prepareStatement(sql);
				rset = pstmt.executeQuery();
				
				if(rset.next()) {
					listCount = rset.getInt("count");
				}
			} catch (SQLException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}finally {
				close(rset);
				close(pstmt);
			}
			return listCount;
			
		}
		
		public ArrayList<Notice> selectAdminNoticeList(Connection conn, PageInfo pi){
			ArrayList<Notice> list= new ArrayList<>();
			PreparedStatement pstmt = null;
			ResultSet rset = null;
			String sql = prop.getProperty("selectAdminNoticeList");
			
			try {
				pstmt = conn.prepareStatement(sql);
				int startRow = (pi.getCurrentPage()-1)*pi.getBoardLimit()+1;
				int endRow = startRow+9;
				pstmt.setInt(1, startRow);
				pstmt.setInt(2, endRow);
				rset = pstmt.executeQuery();
				
				while(rset.next()) {
					list.add(new Notice(rset.getInt("rNum"),
										rset.getInt("nt_no"),
										rset.getString("nt_mem"),
										rset.getString("nt_title"),
										rset.getString("nt_content"),
										rset.getDate("enroll_date"),
										rset.getDate("update_date"),
										rset.getString("grade"),
										rset.getString("nt_sta")));
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
		
		public int selectKeywordNoticeListCount(Connection conn, String keyword) {
			int listCount = 0;
			PreparedStatement pstmt = null;
			ResultSet rset = null;
			String sql =prop.getProperty("selectKeywordNoticeListCount");
			
			try {
				pstmt = conn.prepareStatement(sql);
				pstmt.setString(1, "%"+keyword+"%");
				rset = pstmt.executeQuery();
				
				if(rset.next()) {
					listCount = rset.getInt("count");
				}
			} catch (SQLException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}finally {
				close(rset);
				close(pstmt);
			}
			return listCount;
			
		}
		
		public ArrayList<Notice> selectKeywordNoticeList(Connection conn, PageInfo pi, String keyword){
			ArrayList<Notice> list= new ArrayList<>();
			PreparedStatement pstmt = null;
			ResultSet rset = null;
			String sql = prop.getProperty("selectKeywordNoticeList");
			
			try {
				pstmt = conn.prepareStatement(sql);
				int startRow = (pi.getCurrentPage()-1)*pi.getBoardLimit()+1;
				int endRow = startRow+9;
				pstmt.setString(1, "%"+keyword+"%");
				pstmt.setInt(2, startRow);
				pstmt.setInt(3, endRow);
				rset = pstmt.executeQuery();
				
				while(rset.next()) {
					list.add(new Notice(rset.getInt("rNum"),
										rset.getInt("nt_no"),
										rset.getString("nt_mem"),
										rset.getString("nt_title"),
										rset.getString("nt_content"),
										rset.getDate("enroll_date"),
										rset.getDate("update_date"),
										rset.getString("grade"),
										rset.getString("nt_sta")));
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
		
		public int insertNotice(Connection conn, Notice n) {
			int result = 0;
			PreparedStatement pstmt = null;
			String sql = prop.getProperty("insertNotice");
			
			try {
				pstmt = conn.prepareStatement(sql);
				pstmt.setString(1,n.getNtTitle());
				pstmt.setString(2, n.getNtContent());
				pstmt.setString(3, n.getGrade());
				
				result = pstmt.executeUpdate();
			} catch (SQLException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}finally {
				close(pstmt);
			}
			return result;
			
		}
		
		public int insertAttachment(Connection conn, Attachment at) {
			int result = 0;
			PreparedStatement pstmt = null;
			String sql = prop.getProperty("insertAttachment");
			
			try {
				pstmt = conn.prepareStatement(sql);
				pstmt.setString(1, at.getOriginName());
				pstmt.setString(2, at.getChangeName());
				pstmt.setString(3, at.getFilePath());
				
				result = pstmt.executeUpdate();
			} catch (SQLException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}finally {
				close(pstmt);
			}
			return result;
		}
		
		public Notice selectAdminNoticeDetail(Connection conn, int ntNo) {
			Notice n = new Notice();
			PreparedStatement pstmt = null;
			ResultSet rset = null;
			String sql = prop.getProperty("selectAdminNoticeDetail");
			
			try {
				pstmt=conn.prepareStatement(sql);
				pstmt.setInt(1, ntNo);
				rset=pstmt.executeQuery();
				
				if(rset.next()) {
					n.setNtNo(ntNo);
					n.setNtTitle(rset.getString("nt_title"));
					n.setNtContent(rset.getString("nt_content"));
					n.setEnrollDate(rset.getDate("enroll_date"));
				}
				
			} catch (SQLException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}finally {
				close(rset);
				close(pstmt);
			}
			return n;
		}
		
		public Attachment selectAdminNoticeAttachment(Connection conn, int ntNo) {
			Attachment at = null;
			PreparedStatement pstmt = null;
			ResultSet rset = null;
			String sql = prop.getProperty("selectAdminNoticeAttachment");
			
			try {
				pstmt = conn.prepareStatement(sql);
				pstmt.setInt(1, ntNo);
				
				rset = pstmt.executeQuery();
				
				if(rset.next()) {
					at = new Attachment(rset.getInt("file_no"),
												rset.getString("origin_name"),
												rset.getString("change_name"),
												rset.getString("file_path")
							);
				}
			} catch (SQLException e) {
				e.printStackTrace();
			}finally {
				close(rset);
				close(pstmt);
			}
			return at;
		}
		
		public int deleteNotice(Connection conn, int ntNo) {
			// update => 처리된행수
			int result = 0;
			PreparedStatement pstmt = null;
			String sql = prop.getProperty("deleteNotice");
			
			try {
				pstmt = conn.prepareStatement(sql);
				pstmt.setInt(1, ntNo);
				result = pstmt.executeUpdate();
				
			} catch (SQLException e) {
				e.printStackTrace();
			}finally {
				close(pstmt);
			}
			
			return result;
		}
		
		public ArrayList<Faq> selectTutorFaqListAd(Connection conn){
			ArrayList<Faq> list1= new ArrayList<>();
			PreparedStatement pstmt = null;
			ResultSet rset = null;
			String sql =prop.getProperty("selectTutorFaqListAd");
			
			try {
				pstmt = conn.prepareStatement(sql);
				
				rset = pstmt.executeQuery();
				
				while(rset.next()) {
					list1.add(new Faq(rset.getInt("rNum"),
									rset.getInt("faq_no"),
									rset.getString("mem_no"),
									rset.getString("grade"),
									rset.getString("question"),
									rset.getString("answer"),
									rset.getDate("enroll_date"),
									rset.getDate("update_date")));
				}
			} catch (SQLException e) {
				e.printStackTrace();
			}finally {
				close(rset);
				close(pstmt);
			}
			return list1;
		}
		
		public ArrayList<Faq> selectTuteeFaqList(Connection conn){
			ArrayList<Faq> list2= new ArrayList<>();
			PreparedStatement pstmt = null;
			ResultSet rset = null;
			String sql =prop.getProperty("selectTuteeFaqList");
			
			try {
				pstmt = conn.prepareStatement(sql);
				
				rset = pstmt.executeQuery();
				
				while(rset.next()) {
					list2.add(new Faq(rset.getInt("rNum"),
									rset.getInt("faq_no"),
									rset.getString("mem_no"),
									rset.getString("grade"),
									rset.getString("question"),
									rset.getString("answer"),
									rset.getDate("enroll_date"),
									rset.getDate("update_date")));
				}
			} catch (SQLException e) {
				e.printStackTrace();
			}finally {
				close(rset);
				close(pstmt);
			}
			return list2;
		}
		
		public int insertFaqTutor(Connection conn, String title, String content) {
			int result = 0;
			PreparedStatement pstmt = null;
			String sql = prop.getProperty("insertFaqTutor");
			
			try {
				pstmt = conn.prepareStatement(sql);
				pstmt.setString(1, title);
				pstmt.setString(2, content);
				
				result = pstmt.executeUpdate();
			} catch (SQLException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}finally {
				close(pstmt);
			}
			return result;
		}
		
		public Faq selectTutorFaqDetail(Connection conn, int no) {
			Faq f = new Faq();
			PreparedStatement pstmt = null;
			ResultSet rset = null;
			String sql = prop.getProperty("selectTutorFaqDetail");
			
			try {
				pstmt=conn.prepareStatement(sql);
				pstmt.setInt(1, no);
				rset=pstmt.executeQuery();
				
				if(rset.next()) {
					f.setFaqNO(no);
					f.setQuestion(rset.getString("question"));
					f.setAnswer(rset.getString("answer"));
				}
				
			} catch (SQLException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}finally {
				close(rset);
				close(pstmt);
			}
			return f;
		}
		
		public int faqUpdate(Connection conn, Faq f) {
			int result = 0;
			PreparedStatement pstmt = null;
			String sql = prop.getProperty("faqUpdate");
			
			try {
				pstmt = conn.prepareStatement(sql);
				pstmt.setString(1, f.getQuestion());
				pstmt.setString(2, f.getAnswer());
				pstmt.setInt(3, f.getFaqNO());
				
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
