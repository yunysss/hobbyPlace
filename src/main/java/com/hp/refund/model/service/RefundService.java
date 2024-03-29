package com.hp.refund.model.service;

import static com.hp.common.JDBCTemplate.*;

import java.sql.Connection;
import java.util.ArrayList;

import com.hp.refund.model.dao.RefundDao;
import com.hp.refund.model.vo.Refund;
import com.hp.register.model.vo.Register;

public class RefundService {
	
	/**
	 * @author 예서
	 * @param status 환불상태
	 * @return 관리자 검색 환불 리스트
	 */
	public ArrayList<Refund> selectRefundMng(String keywordType, String keyword, String dateType, String startDate, String endDate, String status){
		Connection conn = getConnection();
		ArrayList<Refund> list = new RefundDao().selectRefundMng(conn, keywordType, keyword, dateType, startDate, endDate, status);
		close(conn);
		return list;
	}
	
	/**
	 * @author 예서
	 * @param refNo 주문번호
	 * @param refSt 환불상태
	 * @return 선택한 환불상태로 UPDATE & 환불처리일자 UPDATE
	 */
	public int updateRefund(String refNo, String refSt) {
		Connection conn = getConnection();
		
		int result1 = new RefundDao().updateRefund(conn, refNo, refSt);
		int result2 = 0;
		if(refSt.equals("Y")) {
			result2 = new RefundDao().updateRefFinDt(conn, refNo);
		} else {
			result2 = new RefundDao().updateRefFinDtNull(conn, refNo);
		}
		
		
		if(result1 > 0 && result2 > 0) {
			commit(conn);
		} else {
			rollback(conn);
		}
		return result1 * result2;
	}
	
	/**
	 * @author 예서
	 * @param refNo 주문번호
	 * @return 무통장입금 상세내역
	 */
	public Refund selectRefundDeposit(int refNo) {
		Connection conn = getConnection();
		Refund r = new RefundDao().selectRefundDeposit(conn, refNo);
		close(conn);
		return r;
		
	}
	
	/**
	 * @author 수정
	 * @param regNo
	 * @return r 환불하려는 클래스 정보
	 */
	public Register selectRefundClass(int regNo) {		
		Connection conn = getConnection();
		Register r = new RefundDao().selectRefundClass(conn, regNo);
		close(conn);
		return r;
	}


	/**
	 * @author 수정
	 * @param ref
	 * 환불 요청 데이터 올리기, 글상태 변경
	 * @return 
	 */
	public int insertRefund(Refund ref, int orderNo, String regSta) {
		Connection conn = getConnection();
		int result1 = 0;
		if(ref.getDepositSta().equals("N")) {
			result1 = new RefundDao().insertRefundN(conn,ref);
		}else {
			result1 = new RefundDao().insertRefund(conn, ref);
		}
		
		int result2 = new RefundDao().updateStatus(conn, orderNo, regSta);
		
		if(result1>0 && result2>0) {
			commit(conn);
		}else {
			rollback(conn);
		}
		
		close(conn);
		
		return result1*result2;
		
	}

	/**
	 * @author 수정
	 * @param regNo
	 * @return 
	 * 사용자가 입력한 환불 정보가 들어있음
	 */
	public Refund selectRefundInfo(int regNo) {
		Connection conn = getConnection();
		Refund ref = new RefundDao().selectRefundInfo(conn, regNo);
		close(conn);
		
		return ref;
	}


	

}
