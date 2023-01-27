package com.hp.customerService.model.vo;

import java.sql.Date;

public class Notice {
	
	private int rNum;
	private int ntNo;
	private String ntMem;
	private String ntTitle;
	private String ntContent;
	private Date enrollDate;
	private Date updateDate;
	private String grade;
	private String ntSta;
	
	
	public Notice() {}


	public Notice(int rNum, int ntNo, String ntMem, String ntTitle, String ntContent, Date enrollDate, Date updateDate,
			String grade, String ntSta) {
		super();
		this.rNum = rNum;
		this.ntNo = ntNo;
		this.ntMem = ntMem;
		this.ntTitle = ntTitle;
		this.ntContent = ntContent;
		this.enrollDate = enrollDate;
		this.updateDate = updateDate;
		this.grade = grade;
		this.ntSta = ntSta;
	}


	public Notice(int ntNo, String ntTitle) {
		super();
		this.ntNo = ntNo;
		this.ntTitle = ntTitle;
	}
	
	public int getrNum() {
		return rNum;
	}


	public void setrNum(int rNum) {
		this.rNum = rNum;
	}


	public int getNtNo() {
		return ntNo;
	}


	public void setNtNo(int ntNo) {
		this.ntNo = ntNo;
	}


	public String getNtMem() {
		return ntMem;
	}


	public void setNtMem(String ntMem) {
		this.ntMem = ntMem;
	}


	public String getNtTitle() {
		return ntTitle;
	}


	public void setNtTitle(String ntTitle) {
		this.ntTitle = ntTitle;
	}


	public String getNtContent() {
		return ntContent;
	}


	public void setNtContent(String ntContent) {
		this.ntContent = ntContent;
	}


	public Date getEnrollDate() {
		return enrollDate;
	}


	public void setEnrollDate(Date enrollDate) {
		this.enrollDate = enrollDate;
	}


	public Date getUpdateDate() {
		return updateDate;
	}


	public void setUpdateDate(Date updateDate) {
		this.updateDate = updateDate;
	}


	public String getGrade() {
		return grade;
	}


	public void setGrade(String grade) {
		this.grade = grade;
	}


	public String getNtSta() {
		return ntSta;
	}


	public void setNtSta(String ntSta) {
		this.ntSta = ntSta;
	}


	@Override
	public String toString() {
		return "Notice [rnum ="+ rNum + ", ntNo=" + ntNo + ", ntMem=" + ntMem + ", ntTitle=" + ntTitle + ", ntContent=" + ntContent
				+ ", enrollDate=" + enrollDate + ", updateDate=" + updateDate + ", grade=" + grade + ", ntSta=" + ntSta
				+ "]";
	}
	
	
	
}
