package com.hp.lesson.model.vo;

public class Dcategory {
	
	private int ctDno;
	private String ctNo;
	private String ctDname;
	public Dcategory(int ctDno, String ctNo, String ctDname) {
		super();
		this.ctDno = ctDno;
		this.ctNo = ctNo;
		this.ctDname = ctDname;
	}
	public int getCtDno() {
		return ctDno;
	}
	public void setCtDno(int ctDno) {
		this.ctDno = ctDno;
	}
	public String getCtNo() {
		return ctNo;
	}
	public void setCtNo(String ctNo) {
		this.ctNo = ctNo;
	}
	public String getCtDname() {
		return ctDname;
	}
	public void setCtDname(String ctDname) {
		this.ctDname = ctDname;
	}
	@Override
	public String toString() {
		return "Dcategory [ctDno=" + ctDno + ", ctNo=" + ctNo + ", ctDname=" + ctDname + "]";
	}
	
	
}