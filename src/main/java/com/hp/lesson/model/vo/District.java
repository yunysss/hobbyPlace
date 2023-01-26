package com.hp.lesson.model.vo;

public class District {
	
	int distrCode;
	int localCode;
	String distrName;

	public District(){}

	public District(int distrCode, int localCode, String distrName) {
		super();
		this.distrCode = distrCode;
		this.localCode = localCode;
		this.distrName = distrName;
	}

	public int getDistrCode() {
		return distrCode;
	}

	public void setDistrCode(int distrCode) {
		this.distrCode = distrCode;
	}

	public int getLocalCode() {
		return localCode;
	}

	public void setLocalCode(int localCode) {
		this.localCode = localCode;
	}

	public String getDistrName() {
		return distrName;
	}

	public void setDistrName(String distrName) {
		this.distrName = distrName;
	}

	@Override
	public String toString() {
		return "District [distrCode=" + distrCode + ", localCode=" + localCode + ", distrName=" + distrName + "]";
	}
	
	
	
	
	
}	
	
	