package com.hp.refund.model.vo;

public class Refund {
	
	private int orderNo;
	private String memNo;
	private String refRqDt;
	private String refFinDt;
	private String refPrice;
	private String refBank;
	private String refAcc;
	private String refName;
	private String refSta;
	private String refRea;
	
	public Refund() {}

	public Refund(int orderNo, String memNo, String refRqDt, String refFinDt, String refPrice, String refBank,
			String refAcc, String refName, String refSta, String refRea) {
		super();
		this.orderNo = orderNo;
		this.memNo = memNo;
		this.refRqDt = refRqDt;
		this.refFinDt = refFinDt;
		this.refPrice = refPrice;
		this.refBank = refBank;
		this.refAcc = refAcc;
		this.refName = refName;
		this.refSta = refSta;
		this.refRea = refRea;
	}

	public Refund(int orderNo, String refRqDt, String refPrice, String refBank, String refAcc, String refName, String refSta, String refRea) {
		super();
		this.orderNo = orderNo;
		this.refRqDt = refRqDt;
		this.refPrice = refPrice;
		this.refBank = refBank;
		this.refAcc = refAcc;
		this.refName = refName;
		this.refSta = refSta;
		this.refRea = refRea;
	}
	
	

	public int getOrderNo() {
		return orderNo;
	}

	public void setOrderNo(int orderNo) {
		this.orderNo = orderNo;
	}

	public String getMemNo() {
		return memNo;
	}

	public void setMemNo(String memNo) {
		this.memNo = memNo;
	}

	public String getRefRqDt() {
		return refRqDt;
	}

	public void setRefRqDt(String refRqDt) {
		this.refRqDt = refRqDt;
	}

	public String getRefFinDt() {
		return refFinDt;
	}

	public void setRefFinDt(String refFinDt) {
		this.refFinDt = refFinDt;
	}

	public String getRefPrice() {
		return refPrice;
	}

	public void setRefPrice(String refPrice) {
		this.refPrice = refPrice;
	}

	public String getRefBank() {
		return refBank;
	}

	public void setRefBank(String refBank) {
		this.refBank = refBank;
	}

	public String getRefAcc() {
		return refAcc;
	}

	public void setRefAcc(String refAcc) {
		this.refAcc = refAcc;
	}

	public String getRefName() {
		return refName;
	}

	public void setRefName(String refName) {
		this.refName = refName;
	}

	public String getRefSta() {
		return refSta;
	}

	public void setRefSta(String refSta) {
		this.refSta = refSta;
	}

	public String getRefRea() {
		return refRea;
	}

	public void setRefRea(String refRea) {
		this.refRea = refRea;
	}

	@Override
	public String toString() {
		return "Refund [orderNo=" + orderNo + ", memNo=" + memNo + ", refRqDt=" + refRqDt + ", refFinDt=" + refFinDt
				+ ", refPrice=" + refPrice + ", refBank=" + refBank + ", refAcc=" + refAcc + ", refName=" + refName
				+ ", refSta=" + refSta + ", refRea=" + refRea + "]";
	}
	
	

}
