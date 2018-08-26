package com.notnull.shop.member.model.vo;

import java.sql.Date;

public class Answer {
	private int question_code;
	private String member_id;
	private String answer_code;
	private Date answer_date;
	
	public Answer() {
		// TODO Auto-generated constructor stub
	}

	public Answer(int question_code, String member_id, String answer_code, Date answer_date) {
		super();
		this.question_code = question_code;
		this.member_id = member_id;
		this.answer_code = answer_code;
		this.answer_date = answer_date;
	}

	public int getQuestion_code() {
		return question_code;
	}

	public void setQuestion_code(int question_code) {
		this.question_code = question_code;
	}

	public String getMember_id() {
		return member_id;
	}

	public void setMember_id(String member_id) {
		this.member_id = member_id;
	}

	public String getAnswer_code() {
		return answer_code;
	}

	public void setAnswer_code(String answer_code) {
		this.answer_code = answer_code;
	}

	public Date getAnswer_date() {
		return answer_date;
	}

	public void setAnswer_date(Date answer_date) {
		this.answer_date = answer_date;
	}

	@Override
	public String toString() {
		return "Answer [question_code=" + question_code + ", member_id=" + member_id + ", answer_code=" + answer_code
				+ ", answer_date=" + answer_date + "]";
	}
	
	

}
