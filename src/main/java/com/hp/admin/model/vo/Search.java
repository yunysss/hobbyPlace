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
	private String am;
	private String pm;
	private String schedule;
	private String keywordType;
	private String location;
	private String District;
	private String filtering;
	private int order;
	
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

	public Search(String keywordType, String keyword, String category, String dcategory, 
			String location, String district, String filtering, int order, String starDate, String endDate) {
		super();
		this.keyword = keyword;
		this.category = category;
		this.dcategory = dcategory;
		this.starDate = starDate;
		this.endDate = endDate;
		this.keywordType = keywordType;
		this.location = location;
		District = district;
		this.filtering = filtering;
		this.order = order;
	}


	public String getSchedule() {
		return schedule;
	}


	public void setSchedule(String schedule) {
		this.schedule = schedule;
	}


	public String getAm() {
		return am;
	}


	public void setAm(String am) {
		this.am = am;
	}


	public String getPm() {
		return pm;
	}


	public void setPm(String pm) {
		this.pm = pm;
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


	public String getKeywordType() {
		return keywordType;
	}


	public void setKeywordType(String keywordType) {
		this.keywordType = keywordType;
	}


	public String getLocation() {
		return location;
	}


	public void setLocation(String location) {
		this.location = location;
	}


	public String getDistrict() {
		return District;
	}


	public void setDistrict(String district) {
		District = district;
	}


	public String getFiltering() {
		return filtering;
	}


	public void setFiltering(String filtering) {
		this.filtering = filtering;
	}


	public int getOrder() {
		return order;
	}


	public void setOrder(int order) {
		this.order = order;
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
