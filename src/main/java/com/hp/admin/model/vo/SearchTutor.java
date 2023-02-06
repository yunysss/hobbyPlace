package com.hp.admin.model.vo;

public class SearchTutor {
	
	private String enrollStart;
	private String enrollEnd;
	private String fCategory;
	private String lineup;
	
	private String option1;
	private String searchKey;
	
	private String option2;
	private int startNum;
	private int endNum;
	private String dayStart;
	private String dayEnd;
	
	public SearchTutor() {}

	public SearchTutor(String enrollStart, String enrollEnd, String fCategory, String lineup, String option1,
			String searchKey, String option2, int startNum, int endNum, String dayStart, String dayEnd) {
		super();
		this.enrollStart = enrollStart;
		this.enrollEnd = enrollEnd;
		this.fCategory = fCategory;
		this.lineup = lineup;
		this.option1 = option1;
		this.searchKey = searchKey;
		this.option2 = option2;
		this.startNum = startNum;
		this.endNum = endNum;
		this.dayStart = dayStart;
		this.dayEnd = dayEnd;
	}

	public SearchTutor(String enrollStart, String enrollEnd, String fCategory, String lineup) {
		super();
		this.enrollStart = enrollStart;
		this.enrollEnd = enrollEnd;
		this.fCategory = fCategory;
		this.lineup = lineup;
	}

	public SearchTutor(String enrollStart, String enrollEnd, String fCategory, String lineup, String option1,
			String searchKey) {
		super();
		this.enrollStart = enrollStart;
		this.enrollEnd = enrollEnd;
		this.fCategory = fCategory;
		this.lineup = lineup;
		this.option1 = option1;
		this.searchKey = searchKey;
	}

	public String getEnrollStart() {
		return enrollStart;
	}

	public void setEnrollStart(String enrollStart) {
		this.enrollStart = enrollStart;
	}

	public String getEnrollEnd() {
		return enrollEnd;
	}

	public void setEnrollEnd(String enrollEnd) {
		this.enrollEnd = enrollEnd;
	}

	public String getfCategory() {
		return fCategory;
	}

	public void setfCategory(String fCategory) {
		this.fCategory = fCategory;
	}

	public String getLineup() {
		return lineup;
	}

	public void setLineup(String lineup) {
		this.lineup = lineup;
	}

	public String getOption1() {
		return option1;
	}

	public void setOption1(String option1) {
		this.option1 = option1;
	}

	public String getSearchKey() {
		return searchKey;
	}

	public void setSearchKey(String searchKey) {
		this.searchKey = searchKey;
	}

	public String getOption2() {
		return option2;
	}

	public void setOption2(String option2) {
		this.option2 = option2;
	}

	public int getStartNum() {
		return startNum;
	}

	public void setStartNum(int startNum) {
		this.startNum = startNum;
	}

	public int getEndNum() {
		return endNum;
	}

	public void setEndNum(int endNum) {
		this.endNum = endNum;
	}

	public String getDayStart() {
		return dayStart;
	}

	public void setDayStart(String dayStart) {
		this.dayStart = dayStart;
	}

	public String getDayEnd() {
		return dayEnd;
	}

	public void setDayEnd(String dayEnd) {
		this.dayEnd = dayEnd;
	}

	@Override
	public String toString() {
		return "SearchTutor [enrollStart=" + enrollStart + ", enrollEnd=" + enrollEnd + ", fCategory=" + fCategory
				+ ", lineup=" + lineup + ", option1=" + option1 + ", searchKey=" + searchKey + ", option2=" + option2
				+ ", startNum=" + startNum + ", endNum=" + endNum + ", dayStart=" + dayStart + ", dayEnd=" + dayEnd
				+ "]";
	}
	
	
	

}
