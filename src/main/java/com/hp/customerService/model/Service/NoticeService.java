package com.hp.customerService.model.Service;

import java.sql.Connection;
import java.util.ArrayList;

import com.hp.customerService.model.dao.NoticeDao;
import com.hp.customerService.model.vo.Notice;
import static com.hp.common.JDBCTemplate.*;

public class NoticeService {

	
	public ArrayList<Notice> selectNoticeListup() {
		
		Connection conn = getConnection();
		
		ArrayList<Notice> list = new NoticeDao().selectNoticeListup(conn);
		
		close(conn);
		
		return list;
	}
}
