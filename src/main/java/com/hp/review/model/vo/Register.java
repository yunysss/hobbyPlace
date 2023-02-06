package com.hp.review.model.vo;

public class Register {
	
	private int regNo;
	private String memNo;
	private String clNo;
	private String teachDate;
	private String regDate;
	private String schNo;
	private String regPay;
	private String regPrice;
	private String regCount;
	private String regSta;
	private String refuse;
	private String reEnroll;
	private String regCal;
	private String depositSta;
	private String clThumb;
	private String clName;
	private String startTime;
	private String distrName;
	
	public Register() {}

	public Register(int regNo, String memNo, String clNo, String teachDate, String regDate, String schNo, String regPay,
			String regPrice, String regCount, String regSta, String refuse, String reEnroll, String regCal,
			String depositSta, String clThumb, String clName, String startTime, String distrName) {
		super();
		this.regNo = regNo;
		this.memNo = memNo;
		this.clNo = clNo;
		this.teachDate = teachDate;
		this.regDate = regDate;
		this.schNo = schNo;
		this.regPay = regPay;
		this.regPrice = regPrice;
		this.regCount = regCount;
		this.regSta = regSta;
		this.refuse = refuse;
		this.reEnroll = reEnroll;
		this.regCal = regCal;
		this.depositSta = depositSta;
		this.clThumb = clThumb;
		this.clName = clName;
		this.startTime = startTime;
		this.distrName = distrName;
	}
	
	

	public Register(int regNo, String teachDate, String regSta, String clThumb, String clName, String startTime,
			String distrName) {
		super();
		this.regNo = regNo;
		this.teachDate = teachDate;
		this.regSta = regSta;
		this.clThumb = clThumb;
		this.clName = clName;
		this.startTime = startTime;
		this.distrName = distrName;
	}

	

	public Register(int regNo, String clNo, String teachDate, String regSta,String clThumb, String clName,
			String startTime, String distrName) {
		super();
		this.regNo = regNo;
		this.clNo = clNo;
		this.teachDate = teachDate;
		this.regSta = regSta;
		this.clThumb = clThumb;
		this.clName = clName;
		this.startTime = startTime;
		this.distrName = distrName;
	}

	public int getRegNo() {
		return regNo;
	}

	public void setRegNo(int regNo) {
		this.regNo = regNo;
	}

	public String getMemNo() {
		return memNo;
	}

	public void setMemNo(String memNo) {
		this.memNo = memNo;
	}

	public String getClNo() {
		return clNo;
	}

	public void setClNo(String clNo) {
		this.clNo = clNo;
	}

	public String getTeachDate() {
		return teachDate;
	}

	public void setTeachDate(String teachDate) {
		this.teachDate = teachDate;
	}

	public String getRegDate() {
		return regDate;
	}

	public void setRegDate(String regDate) {
		this.regDate = regDate;
	}

	public String getSchNo() {
		return schNo;
	}

	public void setSchNo(String schNo) {
		this.schNo = schNo;
	}

	public String getRegPay() {
		return regPay;
	}

	public void setRegPay(String regPay) {
		this.regPay = regPay;
	}

	public String getRegPrice() {
		return regPrice;
	}

	public void setRegPrice(String regPrice) {
		this.regPrice = regPrice;
	}

	public String getRegCount() {
		return regCount;
	}

	public void setRegCount(String regCount) {
		this.regCount = regCount;
	}

	public String getRegSta() {
		return regSta;
	}

	public void setRegSta(String regSta) {
		this.regSta = regSta;
	}

	public String getRefuse() {
		return refuse;
	}

	public void setRefuse(String refuse) {
		this.refuse = refuse;
	}

	public String getReEnroll() {
		return reEnroll;
	}

	public void setReEnroll(String reEnroll) {
		this.reEnroll = reEnroll;
	}

	public String getRegCal() {
		return regCal;
	}

	public void setRegCal(String regCal) {
		this.regCal = regCal;
	}

	public String getDepositSta() {
		return depositSta;
	}

	public void setDepositSta(String depositSta) {
		this.depositSta = depositSta;
	}

	public String getClThumb() {
		return clThumb;
	}

	public void setClThumb(String clThumb) {
		this.clThumb = clThumb;
	}

	public String getClName() {
		return clName;
	}

	public void setClName(String clName) {
		this.clName = clName;
	}

	public String getStartTime() {
		return startTime;
	}

	public void setStartTime(String startTime) {
		this.startTime = startTime;
	}

	public String getDistrName() {
		return distrName;
	}

	public void setDistrName(String distrName) {
		this.distrName = distrName;
	}

	@Override
	public String toString() {
		return "Register [regNo=" + regNo + ", memNo=" + memNo + ", clNo=" + clNo + ", teachDate=" + teachDate
				+ ", regDate=" + regDate + ", schNo=" + schNo + ", regPay=" + regPay + ", regPrice=" + regPrice
				+ ", regCount=" + regCount + ", regSta=" + regSta + ", refuse=" + refuse + ", reEnroll=" + reEnroll
				+ ", regCal=" + regCal + ", depositSta=" + depositSta + ", clThumb=" + clThumb + ", clName=" + clName
				+ ", startTime=" + startTime + ", distrName=" + distrName + "]";
	}
	
	

}
