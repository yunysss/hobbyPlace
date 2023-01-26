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
				int endRow = startRow+10;
				pstmt.setInt(1, startRow);
				pstmt.setInt(2, endRow);
				rset = pstmt.executeQuery();
				
				while(rset.next()) {
					list.add(new Notice(rset.getInt("nt_no"),
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
				int endRow = startRow+10;
				pstmt.setInt(1, startRow);
				pstmt.setInt(2, endRow);
				rset = pstmt.executeQuery();
				
				while(rset.next()) {
					list.add(new Faq(rset.getInt("faq_no"),
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
}
