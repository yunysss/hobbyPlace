package com.hp.member.model.vo;

public class Like {
	private int clNo;
	private String clName;
	private int memNo;
	private String likeDate;
	
	public Like() {}

	public Like(int clNo, int memNo, String likeDate) {
		super();
		this.clNo = clNo;
		this.memNo = memNo;
		this.likeDate = likeDate;
	}

	
	public Like(String clName, int memNo, String likeDate) {
		super();
		this.clName = clName;
		this.memNo = memNo;
		this.likeDate = likeDate;
	}

	public int getClNo() {
		return clNo;
	}

	public void setClNo(int clNo) {
		this.clNo = clNo;
	}

	
	public String getClName() {
		return clName;
	}

	public void setClName(String clName) {
		this.clName = clName;
	}

	public int getMemNo() {
		return memNo;
	}

	public void setMemNo(int memNo) {
		this.memNo = memNo;
	}

	public String getLikeDate() {
		return likeDate;
	}

	public void setLikeDate(String likeDate) {
		this.likeDate = likeDate;
	}

	@Override
	public String toString() {
		return "Like [clNo=" + clNo + ", clName=" + clName + ", memNo=" + memNo + ", likeDate=" + likeDate + "]";
	}

	
	
	

}
