package com.hp.admin.model.vo;

import java.util.Date;

public class MemberList {
	
	private int memNo;
	private String memName;
	private String grade;
	private String enrollDate;
	private int regCount;
	private int revCount;
	private int likeCount;
	private int totalpay;
	private String email;
	private String phone;
	private String address;
	private String gender;
	private String memDrop;
	
	public MemberList() {}

	public MemberList(int memNo, String memName, String grade, String enrollDate, int regCount, int revCount,
			int likeCount, int totalpay, String email, String phone, String address, String gender, String memDrop) {
		super();
		this.memNo = memNo;
		this.memName = memName;
		this.grade = grade;
		this.enrollDate = enrollDate;
		this.regCount = regCount;
		this.revCount = revCount;
		this.likeCount = likeCount;
		this.totalpay = totalpay;
		this.email = email;
		this.phone = phone;
		this.address = address;
		this.gender = gender;
		this.memDrop = memDrop;
	}

	public int getMemNo() {
		return memNo;
	}

	public void setMemNo(int memNo) {
		this.memNo = memNo;
	}

	public String getMemName() {
		return memName;
	}

	public void setMemName(String memName) {
		this.memName = memName;
	}

	public String getGrade() {
		return grade;
	}

	public void setGrade(String grade) {
		this.grade = grade;
	}

	public String getEnrollDate() {
		return enrollDate;
	}

	public void setEnrollDate(String enrollDate) {
		this.enrollDate = enrollDate;
	}

	public int getRegCount() {
		return regCount;
	}

	public void setRegCount(int regCount) {
		this.regCount = regCount;
	}

	public int getRevCount() {
		return revCount;
	}

	public void setRevCount(int revCount) {
		this.revCount = revCount;
	}

	public int getLikeCount() {
		return likeCount;
	}

	public void setLikeCount(int likeCount) {
		this.likeCount = likeCount;
	}

	public int getTotalpay() {
		return totalpay;
	}

	public void setTotalpay(int totalpay) {
		this.totalpay = totalpay;
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

	public String getAddress() {
		return address;
	}

	public void setAddress(String address) {
		this.address = address;
	}

	public String getGender() {
		return gender;
	}

	public void setGender(String gender) {
		this.gender = gender;
	}

	public String getMemDrop() {
		return memDrop;
	}

	public void setMemDrop(String memDrop) {
		this.memDrop = memDrop;
	}

	@Override
	public String toString() {
		return "MemberList [memNo=" + memNo + ", memName=" + memName + ", grade=" + grade + ", enrollDate=" + enrollDate
				+ ", regCount=" + regCount + ", revCount=" + revCount + ", likeCount=" + likeCount + ", totalpay="
				+ totalpay + ", email=" + email + ", phone=" + phone + ", address=" + address + ", gender=" + gender
				+ ", memDrop=" + memDrop + "]";
	}
	
	

}
