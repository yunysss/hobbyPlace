package com.hp.calculate.model.vo;

public class Calculate {
	
	private int calNo;
	private String rgDt;
	private String finDt;
	private String price;
	private String bank;
	private String calAcc;
	private String calNm;
	private String calSta;
	private String calReg;
	
	public Calculate() {}

	public Calculate(int calNo, String rgDt, String finDt, String price, String bank, String calAcc, String calNm,
			String calSta, String calReg) {
		super();
		this.calNo = calNo;
		this.rgDt = rgDt;
		this.finDt = finDt;
		this.price = price;
		this.bank = bank;
		this.calAcc = calAcc;
		this.calNm = calNm;
		this.calSta = calSta;
		this.calReg = calReg;
	}

	public Calculate(String price, String bank, String calAcc, String calNm, String calReg) {
		super();
		this.price = price;
		this.bank = bank;
		this.calAcc = calAcc;
		this.calNm = calNm;
		this.calReg = calReg;
	}

	public int getCalNo() {
		return calNo;
	}

	public void setCalNo(int calNo) {
		this.calNo = calNo;
	}

	public String getRgDt() {
		return rgDt;
	}

	public void setRgDt(String rgDt) {
		this.rgDt = rgDt;
	}

	public String getFinDt() {
		return finDt;
	}

	public void setFinDt(String finDt) {
		this.finDt = finDt;
	}

	public String getPrice() {
		return price;
	}

	public void setPrice(String price) {
		this.price = price;
	}

	public String getBank() {
		return bank;
	}

	public void setBank(String bank) {
		this.bank = bank;
	}

	public String getCalAcc() {
		return calAcc;
	}

	public void setCalAcc(String calAcc) {
		this.calAcc = calAcc;
	}

	public String getCalNm() {
		return calNm;
	}

	public void setCalNm(String calNm) {
		this.calNm = calNm;
	}

	public String getCalSta() {
		return calSta;
	}

	public void setCalSta(String calSta) {
		this.calSta = calSta;
	}

	public String getCalReg() {
		return calReg;
	}

	public void setCalReg(String calReg) {
		this.calReg = calReg;
	}

	@Override
	public String toString() {
		return "Calculate [calNo=" + calNo + ", rgDt=" + rgDt + ", finDt=" + finDt + ", price=" + price + ", bank="
				+ bank + ", calAcc=" + calAcc + ", calNm=" + calNm + ", calSta=" + calSta + ", calReg=" + calReg + "]";
	}
	
	

}
