package com.hp.admin.model.vo;

import java.util.Date;


public class Search {
	
	
	private String keyword;
	private String category;
	private String dcategory;
	private String starDate;
	private String endDate;
	private String status;
	
	
	public Search() {}


	public Search(String keyword, String category, String dcategory, String starDate, String endDate, String status) {
		super();
		this.keyword = keyword;
		this.category = category;
		this.dcategory = dcategory;
		this.starDate = starDate;
		this.endDate = endDate;
		this.status = status;
	}


	
	public String getKeyword() {
		return keyword;
	}


	public void setKeyword(String keyword) {
		this.keyword = keyword;
	}


	public String getCategory() {
		return category;
	}


	public void setCategory(String category) {
		this.category = category;
	}


	public String getDcategory() {
		return dcategory;
	}


	public void setDcategory(String dcategory) {
		this.dcategory = dcategory;
	}


	public String getStarDate() {
		return starDate;
	}


	public void setStarDate(String starDate) {
		this.starDate = starDate;
	}


	public String getEndDate() {
		return endDate;
	}


	public void setEndDate(String endDate) {
		this.endDate = endDate;
	}


	public String getStatus() {
		return status;
	}


	public void setStatus(String status) {
		this.status = status;
	}


	@Override
	public String toString() {
		return "Search [keyword=" + keyword + ", category=" + category + ", dcategory=" + dcategory + ", starDate="
				+ starDate + ", endDate=" + endDate + ", status=" + status + "]";
	}



}
