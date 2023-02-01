package com.hp.admin.model.vo;

import java.util.Date;

public class SearchMember {

	public String sGroup;
	public String fCategory;
	public String lineup;
	public String enrollStart;
	public String enrollEnd;
	public String sCategory;
	public String searchkey1;
	public String searchkey2;
	public String selectValue;
	
	public SearchMember() {}

	

	public SearchMember(String sGroup, String fCategory, String lineup, String enrollStart, String enrollEnd,
			String sCategory, String searchkey1, String searchkey2, String selectValue) {
		super();
		this.sGroup = sGroup;
		this.fCategory = fCategory;
		this.lineup = lineup;
		this.enrollStart = enrollStart;
		this.enrollEnd = enrollEnd;
		this.sCategory = sCategory;
		this.searchkey1 = searchkey1;
		this.searchkey2 = searchkey2;
		this.selectValue = selectValue;
	}



	public String getsGroup() {
		return sGroup;
	}

	public void setsGroup(String sGroup) {
		this.sGroup = sGroup;
	}

	public String getfCategory() {
		return fCategory;
	}

	public void setfCategory(String fCategory) {
		this.fCategory = fCategory;
	}

	public String getLineup() {
		return lineup;
	}

	public void setLineup(String lineup) {
		this.lineup = lineup;
	}

	public String getEnrollStart() {
		return enrollStart;
	}

	public void setEnrollStart(String enrollStart) {
		this.enrollStart = enrollStart;
	}

	public String getEnrollEnd() {
		return enrollEnd;
	}

	public void setEnrollEnd(String enrollEnd) {
		this.enrollEnd = enrollEnd;
	}

	public String getsCategory() {
		return sCategory;
	}

	public void setsCategory(String sCategory) {
		this.sCategory = sCategory;
	}

	public String getSearchkey1() {
		return searchkey1;
	}

	public void setSearchkey1(String searchkey1) {
		this.searchkey1 = searchkey1;
	}
	

	public String getSearchkey2() {
		return searchkey2;
	}



	public void setSearchkey2(String searchkey2) {
		this.searchkey2 = searchkey2;
	}



	public String getSelectValue() {
		return selectValue;
	}

	public void setSelectValue(String selectValue) {
		this.selectValue = selectValue;
	}



	@Override
	public String toString() {
		return "SearchMember [sGroup=" + sGroup + ", fCategory=" + fCategory + ", lineup=" + lineup + ", enrollStart="
				+ enrollStart + ", enrollEnd=" + enrollEnd + ", sCategory=" + sCategory + ", searchkey1=" + searchkey1
				+ ", searchkey2=" + searchkey2 + ", selectValue=" + selectValue + "]";
	}

	
	
	
}
