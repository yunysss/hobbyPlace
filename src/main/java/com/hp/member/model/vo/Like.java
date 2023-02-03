package com.hp.member.model.vo;

public class Like {
	private int clNo;
	private String clName;
	private int memNo;
	private String likeDate;
	private String ctName;
	private String ctDname;
	private String ttName;
	private String distrName;
	private String clPrice;
	private String clThumb;
	private int starAvg;
	private int starCount;
	
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
	
	

	public Like(int clNo, String clName, String distrName, String clPrice, String clThumb, int starAvg, int starCount) {
		super();
		this.clNo = clNo;
		this.clName = clName;
		this.distrName = distrName;
		this.clPrice = clPrice;
		this.clThumb = clThumb;
		this.starAvg = starAvg;
		this.starCount = starCount;
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
	
	

	public String getDistrName() {
		return distrName;
	}

	public void setDistrName(String distrName) {
		this.distrName = distrName;
	}

	public String getClPrice() {
		return clPrice;
	}

	public void setClPrice(String clPrice) {
		this.clPrice = clPrice;
	}

	public String getClThumb() {
		return clThumb;
	}

	public void setClThumb(String clThumb) {
		this.clThumb = clThumb;
	}

	public int getStarAvg() {
		return starAvg;
	}

	public void setStarAvg(int starAvg) {
		this.starAvg = starAvg;
	}

	public int getStarCount() {
		return starCount;
	}

	public void setStarCount(int starCount) {
		this.starCount = starCount;
	}

	@Override
	public String toString() {
		return "Like [clNo=" + clNo + ", clName=" + clName + ", memNo=" + memNo + ", likeDate=" + likeDate + ", ctName="
				+ ctName + ", ctDname=" + ctDname + ", ttName=" + ttName + ", distrName=" + distrName + ", clPrice="
				+ clPrice + ", clThumb=" + clThumb + ", starAvg=" + starAvg + ", starCount=" + starCount + "]";
	}

	
	

	
	
	

}
