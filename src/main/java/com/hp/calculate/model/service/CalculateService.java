package com.hp.calculate.model.service;

import static com.hp.common.JDBCTemplate.close;
import static com.hp.common.JDBCTemplate.commit;
import static com.hp.common.JDBCTemplate.getConnection;
import static com.hp.common.JDBCTemplate.rollback;

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
	
	
	public ArrayList<Calculate> selectAllCalList(int memNo, String status){
		Connection conn = getConnection();
		ArrayList<Calculate> list = new CalculateDao().selectAllCalList(conn, memNo, status);
		close(conn);
		return list;
	}
	
	
	public ArrayList<Calculate> selectSeasonCalList(int memNo, String startDate, String endDate, String status){
		Connection conn = getConnection();
		ArrayList<Calculate> list = new CalculateDao().selectSeasonCalList(conn, memNo, startDate, endDate, status);
		close(conn);
		return list;
	}
	
	public Calculate selectCalDetail(int calNo) {
		Connection conn = getConnection();
		Calculate c = new CalculateDao().selectCalDetail(conn, calNo);
		close(conn);
		return c;
	}
	
	public ArrayList<Calculate> selectAllSeasonCalMng(String status){
		Connection conn = getConnection();
		ArrayList<Calculate> list = new CalculateDao().selectAllSeasonCalMng(conn, status);
		close(conn);
		return list;
	}
	
	public ArrayList<Calculate> selectMemSeasonCalMng(String memId, String status){
		Connection conn = getConnection();
		ArrayList<Calculate> list = new CalculateDao().selectMemSeasonCalMng(conn, memId, status);
		close(conn);
		return list;
	}
	
	public ArrayList<Calculate> selectAllCalMng(String startDate, String endDate, String status){
		Connection conn = getConnection();
		ArrayList<Calculate> list = new CalculateDao().selectAllCalMng(conn, startDate, endDate, status);
		close(conn);
		return list;
	}
	
	public ArrayList<Calculate> selectMemCalMng(String memId, String startDate, String endDate, String status){
		Connection conn = getConnection();
		ArrayList<Calculate> list = new CalculateDao().selectMemCalMng(conn, memId,startDate, endDate, status);
		close(conn);
		return list;
	}
	
	
}
