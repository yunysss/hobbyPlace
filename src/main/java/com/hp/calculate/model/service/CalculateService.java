package com.hp.calculate.model.service;

import static com.hp.common.JDBCTemplate.*;

import java.sql.Connection;
import java.util.ArrayList;

import com.hp.calculate.model.dao.CalculateDao;
import com.hp.calculate.model.vo.Calculate;
import com.hp.register.model.vo.Register;

public class CalculateService {

	public ArrayList<Register> selectTutorCalculate(int memNo, String status){
		Connection conn = getConnection();
		ArrayList<Register> list = new CalculateDao().selectTutorCalculate(conn, memNo, status);
		close(conn);
		return list;
	}
	
	public int selectCalculate(String[] regNo) {
		Connection conn = getConnection();
		int calPrice = new CalculateDao().selectCalculate(conn, regNo);
		close(conn);
		return calPrice;
	}
	
	public int insertCalculate(Calculate cal, String[] regNoList) {
		Connection conn = getConnection();
		int result1 = new CalculateDao().insertCalculate(conn, cal);
		int result2 = new CalculateDao().updateRegister(conn, regNoList);
		if(result1 > 0 && result2 > 0) {
			commit(conn);
		} else {
			rollback(conn);
		}
		close(conn);
		return result1 * result2;
	}
	
}
