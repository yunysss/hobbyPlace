package com.hp.customerService.model.vo;

import java.sql.Date;

public class Faq {
	
	private int rNum;
	private int faqNO;
	private String memNO;
	private String grade;
	private String question;
	private String answer;
	private Date enrollDate;
	private Date updateDate;
	
	public Faq() {}
	
	
	

	public Faq(int rNum,int faqNO, String memNO, String grade, String question, String answer, Date enrollDate,
			Date updateDate) {
		super();
		this.rNum = rNum;
		this.faqNO = faqNO;
		this.memNO = memNO;
		this.grade = grade;
		this.question = question;
		this.answer = answer;
		this.enrollDate = enrollDate;
		this.updateDate = updateDate;
	}
	
	




	public Faq(int faqNO, String memNO, String grade, String question, String answer, Date enrollDate,
			Date updateDate) {
		super();
		this.faqNO = faqNO;
		this.memNO = memNO;
		this.grade = grade;
		this.question = question;
		this.answer = answer;
		this.enrollDate = enrollDate;
		this.updateDate = updateDate;
	}




	public Faq(int faqNO, String question) {
		super();
		this.faqNO = faqNO;
		this.question = question;
	}


	public int getrNum() {
		return rNum;
	}


	public void setrNum(int rNum) {
		this.rNum = rNum;
	}

	public int getFaqNO() {
		return faqNO;
	}

	public void setFaqNO(int faqNO) {
		this.faqNO = faqNO;
	}

	public String getMemNO() {
		return memNO;
	}

	public void setMemNO(String memNO) {
		this.memNO = memNO;
	}

	public String getGrade() {
		return grade;
	}

	public void setGrade(String grade) {
		this.grade = grade;
	}

	public String getQuestion() {
		return question;
	}

	public void setQuestion(String question) {
		this.question = question;
	}

	public String getAnswer() {
		return answer;
	}

	public void setAnswer(String answer) {
		this.answer = answer;
	}

	public Date getEnrollDate() {
		return enrollDate;
	}

	public void setEnrollDate(Date enrollDate) {
		this.enrollDate = enrollDate;
	}

	public Date getUpdateDate() {
		return updateDate;
	}

	public void setUpdateDate(Date updateDate) {
		this.updateDate = updateDate;
	}

	@Override
	public String toString() {
		return "Faq [rnum ="+ rNum + ", + faqNO=" + faqNO + ", memNO=" + memNO + ", grade=" + grade + ", question=" + question + ", answer="
				+ answer + ", enrollDate=" + enrollDate + ", updateDate=" + updateDate + "]";
	}
	
	
	

}
