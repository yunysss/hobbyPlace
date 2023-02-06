package com.hp.customerService.model.Service;

import java.sql.Connection;
import java.util.ArrayList;

import com.hp.common.model.vo.Attachment;
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
	
	public int selectTutorNoticeListCount() {
		Connection conn = getConnection();
		int listCount = new NoticeDao().selectTutorNoticeListCount(conn);
		
		close(conn);
		
		return listCount;
	}
	
	public ArrayList<Notice> selectTutorNoticeList(PageInfo pi){
		Connection conn = getConnection();
		
		ArrayList<Notice> list = new NoticeDao().selectTutorNoticeList(conn, pi);
		
		close(conn);
		
		return list;
	}
	
	public Notice selectTutorNoticeDetail(int ntNo) { 
		Connection conn = getConnection();
		Notice n = new NoticeDao().selectTutorNoticeDetail(conn, ntNo);
		
		close(conn);
		return n;
	}
	
	
	public int selectTutorFaqListCount() {
		Connection conn = getConnection();
		int listCount = new NoticeDao().selectTutorFaqListCount(conn);
		
		close(conn);
		
		return listCount;
		
	}
	
	public ArrayList<Faq> selectTutorFaqList(PageInfo pi){
		Connection conn = getConnection();
		
		ArrayList<Faq> list = new NoticeDao().selectTutorFaqList(conn, pi);
		
		close(conn);
		
		return list;
	}
	
	public int selectAdminNoticeListCount() {
		Connection conn = getConnection();
		int listCount = new NoticeDao().selectAdminNoticeListCount(conn);
		
		close(conn);
		
		return listCount;
		
	}
	
	public ArrayList<Notice> selectAdminNoticeList(PageInfo pi){
			
			Connection conn = getConnection();
			
			ArrayList<Notice> list = new NoticeDao().selectAdminNoticeList(conn, pi);
			
			close(conn);
			
			return list;
	}

	public int selectKeywordNoticeListCount(String keyword) {
		Connection conn = getConnection();
		int listCount = new NoticeDao().selectKeywordNoticeListCount(conn, keyword);
		
		close(conn);
		
		return listCount;
		
	}
	
	public ArrayList<Notice> selectKeywordNoticeList(PageInfo pi, String keyword){
		
		Connection conn = getConnection();
		
		ArrayList<Notice> list = new NoticeDao().selectKeywordNoticeList(conn, pi, keyword);
		
		close(conn);
		
		return list;
	}
	
	public int insertNotice(Notice n, Attachment at) {
		
		Connection conn = getConnection();
		
		int result1 = new NoticeDao().insertNotice(conn, n);
		
		int result2 = 1;
		if(at != null) {
			 result2 =new NoticeDao().insertAttachment(conn, at);
		}
		
		if(result1>0 && result2>0) {
			commit(conn);
		}else {
			rollback(conn);
		}
		close(conn);
		
		return result1 * result2;
		
	}
	
	public Notice selectAdminNoticeDetail(int ntNo) { 
		Connection conn = getConnection();
		Notice n = new NoticeDao().selectAdminNoticeDetail(conn, ntNo);
		
		close(conn);
		return n;
	}
	
	public Attachment selectAdminNoticeAttachment(int ntNo) {
		Connection conn = getConnection();
		Attachment at = new NoticeDao().selectAdminNoticeAttachment(conn, ntNo);
		
		close(conn);
		return at;
	}
	
	public int deleteNotice(int ntNo) {
		
		Connection conn = getConnection();
		int result = new NoticeDao().deleteNotice(conn, ntNo);
		if(result > 0) {
			commit(conn);
		}else {
			rollback(conn);
		}
		close(conn);
		return result;
	}
	
	public ArrayList<Faq> selectTutorFaqListAd(){
		Connection conn = getConnection();
		
		ArrayList<Faq> list1 = new NoticeDao().selectTutorFaqListAd(conn);
		
		close(conn);
		
		return list1;
	}
	
	public ArrayList<Faq> selectTuteeFaqList(){
		Connection conn = getConnection();
		
		ArrayList<Faq> list2 = new NoticeDao().selectTuteeFaqList(conn);
		
		close(conn);
		
		return list2;
	}
	
	public int insertFaqTutor(String title, String content) {
		Connection conn = getConnection();
		int result = new NoticeDao().insertFaqTutor(conn, title, content);
		if(result > 0) {
			commit(conn);
		}else {
			rollback(conn);
		}
		close(conn);
		return result;
	}
	
	public int insertFaqTutee(String title, String content) {
		Connection conn = getConnection();
		int result = new NoticeDao().insertFaqTutee(conn, title, content);
		if(result > 0) {
			commit(conn);
		}else {
			rollback(conn);
		}
		close(conn);
		return result;
	}
	
	public Faq selectTutorFaqDetail(int no) {
		Connection conn = getConnection();
		Faq f= new NoticeDao().selectTutorFaqDetail(conn, no);
		
		close(conn);
		return f;
	}
	
	public int faqUpdate(Faq f) {
		Connection conn = getConnection();
		
		int result = new NoticeDao().faqUpdate(conn, f);
		if(result > 0) {
			commit(conn);
		}else {
			rollback(conn);
		}
		close(conn);
		return result;
		
	}
	
	public int deleteFaq(int no) {
		
		Connection conn = getConnection();
		int result = new NoticeDao().deleteFaq(conn, no);
		if(result > 0) {
			commit(conn);
		}else {
			rollback(conn);
		}
		close(conn);
		return result;
	}
	
	public ArrayList<Faq> keywordFaqTutee(String keyword){
		
		Connection conn = getConnection();
		
		ArrayList<Faq> list = new NoticeDao().keywordFaqTutee(conn, keyword);
		
		close(conn);
		
		return list;
	}
	
	public ArrayList<Faq> keywordFaqTutor(String keyword){
		
		Connection conn = getConnection();
		
		ArrayList<Faq> list = new NoticeDao().keywordFaqTutor(conn, keyword);
		
		close(conn);
		
		return list;
	}
	
	public ArrayList<Notice> keywordNoticeTutee(String keyword){
		
		Connection conn = getConnection();
		
		ArrayList<Notice> list = new NoticeDao().keywordNoticeTutee(conn, keyword);
		
		close(conn);
		
		return list;
	}
	
	public ArrayList<Notice> keywordNoticeTutor(String keyword){
		
		Connection conn = getConnection();
		
		ArrayList<Notice> list = new NoticeDao().keywordNoticeTutor(conn, keyword);
		
		close(conn);
		
		return list;
	}
}
