package com.hp.lesson.model.vo;

public class Category {
	
	private int ctNo;
	private String ctName;
	

	public Category() {}


	public Category(int ctNo, String ctName) {
		super();
		this.ctNo = ctNo;
		this.ctName = ctName;
	}


	public int getCtNo() {
		return ctNo;
	}


	public void setCtNo(int ctNo) {
		this.ctNo = ctNo;
	}


	public String getCtName() {
		return ctName;
	}


	public void setCtName(String ctName) {
		this.ctName = ctName;
	}


	@Override
	public String toString() {
		return "Category [ctNo=" + ctNo + ", ctName=" + ctName + "]";
	}
	
	
}
