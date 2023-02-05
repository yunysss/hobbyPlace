package com.hp.admin.model.service;

import static com.hp.common.JDBCTemplate.close;
import static com.hp.common.JDBCTemplate.commit;
import static com.hp.common.JDBCTemplate.getConnection;
import static com.hp.common.JDBCTemplate.rollback;

import java.sql.Connection;
import java.util.ArrayList;

import com.hp.admin.model.dao.AdminDao;
import com.hp.admin.model.vo.MemberList;
import com.hp.admin.model.vo.Search;
import com.hp.admin.model.vo.SearchMember;
import com.hp.admin.model.vo.SearchTutor;
import com.hp.admin.model.vo.TutorList;
import com.hp.common.model.vo.Attachment;
import com.hp.common.model.vo.PageInfo;
import com.hp.lesson.model.vo.Category;
import com.hp.lesson.model.vo.Dcategory;
import com.hp.lesson.model.vo.District;
import com.hp.lesson.model.vo.Lesson;
import com.hp.lesson.model.vo.Schedule;
import com.hp.member.model.vo.Like;
import com.hp.member.model.vo.Member;
import com.hp.qna.model.vo.Qna;
import com.hp.register.model.vo.Register;
import com.hp.review.model.vo.Review;
import com.hp.tutor.model.vo.Tutor;

public class AdminService {
	
	public int selectClassCount() { // 게시글 수 조회하기
		Connection conn = getConnection();
		int listCount = new AdminDao().selectClassCount(conn);
		
		close(conn);
		return listCount;
		
	}
	
	public ArrayList<Lesson> selectClassList(PageInfo pi){
		Connection conn= getConnection();
		ArrayList<Lesson> list = new AdminDao().selectClassList(conn,pi);
		close(conn);
		
		
		return list;

	}
	
	public ArrayList<Category> selectCategoryList(){
		Connection conn = getConnection();
		ArrayList<Category> cList = new AdminDao().selectCategoryList(conn);
		close(conn);
		return cList;
	}
	
	public ArrayList<Dcategory> selectDcategoryList(){
		Connection conn = getConnection();
		ArrayList<Dcategory> dList = new AdminDao().selectDcategoryList(conn);
		close(conn);
		return dList;
	}

	public Member adminLogin(String userId, String userPwd) {
		Connection conn = getConnection();
		Member m = new AdminDao().adminLogin(conn, userId, userPwd);
		close(conn);
		return m;
	}
	
	public Lesson selectClass(int clNo) {
		Connection conn = getConnection();
		Lesson l = new AdminDao().selectClass(conn, clNo);
		close(conn);
		return l;
	}
	
	public ArrayList<Schedule> selectSchedule(int clNo) {
		Connection conn = getConnection();
		ArrayList<Schedule> sList = new AdminDao().selectSchedule(conn,clNo);
		close(conn);
		return sList;
	}
	
	public int selectNewClassCount() { // 게시글 수 조회하기
		Connection conn = getConnection();
		int listCount = new AdminDao().selectNewClassCount(conn);
		
		close(conn);
		return listCount;
		
	}
	
	public ArrayList<Lesson> selectNewClassList(PageInfo pi){
		Connection conn= getConnection();
		ArrayList<Lesson> list = new AdminDao().selectNewClassList(conn,pi);
		close(conn);
		
		
		return list;

	}
	
	public Tutor selectTutor(int clNo) {
		Connection conn = getConnection();
		Tutor t = new AdminDao().selectTutor(conn, clNo); 
		close(conn);
		return t;
	}
	
	public int classApprovalUpdate(int clNo) {
		Connection conn = getConnection();
		int result = new AdminDao().classApprovalUpdate(conn, clNo);
		if(result>0) {
			commit(conn);
		}else {
			rollback(conn);
		}
		close(conn);
		return result;
	}
	
	public int classRefuseUpdate(int clNo, String refuse) {
		Connection conn = getConnection();
		int result = new AdminDao().classRefuseUpdate(conn, clNo,refuse);
		if(result>0) {
			commit(conn);
		}else {
			rollback(conn);
		}
		close(conn);
		return result;
	}
	
	public ArrayList<Attachment> selectAttachmentList(int clNo) {
		Connection conn = getConnection();
		ArrayList<Attachment> list = new AdminDao().selectAttachmentList(conn, clNo);
		close(conn);
		
		return list;
		
	}
	public ArrayList<Lesson> searchClass(Search s){
		Connection conn = getConnection();
		ArrayList<Lesson> list = new AdminDao().searchClass(conn, s);
		close(conn);
		return list; 
		
	}

	/**	기본검색으로 회원조회시 회원리스트 select 
	 * @author 수연
	 * @param sGroup
	 * @param fCategory
	 * @param lineup
	 * @param pi 
	 * @return list
	 */
	public ArrayList<MemberList> selectMemberList(String sGroup, String fCategory, String lineup) {
		Connection conn = getConnection();
		ArrayList<MemberList> list = new AdminDao().selectMemberList(conn, sGroup, fCategory, lineup);
		close(conn);
		return list;
	}

	/** 회원번호로 회원기본정보 조회 Service메소드
	 * @author 수연
	 * @param memNo
	 * @return m
	 */
	public Member selectMemberByNo(int memNo) {
		Connection conn = getConnection();
		Member m = new AdminDao().selectMemberByNo(conn, memNo);
		
		close(conn);
		return m;
	}
	
	/** 회원번호로 qna리스트 조회 Service메소드
	 * @author 수연
	 * @param memNo
	 * @return qnaList
	 */
	public ArrayList<Qna> selectAllQna(int memNo) {
		Connection conn = getConnection();
		ArrayList<Qna> qnaList = new AdminDao().selectAllQna(conn, memNo);
		
		close(conn);
		return qnaList;
	}
	/** 회원번호로 수강한클래스리스트 조회 service메소드
	 * @author 수연
	 * @param memNo
	 * @return regList
	 */
	public ArrayList<Register> selectAllRegister(int memNo) {
		Connection conn = getConnection();
		ArrayList<Register> regList = new AdminDao().selectAllRegister(conn, memNo);
		
		close(conn);
		return regList;
	}

	/** 회원번호로 리뷰리스트 조회 service메소드
	 * @author 수연
	 * @param memNo
	 * @return revList
	 */
	public ArrayList<Review> selectAllReview(int memNo) {
		Connection conn = getConnection();
		ArrayList<Review> revList = new AdminDao().selectAllReview(conn, memNo);
		
		close(conn);
		return revList;
	}

	/** 회원번호로 찜하기 리스트 조회용 service메소드
	 * @author 수연
	 * @param memNo
	 * @return likeList
	 */
	public ArrayList<Like> selectAllLike(int memNo) {
		Connection conn = getConnection();
		ArrayList<Like> likeList = new AdminDao().selectAllLike(conn, memNo);
		
		close(conn);
		return likeList;
	}
	
	
	
	public int checkedClassReject(String classNo, String cause) {
		Connection conn = getConnection();
		int result = new AdminDao().checkedClassReject(conn, classNo, cause);
		if(result>0) {
			commit(conn);
		}else {
			rollback(conn);
		}
		close(conn);
		return result;
	}

	/** 회원 세부검색용 service
	 * @author 수연
	 * @param sm
	 * @return list
	 */
	public ArrayList<MemberList> selectMemberList2(SearchMember sm) {
		Connection conn = getConnection();
		ArrayList<MemberList> list = new AdminDao().selectMemberList2(conn, sm);
		
		close(conn);
		return list;
	}
	
	public int checkedClassApprove(String classNo) {
		Connection conn = getConnection();
		int result = new AdminDao().checkedClassApprove(conn, classNo);
		if(result>0) {
			commit(conn);
		}else {
			rollback(conn);
		}
		close(conn);
		return result;
		
		
		
	}
	
	/** 튜터 조회 기본검색용 list  
	 * @author 수연
	 * @param st
	 * @return list
	 */
	public ArrayList<TutorList> selectTutorList1(SearchTutor st) {
		Connection conn = getConnection();
		ArrayList<TutorList> list = new AdminDao().selectTutorList1(conn, st);
		
		close(conn);
		return list;
	}

	

	public ArrayList<District> selectLocalList(){
		Connection conn = getConnection();
		ArrayList<District> list = new AdminDao().selectLocalList(conn);
		close(conn);
		return list;
	}
	
	public ArrayList<District> selectDistrictList(){
		Connection conn = getConnection();
		ArrayList<District> list = new AdminDao().selectDistrictList(conn);
		close(conn);
		return list;
	}

	public ArrayList<Lesson> searchStat(Search s){
		Connection conn = getConnection();
		ArrayList<Lesson> list = new AdminDao().searchStat(conn, s);
		close(conn);
		return list;
	}

	
	

}
