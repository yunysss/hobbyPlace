package com.hp.admin.model.vo;

import java.util.Date;


public class Search {
	
	
	private String keyword;
	private String category;
	private String dcategory;
	private String starDate;
	private String endDate;
	private String status;
	private String sido;
	private String sigungu;
	private String day;
	private String price;
	private String sort;
	
	
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

  
	
	

	public Search(String keyword, String category, String dcategory, String sido, String sigungu, String day,
			String price, String sort) {
		super();
		this.keyword = keyword;
		this.category = category;
		this.dcategory = dcategory;
		this.sido = sido;
		this.sigungu = sigungu;
		this.day = day;
		this.price = price;
		this.sort = sort;
	}


	public Search(String keyword, String category, String dcategory, String sido, String sigungu, String day,
			String price) {
		super();
		this.keyword = keyword;
		this.category = category;
		this.dcategory = dcategory;
		this.sido = sido;
		this.sigungu = sigungu;
		this.day = day;
		this.price = price;
	}


	public Search(String keyword, String starDate, String endDate, String status) {
		super();
		this.keyword = keyword;
		this.starDate = starDate;
		this.endDate = endDate;
		this.status = status;
	}
	
	
  

	public String getSort() {
		return sort;
	}


	public void setSort(String sort) {
		this.sort = sort;
	}


	public String getSido() {
		return sido;
	}


	public void setSido(String sido) {
		this.sido = sido;
	}


	public String getSigungu() {
		return sigungu;
	}


	public void setSigungu(String sigungu) {
		this.sigungu = sigungu;
	}


	public String getDay() {
		return day;
	}


	public void setDay(String day) {
		this.day = day;
	}


	public String getPrice() {
		return price;
	}


	public void setPrice(String price) {
		this.price = price;
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


	public Search(String keyword, String category, String dcategory, String starDate, String endDate, String status,
			String sido, String sigungu, String day, String price) {
		super();
		this.keyword = keyword;
		this.category = category;
		this.dcategory = dcategory;
		this.starDate = starDate;
		this.endDate = endDate;
		this.status = status;
		this.sido = sido;
		this.sigungu = sigungu;
		this.day = day;
		this.price = price;
	}


	
	

}
