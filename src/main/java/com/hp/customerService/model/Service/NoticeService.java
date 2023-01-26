package com.hp.customerService.model.Service;

import java.sql.Connection;
import java.util.ArrayList;

import com.hp.common.model.vo.PageInfo;
import com.hp.customerService.model.dao.NoticeDao;
import com.hp.customerService.model.vo.Faq;
import com.hp.customerService.model.vo.Notice;
import static com.hp.common.JDBCTemplate.*;

public class NoticeService {

	
	public ArrayList<Notice> selectNoticeListup() {
		
		Connection conn = getConnection();
		
		ArrayList<Notice> list = new NoticeDao().selectNoticeListup(conn);
		
		close(conn);
		
		return list;
	}
	
	public ArrayList<Faq> selectFaqListup(){
		Connection conn = getConnection();
		
		ArrayList<Faq> list2 = new NoticeDao().selectFaqListup(conn);
		
		close(conn);
		
		return list2;
	}
	
	public ArrayList<Notice> selectNoticeList(PageInfo pi){
		
		Connection conn = getConnection();
		
		ArrayList<Notice> list = new NoticeDao().selectNoticeList(conn, pi);
		
		close(conn);
		
		return list;
	}
	
	public ArrayList<Faq> selectFaqList(PageInfo pi){
		Connection conn = getConnection();
		
		ArrayList<Faq> list = new NoticeDao().selectFaqList(conn, pi);
		
		close(conn);
		
		return list;
	}
	
	public int selectNoticeListCount() {
		Connection conn = getConnection();
		int listCount = new NoticeDao().selectNoticeListCount(conn);
		
		close(conn);
		
		return listCount;
		
	}
	public int selectFaqListCount() {
		Connection conn = getConnection();
		int listCount = new NoticeDao().selectFaqListCount(conn);
		
		close(conn);
		
		return listCount;
		
	}
	
	public Notice selectNoticeDetail(int ntNo) { 
		Connection conn = getConnection();
		Notice n = new NoticeDao().selectNoticeDetail(conn, ntNo);
		
		close(conn);
		return n;
	}
}
