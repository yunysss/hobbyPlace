package com.hp.qna.model.vo;

import java.sql.Date;

public class Qna {

	
	private int qNo;
	private String qTitle;
	private String qContent;
	private Date qDate;
	private String qStatus;
	private String qGrade;
	private String qCategory;
	private int clNo;
	private String clName;
	private int qMemNo;
	private String aTitle;
	private String aContent;
	private Date aDate;
	private int aMemNo;
	private String aStatus;
	
	private String aMemNick;
	
	public Qna() {}

	
 
	


	public Qna(int qNo, String qTitle, String qContent, Date qDate, String qStatus, String qGrade, String qCategory,
			int clNo, int qMemNo, String aTitle, String aContent, Date aDate, int aMemNo, String aStatus,
			String aMemNick) {
		super();
		this.qNo = qNo;
		this.qTitle = qTitle;
		this.qContent = qContent;
		this.qDate = qDate;
		this.qStatus = qStatus;
		this.qGrade = qGrade;
		this.qCategory = qCategory;
		this.clNo = clNo;
		this.qMemNo = qMemNo;
		this.aTitle = aTitle;
		this.aContent = aContent;
		this.aDate = aDate;
		this.aMemNo = aMemNo;
		this.aStatus = aStatus;
		this.aMemNick = aMemNick;
	}


	public Qna(String qTitle, String qContent, int clNo, int qMemNo, int aMemNo) {
		super();
		this.qTitle = qTitle;
		this.qContent = qContent;
		this.clNo = clNo;
		this.qMemNo = qMemNo;
		this.aMemNo = aMemNo;
	}


	public String getaStatus() {
		return aStatus;
	}


	public void setaStatus(String aStatus) {
		this.aStatus = aStatus;
	}


	public Qna(int qNo, String qTitle, String qContent, Date qDate, String qStatus, String qGrade, String qCategory,
			int clNo, int qMemNo, String aTitle, String aContent, Date aDate, int aMemNo) {
		super();
		this.qNo = qNo;
		this.qTitle = qTitle;
		this.qContent = qContent;
		this.qDate = qDate;
		this.qStatus = qStatus;
		this.qGrade = qGrade;
		this.qCategory = qCategory;
		this.clNo = clNo;
		this.qMemNo = qMemNo;
		this.aTitle = aTitle;
		this.aContent = aContent;
		this.aDate = aDate;
		this.aMemNo = aMemNo;
	}
	
	public Qna(int qNo, String qTitle, String qContent, Date qDate, String qStatus, String qGrade, String qCategory,
			int clNo, int qMemNo, String aTitle, String aContent, Date aDate, int aMemNo, String aMemNick) {
		super();
		this.qNo = qNo;
		this.qTitle = qTitle;
		this.qContent = qContent;
		this.qDate = qDate;
		this.qStatus = qStatus;
		this.qGrade = qGrade;
		this.qCategory = qCategory;
		this.clNo = clNo;
		this.qMemNo = qMemNo;
		this.aTitle = aTitle;
		this.aContent = aContent;
		this.aDate = aDate;
		this.aMemNo = aMemNo;
		this.aMemNick = aMemNick;
	}

	






	public Qna(int qNo, String qTitle, String qContent, Date qDate, String qStatus, String qGrade, String qCategory,
			String clName, int qMemNo, String aTitle, String aContent, Date aDate, int aMemNo, String aMemNick) {
		super();
		this.qNo = qNo;
		this.qTitle = qTitle;
		this.qContent = qContent;
		this.qDate = qDate;
		this.qStatus = qStatus;
		this.qGrade = qGrade;
		this.qCategory = qCategory;
		this.clName = clName;
		this.qMemNo = qMemNo;
		this.aTitle = aTitle;
		this.aContent = aContent;
		this.aDate = aDate;
		this.aMemNo = aMemNo;
		this.aMemNick = aMemNick;
	}



	


	public String getClName() {
		return clName;
	}






	public void setClName(String clName) {
		this.clName = clName;
	}






	public int getqNo() {
		return qNo;
	}


	public void setqNo(int qNo) {
		this.qNo = qNo;
	}


	public String getqTitle() {
		return qTitle;
	}


	public void setqTitle(String qTitle) {
		this.qTitle = qTitle;
	}


	public String getqContent() {
		return qContent;
	}


	public void setqContent(String qContent) {
		this.qContent = qContent;
	}


	public Date getqDate() {
		return qDate;
	}


	public void setqDate(Date qDate) {
		this.qDate = qDate;
	}


	public String getqStatus() {
		return qStatus;
	}


	public void setqStatus(String qStatus) {
		this.qStatus = qStatus;
	}


	public String getqGrade() {
		return qGrade;
	}


	public void setqGrade(String qGrade) {
		this.qGrade = qGrade;
	}


	public String getqCategory() {
		return qCategory;
	}


	public void setqCategory(String qCategory) {
		this.qCategory = qCategory;
	}


	public int getClNo() {
		return clNo;
	}


	public void setClNo(int clNo) {
		this.clNo = clNo;
	}


	public int getqMemNo() {
		return qMemNo;
	}


	public void setqMemNo(int qMemNo) {
		this.qMemNo = qMemNo;
	}


	public String getaTitle() {
		return aTitle;
	}


	public void setaTitle(String aTitle) {
		this.aTitle = aTitle;
	}


	public String getaContent() {
		return aContent;
	}


	public void setaContent(String aContent) {
		this.aContent = aContent;
	}


	public Date getaDate() {
		return aDate;
	}


	public void setaDate(Date aDate) {
		this.aDate = aDate;
	}


	public int getaMemNo() {
		return aMemNo;
	}


	public void setaMemNo(int aMemNo) {
		this.aMemNo = aMemNo;
	}
	
	


	public String getaMemNick() {
		return aMemNick;
	}


	public void setaMemNick(String aMemNick) {
		this.aMemNick = aMemNick;
	}


	@Override
	public String toString() {
		return "Qna [qNo=" + qNo + ", qTitle=" + qTitle + ", qContent=" + qContent + ", qDate=" + qDate + ", qStatus="
				+ qStatus + ", qGrade=" + qGrade + ", qCategory=" + qCategory + ", clNo=" + clNo + ", qMemNo=" + qMemNo
				+ ", aTitle=" + aTitle + ", aContent=" + aContent + ", aDate=" + aDate + ", aMemNo=" + aMemNo
				+ ", aStatus=" + aStatus + ", aMemNick=" + aMemNick + "]";
	};
	
	
	
}
