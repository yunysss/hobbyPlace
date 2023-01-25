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
}
