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
		int result2 = new RefundDao().updateRefFinDt(conn, refNo);
		int result3 = new RefundDao().updateRefFinDtNull(conn, refNo);
		
		if(result1 > 0 && result2 > 0 && result3 > 0) {
			commit(conn);
		} else {
			rollback(conn);
		}
		return result1 * result2 * result3;
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
	 * @param memNo
	 * @return 취소한 클래스 조회
	 */
	public ArrayList<Refund> selectMyRefundClassList(int memNo) {
		Connection conn = getConnection();
		ArrayList<Refund> list = new RefundDao().selectMyRefundClassList(conn, memNo);
		close(conn);
		return list;
	}

	public Register selectRefundClass(int memNo) {		
		Connection conn = getConnection();
		Register r = new RefundDao().selectRefundClass(conn, memNo);
		close(conn);
		return r;
	}

}
