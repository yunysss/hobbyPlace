package com.hp.review.model.vo;

public class Review {
	
	private int reviewNo;
	private String reviewContent;
	private int reviewStar;
	private String reviewDate;
	private String reviewUpDate;
	private String reviewStatus;
	private int regNo;
	private int clNo;
	private String clName;
	private String clThumb;
	
	
	public Review() {}

	public Review(int reviewNo, String reviewContent, int reviewStar, String reviewDate, String reviewUpDate,
			String reviewStatus, int regNo, int clNo) {
		super();
		this.reviewNo = reviewNo;
		this.reviewContent = reviewContent;
		this.reviewStar = reviewStar;
		this.reviewDate = reviewDate;
		this.reviewUpDate = reviewUpDate;
		this.reviewStatus = reviewStatus;
		this.regNo = regNo;
		this.clNo = clNo;
	}
	
	

	public Review(int reviewNo, String reviewContent, int reviewStar, int clNo, String clName, String clThumb) {
		super();
		this.reviewNo = reviewNo;
		this.reviewContent = reviewContent;
		this.reviewStar = reviewStar;
		this.clNo = clNo;
		this.clName = clName;
		this.clThumb = clThumb;
	}

	public int getReviewNo() {
		return reviewNo;
	}

	public void setReviewNo(int reviewNo) {
		this.reviewNo = reviewNo;
	}

	public String getReviewContent() {
		return reviewContent;
	}

	public void setReviewContent(String reviewContent) {
		this.reviewContent = reviewContent;
	}

	public int getReviewStar() {
		return reviewStar;
	}

	public void setReviewStar(int reviewStar) {
		this.reviewStar = reviewStar;
	}

	public String getReviewDate() {
		return reviewDate;
	}

	public void setReviewDate(String reviewDate) {
		this.reviewDate = reviewDate;
	}

	public String getReviewUpDate() {
		return reviewUpDate;
	}

	public void setReviewUpDate(String reviewUpDate) {
		this.reviewUpDate = reviewUpDate;
	}

	public String getReviewStatus() {
		return reviewStatus;
	}

	public void setReviewStatus(String reviewStatus) {
		this.reviewStatus = reviewStatus;
	}

	public int getRegNo() {
		return regNo;
	}

	public void setRegNo(int regNo) {
		this.regNo = regNo;
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

	public String getClThumb() {
		return clThumb;
	}

	public void setClThumb(String clThumb) {
		this.clThumb = clThumb;
	}
	

	@Override
	public String toString() {
		return "Review [reviewNo=" + reviewNo + ", reviewContent=" + reviewContent + ", reviewStar=" + reviewStar
				+ ", reviewDate=" + reviewDate + ", reviewUpDate=" + reviewUpDate + ", reviewStatus=" + reviewStatus
				+ ", regNo=" + regNo + ", clNo=" + clNo + "]";
	}

}