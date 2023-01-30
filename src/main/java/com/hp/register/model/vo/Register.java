package com.hp.register.model.vo;

public class Register {

	public int regNo;
	public String memNo;
	public String clNo;
	public String teachDate;
	public String regDate;
	public String schNo;
	public String regPay;
	public String regPrice;
	public String regCount;
	public String regSta;
	public String refuse;
	public String reEnroll;
	public String regCal;
	public String memPhone;
	public String memEmail;
	public String clThumb;
	public String clName;
	public String startTime;
	public String distrName;
	public String ttName;
	
	public Register() {}

	public Register(int regNo, String memNo, String clNo, String teachDate, String regDate, String schNo, String regPay,
			String regPrice, String regCount, String regSta, String refuse, String reEnroll, String regCal) {
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
	}

	public Register(int regNo, String memNo, String clNo, String teachDate, String regDate, String schNo,
			String regPrice, String regSta) {
		super();
		this.regNo = regNo;
		this.memNo = memNo;
		this.clNo = clNo;
		this.teachDate = teachDate;
		this.regDate = regDate;
		this.schNo = schNo;
		this.regPrice = regPrice;
		this.regSta = regSta;
	}

	public Register(int regNo, String memNo, String clNo, String teachDate, String regDate, String schNo,
			String regPrice, String regCount, String memPhone, String memEmail) {
		super();
		this.regNo = regNo;
		this.memNo = memNo;
		this.clNo = clNo;
		this.teachDate = teachDate;
		this.regDate = regDate;
		this.schNo = schNo;
		this.regPrice = regPrice;
		this.regCount = regCount;
		this.memPhone = memPhone;
		this.memEmail = memEmail;
	}
	
	
	

	public Register( String teachDate, int regNo, String regDate, String regPay, String regPrice,
			String regCount, String regSta, String clThumb, String clName, String startTime, String distrName, String ttName) {
		super();
		this.teachDate = teachDate;
		this.regNo = regNo;
		this.regDate = regDate;
		this.regPay = regPay;
		this.regPrice = regPrice;
		this.regCount = regCount;
		this.regSta = regSta;
		this.clThumb = clThumb;
		this.clName = clName;
		this.startTime = startTime;
		this.distrName = distrName;
		this.ttName = ttName;
	}
	
	
	public Register(String regPay, int regNo, String regPrice, String regCount, String regSta, String clThumb,
			String clName, String startTime, String distrName, String ttName) {
		super();
		this.regPay = regPay;
		this.regNo = regNo;
		this.regPrice = regPrice;
		this.regCount = regCount;
		this.regSta = regSta;
		this.clThumb = clThumb;
		this.clName = clName;
		this.startTime = startTime;
		this.distrName = distrName;
		this.ttName = ttName;
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
	public String getMemPhone() {
		return memPhone;
	}

	public void setMemPhone(String memPhone) {
		this.memPhone = memPhone;
	}

	public String getMemEmail() {
		return memEmail;
	}

	public void setMemEmail(String memEmail) {
		this.memEmail = memEmail;
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

	
	public String getTtName() {
		return ttName;
	}

	public void setTtName(String ttName) {
		this.ttName = ttName;
	}

	@Override
	public String toString() {
		return "Register [regNo=" + regNo + ", memNo=" + memNo + ", clNo=" + clNo + ", teachDate=" + teachDate
				+ ", regDate=" + regDate + ", schNo=" + schNo + ", regPay=" + regPay + ", regPrice=" + regPrice
				+ ", regCount=" + regCount + ", regSta=" + regSta + ", refuse=" + refuse + ", reEnroll=" + reEnroll
				+ ", regCal=" + regCal + ", memPhone=" + memPhone + ", memEmail=" + memEmail + ", clThumb=" + clThumb
				+ ", clName=" + clName + ", startTime=" + startTime + ", distrName=" + distrName + ", ttName=" + ttName
				+ "]";
	}

	
	
	
}
