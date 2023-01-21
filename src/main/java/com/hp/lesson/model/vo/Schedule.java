package com.hp.lesson.model.vo;

public class Schedule {
	
	private int schNo;
	private String clNo;
	private int sessionNo;
	private String startTime;
	private String endTime;
	private String hour;
	
	public Schedule() {}

	public Schedule(int schNo, String clNo, int sessionNo, String startTime, String endTime, String hour) {
		super();
		this.schNo = schNo;
		this.clNo = clNo;
		this.sessionNo = sessionNo;
		this.startTime = startTime;
		this.endTime = endTime;
		this.hour = hour;
	}

	public int getSchNo() {
		return schNo;
	}

	public void setSchNo(int schNo) {
		this.schNo = schNo;
	}

	public String getClNo() {
		return clNo;
	}

	public void setClNo(String clNo) {
		this.clNo = clNo;
	}

	public int getSessionNo() {
		return sessionNo;
	}

	public void setSessionNo(int sessionNo) {
		this.sessionNo = sessionNo;
	}

	public String getStartTime() {
		return startTime;
	}

	public void setStartTime(String startTime) {
		this.startTime = startTime;
	}

	public String getEndTime() {
		return endTime;
	}

	public void setEndTime(String endTime) {
		this.endTime = endTime;
	}

	public String getHour() {
		return hour;
	}

	public void setHour(String hour) {
		this.hour = hour;
	}

	@Override
	public String toString() {
		return "Schedule [schNo=" + schNo + ", clNo=" + clNo + ", sessionNo=" + sessionNo + ", startTime=" + startTime
				+ ", endTime=" + endTime + ", hour=" + hour + "]";
	}
	

}
