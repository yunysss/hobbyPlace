package com.hp.refund.model.service;

import static com.hp.common.JDBCTemplate.*;

import java.sql.Connection;
import java.util.ArrayList;

import com.hp.refund.model.dao.RefundDao;
import com.hp.refund.model.vo.Refund;

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

}
