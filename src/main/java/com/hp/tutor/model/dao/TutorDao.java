package com.hp.tutor.model.dao;

import java.sql.Date;

public class TutorDao {

	private int memNo;
	private String ttName;
	private String ttPhone;
	private String ttEmail;
	private String introduce;
	private Date enrollDate;
	private String pubPhone;
	private String ttProfile;
	
	
	public TutorDao(int memNo, String ttName, String ttPhone, String ttEmail, String introduce, Date enrollDate,
			String pubPhone, String ttProfile) {
		super();
		this.memNo = memNo;
		this.ttName = ttName;
		this.ttPhone = ttPhone;
		this.ttEmail = ttEmail;
		this.introduce = introduce;
		this.enrollDate = enrollDate;
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


	@Override
	public String toString() {
		return "TutorDao [memNo=" + memNo + ", ttName=" + ttName + ", ttPhone=" + ttPhone + ", ttEmail=" + ttEmail
				+ ", introduce=" + introduce + ", enrollDate=" + enrollDate + ", pubPhone=" + pubPhone + ", ttProfile="
				+ ttProfile + "]";
	}
	
	
	
	


}
