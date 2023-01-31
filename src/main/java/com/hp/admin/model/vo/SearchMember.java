package com.hp.admin.model.vo;

import java.util.Date;

public class SearchMember {

	public String sGroup;
	public String fCategory;
	public String lineup;
	public Date enrollStart;
	public Date enrollEnd;
	public String sCategory;
	public String searchKey;
	public String selectValue;
	
	public SearchMember() {}

	public SearchMember(String sGroup, String fCategory, String lineup, Date enrollStart, Date enrollEnd,
			String sCategory, String searchKey, String selectValue) {
		super();
		this.sGroup = sGroup;
		this.fCategory = fCategory;
		this.lineup = lineup;
		this.enrollStart = enrollStart;
		this.enrollEnd = enrollEnd;
		this.sCategory = sCategory;
		this.searchKey = searchKey;
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

	public Date getEnrollStart() {
		return enrollStart;
	}

	public void setEnrollStart(Date enrollStart) {
		this.enrollStart = enrollStart;
	}

	public Date getEnrollEnd() {
		return enrollEnd;
	}

	public void setEnrollEnd(Date enrollEnd) {
		this.enrollEnd = enrollEnd;
	}

	public String getsCategory() {
		return sCategory;
	}

	public void setsCategory(String sCategory) {
		this.sCategory = sCategory;
	}

	public String getSearchKey() {
		return searchKey;
	}

	public void setSearchKey(String searchKey) {
		this.searchKey = searchKey;
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
				+ enrollStart + ", enrollEnd=" + enrollEnd + ", sCategory=" + sCategory + ", searchKey=" + searchKey
				+ ", selectValue=" + selectValue + "]";
	}
	
	
}
