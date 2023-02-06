package com.hp.register.model.vo;

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
	private String memName;
	private String memPhone;
	private String memEmail;
	private String clThumb;
	private String clName;
	private String clPrice;
	private String startTime;
	private String distrName;
	private String ttName;
	private String ctName;
	private String ctDname;
	private String refRqDt;
	private String refSta;
	private String endTime;
	private String memo;
	private String localName;
	
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
	

	public Register(int regNo, String memNo, String clNo, String teachDate, String regDate, String regCount) {
		super();
		this.regNo = regNo;
		this.memNo = memNo;
		this.clNo = clNo;
		this.teachDate = teachDate;
		this.regDate = regDate;
		this.regCount = regCount;
	}

	public Register(int regNo, String clNo, String teachDate, String regPay, String regPrice, String clThumb,
			String clName, String startTime, String distrName) {
		super();
		this.regNo = regNo;
		this.clNo = clNo;
		this.teachDate = teachDate;
		this.regPay = regPay;
		this.regPrice = regPrice;
		this.clThumb = clThumb;
		this.clName = clName;
		this.startTime = startTime;
		this.distrName = distrName;
	}

	public Register(String memNo, String clNo, String teachDate, String schNo, String regPay, String regPrice,
			String regCount) {
		super();
		this.memNo = memNo;
		this.clNo = clNo;
		this.teachDate = teachDate;
		this.schNo = schNo;
		this.regPay = regPay;
		this.regPrice = regPrice;
		this.regCount = regCount;
	}	

	public Register(String clNo, String schNo, String regCount, String teachDate) {
		super();
		this.clNo = clNo;
		this.schNo = schNo;
		this.regCount = regCount;
		this.teachDate = teachDate;
	}

	public Register(String clNo, String teachDate, String regDate, String regPrice, String regCount, String regSta, String clThumb,
			String clName, String ttName) {
		super();
		this.clNo = clNo;
		this.teachDate = teachDate;
		this.regDate = regDate;
		this.regPrice = regPrice;
		this.regCount = regCount;
		this.regSta = regSta;
		this.clThumb = clThumb;
		this.clName = clName;
		this.ttName = ttName;
	}

	public Register(int regNo, String memNo, String regDate, String regPay, String regPrice, String regSta,
			String depositSta) {
		super();
		this.regNo = regNo;
		this.memNo = memNo;
		this.regDate = regDate;
		this.regPay = regPay;
		this.regPrice = regPrice;
		this.regSta = regSta;
		this.depositSta = depositSta;
	}
	

	public Register(int regNo, String memNo, String clNo, String clName, String teachDate, String regDate, String schNo, String regPay,
			String regPrice, String regCount, String regSta, String refuse, String reEnroll, String regCal,
			String ttName, String ctName, String ctDname) {
		super();
		this.regNo = regNo;
		this.memNo = memNo;
		this.clNo = clNo;
		this.clName = clName;
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
		this.ttName = ttName;
		this.ctName = ctName;
		this.ctDname = ctDname;
	}
	
	

	
	public Register(int regNo, String teachDate, String regDate, String regPay, String regPrice, String regCount,
			String regSta, String clThumb, String clName, String startTime, String distrName, String ttName,
			String refRqDt, String refSta) {
		super();
		this.regNo = regNo;
		this.teachDate = teachDate;
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
		this.refRqDt = refRqDt;
		this.refSta = refSta;
	}
	
	

	public Register(int regNo, String teachDate, String regPrice, String regCount, String regSta, String memName,
			String memPhone, String memEmail, String clName, String clPrice, String startTime) {
		super();
		this.regNo = regNo;
		this.teachDate = teachDate;
		this.regPrice = regPrice;
		this.regCount = regCount;
		this.regSta = regSta;
		this.memName = memName;
		this.memPhone = memPhone;
		this.memEmail = memEmail;
		this.clName = clName;
		this.clPrice = clPrice;
		this.startTime = startTime;
	}
	
	

	public Register(int regNo, String teachDate, String regDate, String regPrice, String regCount, String regSta,
			String reEnroll, String memName, String memPhone, String memEmail, String clName, String clPrice,
			String startTime, String endTime, String memo) {
		super();
		this.regNo = regNo;
		this.teachDate = teachDate;
		this.regDate = regDate;
		this.regPrice = regPrice;
		this.regCount = regCount;
		this.regSta = regSta;
		this.reEnroll = reEnroll;
		this.memName = memName;
		this.memPhone = memPhone;
		this.memEmail = memEmail;
		this.clName = clName;
		this.clPrice = clPrice;
		this.startTime = startTime;
		this.endTime = endTime;
		this.memo = memo;
		
	}

	
	public Register(int regNo, String memNo, String clNo, String clName, String teachDate, String regDate, String regPay,
			String regPrice, String regCount, String regSta, String refuse, String reEnroll, String regCal,
			String memName, String startTime, String distrName, String ctName, String ctDname, String endTime,
			String localName) {
		super();
		this.regNo = regNo;
		this.memNo = memNo;
		this.clNo = clNo;
		this.clName = clName;
		this.teachDate = teachDate;
		this.regDate = regDate;
		this.regPay = regPay;
		this.regPrice = regPrice;
		this.regCount = regCount;
		this.regSta = regSta;
		this.refuse = refuse;
		this.reEnroll = reEnroll;
		this.regCal = regCal;
		this.memName = memName;
		this.startTime = startTime;
		this.distrName = distrName;
		this.ctName = ctName;
		this.ctDname = ctDname;
		this.endTime = endTime;
		this.localName = localName;
	}

	public String getLocalName() {
		return localName;
	}

	public void setLocalName(String localName) {
		this.localName = localName;
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

	public String getDepositSta() {
		return depositSta;
	}

	public void setDepositSta(String depositSta) {
		this.depositSta = depositSta;
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

	public String getRefRqDt() {
		return refRqDt;
	}

	public void setRefRqDt(String refRqDt) {
		this.refRqDt = refRqDt;
	}

	public String getRefSta() {
		return refSta;
	}

	public void setRefSta(String refSta) {
		this.refSta = refSta;
	}
	
	

	public String getMemName() {
		return memName;
	}

	public void setMemName(String memName) {
		this.memName = memName;
	}

	public String getClPrice() {
		return clPrice;
	}

	public void setClPrice(String clPrice) {
		this.clPrice = clPrice;
	}

	
	public String getEndTime() {
		return endTime;
	}

	public void setEndTime(String endTime) {
		this.endTime = endTime;
	}

	public String getMemo() {
		return memo;
	}

	public void setMemo(String memo) {
		this.memo = memo;
	}

	@Override
	public String toString() {
		return "Register [regNo=" + regNo + ", memNo=" + memNo + ", clNo=" + clNo + ", teachDate=" + teachDate
				+ ", regDate=" + regDate + ", schNo=" + schNo + ", regPay=" + regPay + ", regPrice=" + regPrice
				+ ", regCount=" + regCount + ", regSta=" + regSta + ", refuse=" + refuse + ", reEnroll=" + reEnroll
				+ ", regCal=" + regCal + ", depositSta=" + depositSta + ", memName=" + memName + ", memPhone="
				+ memPhone + ", memEmail=" + memEmail + ", clThumb=" + clThumb + ", clName=" + clName + ", clPrice="
				+ clPrice + ", startTime=" + startTime + ", distrName=" + distrName + ", ttName=" + ttName + ", ctName="
				+ ctName + ", ctDname=" + ctDname + ", refRqDt=" + refRqDt + ", refSta=" + refSta + ", endTime="
				+ endTime + ", memo=" + memo + "]";
	}
	
	
	

	

	

	
	

	

	
	
	
	
}
