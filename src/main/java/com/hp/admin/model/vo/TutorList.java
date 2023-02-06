package com.hp.admin.model.vo;

public class TutorList {
	
	private int memNo;
	private String memName;
	private String memId;
	private String tutorName;
	private int classActive;
	private int classTotal;
	private int lessonTotal;
	private int tuteeTotal;
	private int likeCount;
	private int revCount;
	private int incomeTotal;
	private String tutorAddress;
	private String enrollDate;
	
	public TutorList() {}

	public TutorList(int memNo, String memName, String memId, String tutorName, int classActive, int classTotal,
			int lessonTotal, int tuteeTotal, int likeCount, int revCount, int incomeTotal, String tutorAddress) {
		super();
		this.memNo = memNo;
		this.memName = memName;
		this.memId = memId;
		this.tutorName = tutorName;
		this.classActive = classActive;
		this.classTotal = classTotal;
		this.lessonTotal = lessonTotal;
		this.tuteeTotal = tuteeTotal;
		this.likeCount = likeCount;
		this.revCount = revCount;
		this.incomeTotal = incomeTotal;
		this.tutorAddress = tutorAddress;
	}
	
	

	public TutorList(int memNo, String memName, String memId, String tutorName, int classActive, int classTotal,
			int tuteeTotal, int likeCount, int revCount, int incomeTotal, String tutorAddress) {
		super();
		this.memNo = memNo;
		this.memName = memName;
		this.memId = memId;
		this.tutorName = tutorName;
		this.classActive = classActive;
		this.classTotal = classTotal;
		this.tuteeTotal = tuteeTotal;
		this.likeCount = likeCount;
		this.revCount = revCount;
		this.incomeTotal = incomeTotal;
		this.tutorAddress = tutorAddress;
	}

	
	public TutorList(int memNo, String memName, String memId, String tutorName, int classActive, int classTotal,
			int lessonTotal, int tuteeTotal, int likeCount, int revCount, int incomeTotal, String tutorAddress,
			String enrollDate) {
		super();
		this.memNo = memNo;
		this.memName = memName;
		this.memId = memId;
		this.tutorName = tutorName;
		this.classActive = classActive;
		this.classTotal = classTotal;
		this.lessonTotal = lessonTotal;
		this.tuteeTotal = tuteeTotal;
		this.likeCount = likeCount;
		this.revCount = revCount;
		this.incomeTotal = incomeTotal;
		this.tutorAddress = tutorAddress;
		this.enrollDate = enrollDate;
	}

	
	public String getTutorName() {
		return tutorName;
	}

	public void setTutorName(String tutorName) {
		this.tutorName = tutorName;
	}

	public String getEnrollDate() {
		return enrollDate;
	}

	public void setEnrollDate(String enrollDate) {
		this.enrollDate = enrollDate;
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

	public String getMemId() {
		return memId;
	}

	public void setMemId(String memId) {
		this.memId = memId;
	}

	public String gettutorName() {
		return tutorName;
	}

	public void settutorName(String tutorName) {
		this.tutorName = tutorName;
	}

	public int getClassActive() {
		return classActive;
	}

	public void setClassActive(int classActive) {
		this.classActive = classActive;
	}

	public int getClassTotal() {
		return classTotal;
	}

	public void setClassTotal(int classTotal) {
		this.classTotal = classTotal;
	}

	public int getLessonTotal() {
		return lessonTotal;
	}

	public void setLessonTotal(int lessonTotal) {
		this.lessonTotal = lessonTotal;
	}

	public int getTuteeTotal() {
		return tuteeTotal;
	}

	public void setTuteeTotal(int tuteeTotal) {
		this.tuteeTotal = tuteeTotal;
	}

	public int getLikeCount() {
		return likeCount;
	}

	public void setLikeCount(int likeCount) {
		this.likeCount = likeCount;
	}

	public int getRevCount() {
		return revCount;
	}

	public void setRevCount(int revCount) {
		this.revCount = revCount;
	}

	public int getIncomeTotal() {
		return incomeTotal;
	}

	public void setIncomeTotal(int incomeTotal) {
		this.incomeTotal = incomeTotal;
	}

	public String getTutorAddress() {
		return tutorAddress;
	}

	public void setTutorAddress(String tutorAddress) {
		this.tutorAddress = tutorAddress;
	}

	@Override
	public String toString() {
		return "TutorList [memNo=" + memNo + ", memName=" + memName + ", memId=" + memId + ", tutorName=" + tutorName
				+ ", classActive=" + classActive + ", classTotal=" + classTotal + ", lessonTotal=" + lessonTotal
				+ ", tuteeTotal=" + tuteeTotal + ", likeCount=" + likeCount + ", revCount=" + revCount
				+ ", incomeTotal=" + incomeTotal + ", tutorAddress=" + tutorAddress + "]";
	}
	
	
	

}
