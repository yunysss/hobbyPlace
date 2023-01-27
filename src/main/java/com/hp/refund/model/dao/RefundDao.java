package com.hp.refund.model.dao;

import java.io.FileInputStream;
import java.io.IOException;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.Properties;
import static com.hp.common.JDBCTemplate.*;

import com.hp.refund.model.vo.Refund;

public class RefundDao {
private Properties prop = new Properties();
	
	public RefundDao(){
		String filePath = RefundDao.class.getResource("/db/sql/refund-mapper.xml").getPath();
		
		try {
			prop.loadFromXML(new FileInputStream(filePath));
		} catch (IOException e) {
			e.printStackTrace();
		}
	}
	
	/**
	 * @author 예서
	 * @param status 환불상태
	 * @return 환불상태별 리스트 (모든 회원, 모든 날짜, 정산상태별)
	 */
	public ArrayList<Refund> selectRefundMng(Connection conn, String keywordType, String keyword, String dateType, String startDate, String endDate, String status){
		ArrayList<Refund> list = new ArrayList<>();
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		String sql = prop.getProperty("selectRefundMng");
		if(!keyword.equals("")) {
			if(keywordType.equals("orderNo")) {
				sql += "AND ORDER_NO LIKE ?";
			} else {
				sql += "AND MEM_ID LIKE ?";
			}
		}
		if(!startDate.equals("") && !endDate.equals("")) {
			if(dateType.equals("regDate")) {
				sql += "AND REG_DATE BETWEEN ? AND TO_DATE(?, 'YYYY-MM-DD') + 1";
			} else {
				sql += "AND REF_RQ_DT BETWEEN ? AND TO_DATE(?, 'YYYY-MM-DD') + 1";
			}
		}
		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, "%" + status + "%");
			if(!keyword.equals("")) {
				pstmt.setString(2, "%" + keyword + "%");
				if(!startDate.equals("") && !endDate.equals("")) {
					pstmt.setString(3, startDate);
					pstmt.setString(4, endDate);
				}
			}else {
				if(!startDate.equals("") && !endDate.equals("")) {
					pstmt.setString(2, startDate);
					pstmt.setString(3, endDate);
				}
			}
			rset = pstmt.executeQuery();
			while(rset.next()) {
				list.add(new Refund(rset.getInt("order_no"),
								    rset.getString("mem_id"),
								    rset.getString("ref_rq_dt"),
								    rset.getString("ref_fin_dt"),
								    rset.getString("ref_price"),
								    rset.getString("reg_date"),
								    rset.getString("reg_pay"),
								    rset.getString("cl_no"),
								    rset.getString("ref_sta"),
								    rset.getString("ref_rea")
								    ));
			}
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(rset);
			close(pstmt);
		}
		return list;
	}

}
