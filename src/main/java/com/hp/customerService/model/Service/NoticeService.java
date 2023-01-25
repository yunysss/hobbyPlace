package com.hp.customerService.model.Service;

import java.sql.Connection;
import java.util.ArrayList;

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
	
	public ArrayList<Notice> selectNoticeList(){
		
		Connection conn = getConnection();
		
		ArrayList<Notice> list = new NoticeDao().selectNoticeList(conn);
		
		close(conn);
		
		return list;
	}
	
	public ArrayList<Faq> selectFaqList(){
		Connection conn = getConnection();
		
		ArrayList<Faq> list = new NoticeDao().selectFaqListup(conn);
		
		close(conn);
		
		return list;
	}
}
