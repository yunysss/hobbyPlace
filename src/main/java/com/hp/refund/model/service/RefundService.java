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
	 * @return 환불상태별 리스트 (모든 회원, 모든 날짜, 정산상태별)
	 */
	public ArrayList<Refund> selectAllRefundList(String status){
		Connection conn = getConnection();
		ArrayList<Refund> list = new RefundDao().selectAllRefundList(conn, status);
		close(conn);
		return list;
	}

}
