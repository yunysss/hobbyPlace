package com.hp.tutor.model.vo;

import java.util.Date;

public class Tutor {
	
	private int memNo;
	private String ttName;
	private String ttPhone;
	private String ttEmail;
	private String introduce;
	private Date enrollDate;
	private String pubPhone;
	private String ttProfile;
	private String modifyDate;
	
	
	private String avgStar; // 평균 별점0
	private int rCount;  // 리뷰갯수0
	private String qnaPer; //문의응답률
	private int cancelCount; //이번달취소건수0
	private int ingClass; // 진행중 클래스
	private int sumMonth; //이번달 판매금액0
	private int sumTotal; // 전체판매금액0
	private int sumReg; // 전체결제건수 0


	public Tutor() {}

    
	
	public int getIngClass() {
		return ingClass;
	}



	public void setIngClass(int ingClass) {
		this.ingClass = ingClass;
	}



	public Tutor(String avgStar, int rCount, int cancelCount, int sumMonth, int sumTotal, int sumReg) {
		super();
		this.avgStar = avgStar;
		this.rCount = rCount;
		this.cancelCount = cancelCount;
		this.sumMonth = sumMonth;
		this.sumTotal = sumTotal;
		this.sumReg = sumReg;
	}

 




	public String getAvgStar() {
		return avgStar;
	}



	public void setAvgStar(String avgStar) {
		this.avgStar = avgStar;
	}



	public int getrCount() {
		return rCount;
	}



	public void setrCount(int rCount) {
		this.rCount = rCount;
	}



	public String getQnaPer() {
		return qnaPer;
	}



	public void setQnaPer(String qnaPer) {
		this.qnaPer = qnaPer;
	}



	public int getCancelCount() {
		return cancelCount;
	}



	public void setCancelCount(int cancelCount) {
		this.cancelCount = cancelCount;
	}







	public int getSumTotal() {
		return sumTotal;
	}



	public void setSumTotal(int sumTotal) {
		this.sumTotal = sumTotal;
	}



	public int getSumReg() {
		return sumReg;
	}



	public void setSumReg(int sumReg) {
		this.sumReg = sumReg;
	}



	public Tutor(int memNo, String ttName, String introduce, String ttProfile) {
		super();
		this.memNo = memNo;
		this.ttName = ttName;
		this.introduce = introduce;
		this.ttProfile = ttProfile;
	}



	public Tutor(int memNo, String ttName, String ttPhone, String ttEmail, String introduce, Date enrollDate,
			String pubPhone, String ttProfile, String modifyDate) {
		super();
		this.memNo = memNo;
		this.ttName = ttName;
		this.ttPhone = ttPhone;
		this.ttEmail = ttEmail;
		this.introduce = introduce;
		this.enrollDate = enrollDate;
		this.pubPhone = pubPhone;
		this.ttProfile = ttProfile;
		this.modifyDate = modifyDate;
	}



	public Tutor(int memNo, String ttName, String ttPhone, String ttEmail, String introduce, String pubPhone,
			String ttProfile) {
		super();
		this.memNo = memNo;
		this.ttName = ttName;
		this.ttPhone = ttPhone;
		this.ttEmail = ttEmail;
		this.introduce = introduce;
		this.pubPhone = pubPhone;
		this.ttProfile = ttProfile;
	}

	public int getMemNo() {
		return memNo;
	}

	public void setMemNo(int memNo) {
		this.memNo = memNo;
	}

	public String getTtName() {
		return ttName;
	}

	public void setTtName(String ttName) {
		this.ttName = ttName;
	}

	public String getTtPhone() {
		return ttPhone;
	}

	public void setTtPhone(String ttPhone) {
		this.ttPhone = ttPhone;
	}

	public String getTtEmail() {
		return ttEmail;
	}

	public void setTtEmail(String ttEmail) {
		this.ttEmail = ttEmail;
	}

	public String getIntroduce() {
		return introduce;
	}

	public void setIntroduce(String introduce) {
		this.introduce = introduce;
	}

	public Date getEnrollDate() {
		return enrollDate;
	}

	public void setEnrollDate(Date enrollDate) {
		this.enrollDate = enrollDate;
	}

	public String getPubPhone() {
		return pubPhone;
	}

	public void setPubPhone(String pubPhone) {
		this.pubPhone = pubPhone;
	}

	public String getTtProfile() {
		return ttProfile;
	}

	public void setTtProfile(String ttProfile) {
		this.ttProfile = ttProfile;
	}
	
	public String getModifyDate() {
		return modifyDate;
	}

	public void setModifyDate(String modifyDate) {
		this.modifyDate = modifyDate;
	}

	@Override
	public String toString() {
		return "Tutor [memNo=" + memNo + ", ttName=" + ttName + ", ttPhone=" + ttPhone + ", ttEmail=" + ttEmail
				+ ", introduce=" + introduce + ", enrollDate=" + enrollDate + ", pubPhone=" + pubPhone + ", ttProfile="
				+ ttProfile + "]";
	}



	public int getSumMonth() {
		return sumMonth;
	}



	public void setSumMonth(int sumMonth) {
		this.sumMonth = sumMonth;
	}
	

}
