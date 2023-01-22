package com.hp.review.model.vo;

public class Review {
	
	private int reviewNo;
	private String reviewContent;
	private int reviewStar;
	private String reviewDate;
	private String reviewUpDate;
	private String reviewStatus;
	private int regNo;
	private String clNo;
	private String clThumb;
	
	public Review() {}

	public Review(int reviewNo, String reviewContent, int reviewStar, String reviewDate, String reviewUpDate,
			String reviewStatus, int regNo, String clNo) {
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
	
	

	public Review(int reviewNo, String reviewContent, int reviewStar, String clNo, String clThumb) {
		super();
		this.reviewNo = reviewNo;
		this.reviewContent = reviewContent;
		this.reviewStar = reviewStar;
		this.clNo = clNo;
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

	public String getClNo() {
		return clNo;
	}

	public void setClNo(String clNo) {
		this.clNo = clNo;
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