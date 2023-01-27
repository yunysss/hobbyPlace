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

	/**
	 * @author 예서
	 * @param memNo 튜터회원번호
	 * @param status 정산처리상태
	 * @return 수강완료된 주문 리스트
	 */
	public ArrayList<Register> selectTutorCalculate(int memNo, String status){
		Connection conn = getConnection();
		ArrayList<Register> list = new CalculateDao().selectTutorCalculate(conn, memNo, status);
		close(conn);
		return list;
	}
	
	/**
	 * @author 예서
	 * @param regNo 주문번호배열
	 * @return 정산신청금액합
	 */
	public int selectCalculate(String[] regNo) {
		Connection conn = getConnection();
		int calPrice = new CalculateDao().selectCalculate(conn, regNo);
		close(conn);
		return calPrice;
	}
	
	/**
	 * @author 예서
	 * @param cal 신청한 정산 객체
	 * @param regNoList 주문번호 배열
	 * @return
	 */
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
	
	
	/**
	 * @author 예서
	 * @param memNo 튜터회원번호
	 * @param startDate 검색시작날짜
	 * @param endDate 검색끝날짜
	 * @param status 정산처리상태
	 * @return 튜터 검색 정산 리스트 
	 */
	public ArrayList<Calculate> selectCalList(int memNo, String startDate, String endDate,String status){
		Connection conn = getConnection();
		ArrayList<Calculate> list = new CalculateDao().selectCalList(conn, memNo, startDate, endDate, status);
		close(conn);
		return list;
	}
	
	/**
	 * @author 예서
	 * @param calNo 
	 * @return 선택한 정산번호의 상세 내역
	 */
	public Calculate selectCalDetail(int calNo) {
		Connection conn = getConnection();
		Calculate c = new CalculateDao().selectCalDetail(conn, calNo);
		close(conn);
		return c;
	}
	
	/**
	 * @author 예서
	 * @param memId 검색한 튜터 아이디 키워드
	 * @param startDate 검색시작날짜
	 * @param endDate 검색끝날짜
	 * @param status 정산처리상태
	 * @return 관리자 검색 정산관리 리스트
	 */
	public ArrayList<Calculate> selectCalMng(String memId, String startDate, String endDate, String status){
		Connection conn = getConnection();
		ArrayList<Calculate> list = new CalculateDao().selectCalMng(conn, memId,startDate, endDate, status);
		close(conn);
		return list;
	}
	
	/**
	 * @author 예서
	 * @param calNo 선택한 정산번호
	 * @return 선택한 정산번호의 주문번호(,로 연결된 문자열)
	 */
	public String selectCalculateSta(int calNo) {
		Connection conn = getConnection();
		String str = new CalculateDao().selectCalculateSta(conn, calNo);
		close(conn);
		return str;
	}
	
	/**
	 * @author 예서
	 * @param calNo 선택한 정산번호
	 * @param calSta 선택한 정산처리상태
	 * @param calRegList 선택한 정산번호의 주문번호 배열
	 * @return Calculate&Register 테이블 UPDATE
	 */
	public int updateCalculate(int calNo, String calSta, String[] calRegList) {
		Connection conn = getConnection();
		int result1 = new CalculateDao().updateCalculateSta(conn, calNo, calSta);
		int result2 = new CalculateDao().updateRegisterCalSta(conn, calSta, calRegList);
		if(result1 > 0 && result2 > 0) {
			commit(conn);
		} else {
			rollback(conn);
		}
		close(conn);
		return result1 * result2;
	}
	
	
	
	
	
}
