package com.hp.member.model.vo;

import java.sql.Date;

public class Member {
	
	private int memNo;
	private String memId;
	private String memPwd;
	private String memName;
	private String memNick;
	private String email; 
	private String phone;
	private int post;
	private String memAddr;
	private String gender;
	private String memBirth;
	private String memProfile;
	private String interest;
	private String grade;
	private Date enrollDate;
	private Date memUpdate;
	private String memStatus;
	private String memDrop;


	public Member() {}


	public Member(int memNo, String memId, String memPwd, String memName, String memNick, String email, String phone,
			int post, String memAddr, String gender, String memBirth, String memProfile, String interest, String grade,
			Date enrollDate, Date memUpdate, String memStatus, String memDrop) {
		super();
		this.memNo = memNo;
		this.memId = memId;
		this.memPwd = memPwd;
		this.memName = memName;
		this.memNick = memNick;
		this.email = email;
		this.phone = phone;
		this.post = post;
		this.memAddr = memAddr;
		this.gender = gender;
		this.memBirth = memBirth;
		this.memProfile = memProfile;
		this.interest = interest;
		this.grade = grade;
		this.enrollDate = enrollDate;
		this.memUpdate = memUpdate;
		this.memStatus = memStatus;
		this.memDrop = memDrop;
	}


	public int getMemNo() {
		return memNo;
	}


	public void setMemNo(int memNo) {
		this.memNo = memNo;
	}


	public String getMemId() {
		return memId;
	}


	public void setMemId(String memId) {
		this.memId = memId;
	}


	public String getMemPwd() {
		return memPwd;
	}


	public void setMemPwd(String memPwd) {
		this.memPwd = memPwd;
	}


	public String getMemName() {
		return memName;
	}


	public void setMemName(String memName) {
		this.memName = memName;
	}


	public String getMemNick() {
		return memNick;
	}


	public void setMemNick(String memNick) {
		this.memNick = memNick;
	}


	public String getEmail() {
		return email;
	}


	public void setEmail(String email) {
		this.email = email;
	}


	public String getPhone() {
		return phone;
	}


	public void setPhone(String phone) {
		this.phone = phone;
	}


	public int getPost() {
		return post;
	}


	public void setPost(int post) {
		this.post = post;
	}


	public String getMemAddr() {
		return memAddr;
	}


	public void setMemAddr(String memAddr) {
		this.memAddr = memAddr;
	}


	public String getGender() {
		return gender;
	}


	public void setGender(String gender) {
		this.gender = gender;
	}


	public String getMemBirth() {
		return memBirth;
	}


	public void setMemBirth(String memBirth) {
		this.memBirth = memBirth;
	}


	public String getMemProfile() {
		return memProfile;
	}


	public void setMemProfile(String memProfile) {
		this.memProfile = memProfile;
	}


	public String getInterest() {
		return interest;
	}


	public void setInterest(String interest) {
		this.interest = interest;
	}


	public String getGrade() {
		return grade;
	}


	public void setGrade(String grade) {
		this.grade = grade;
	}


	public Date getEnrollDate() {
		return enrollDate;
	}


	public void setEnrollDate(Date enrollDate) {
		this.enrollDate = enrollDate;
	}


	public Date getMemUpdate() {
		return memUpdate;
	}


	public void setMemUpdate(Date memUpdate) {
		this.memUpdate = memUpdate;
	}


	public String getMemStatus() {
		return memStatus;
	}


	public void setMemStatus(String memStatus) {
		this.memStatus = memStatus;
	}


	public String getMemDrop() {
		return memDrop;
	}


	public void setMemDrop(String memDrop) {
		this.memDrop = memDrop;
	}


	@Override
	public String toString() {
		return "Member [memNo=" + memNo + ", memId=" + memId + ", memPwd=" + memPwd + ", memName=" + memName
				+ ", memNick=" + memNick + ", email=" + email + ", phone=" + phone + ", post=" + post + ", memAddr="
				+ memAddr + ", gender=" + gender + ", memBirth=" + memBirth + ", memProfile=" + memProfile
				+ ", interest=" + interest + ", grade=" + grade + ", enrollDate=" + enrollDate + ", memUpdate="
				+ memUpdate + ", memStatus=" + memStatus + ", memDrop=" + memDrop + "]";
	}
	
	

}



