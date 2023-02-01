package com.hp.member.model.vo;

public class Like {
	private int clNo;
	private String clName;
	private int memNo;
	private String likeDate;
	private String ctName;
	private String ctDname;
	private String ttName;
	
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
	
	

	public Like(int clNo, String clName, int memNo, String likeDate, String ctName, String ctDname, String ttName) {
		super();
		this.clNo = clNo;
		this.clName = clName;
		this.memNo = memNo;
		this.likeDate = likeDate;
		this.ctName = ctName;
		this.ctDname = ctDname;
		this.ttName = ttName;
	}

	public Like(String clName, int memNo, String likeDate, String ctName, String ctDname, String ttName) {
		super();
		this.clName = clName;
		this.memNo = memNo;
		this.likeDate = likeDate;
		this.ctName = ctName;
		this.ctDname = ctDname;
		this.ttName = ttName;
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

	public String getCtName() {
		return ctName;
	}

	public void setCtName(String ctName) {
		this.ctName = ctName;
	}

	public String getCtDname() {
		return ctDname;
	}

	public void setCtDname(String ctDname) {
		this.ctDname = ctDname;
	}

	public String getTtName() {
		return ttName;
	}

	public void setTtName(String ttName) {
		this.ttName = ttName;
	}

	@Override
	public String toString() {
		return "Like [clNo=" + clNo + ", clName=" + clName + ", memNo=" + memNo + ", likeDate=" + likeDate
				+ ", ctName=" + ctName + ", ctDname=" + ctDname + ", ttName=" + ttName + "]";
	}

	

	

	
	
	

}
