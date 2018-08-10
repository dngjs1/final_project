package com.notnull.shop.product.model.vo;

import java.sql.Date;

public class ProductQuestion {

	private int p_question_code;
	private String member_id;
	private String p_question_content;
	private Date question_date;
	private int product_code;
	private String status;
	private int question_level;
	private int p_question_code_ref;
	
	public ProductQuestion() {}

	public ProductQuestion(int p_question_code, String member_id, String p_question_content, Date question_date,
			int product_code, String status, int question_level, int p_question_code_ref) {
		super();
		this.p_question_code = p_question_code;
		this.member_id = member_id;
		this.p_question_content = p_question_content;
		this.question_date = question_date;
		this.product_code = product_code;
		this.status = status;
		this.question_level = question_level;
		this.p_question_code_ref = p_question_code_ref;
	}

	public int getP_question_code() {
		return p_question_code;
	}

	public void setP_question_code(int p_question_code) {
		this.p_question_code = p_question_code;
	}

	public String getMember_id() {
		return member_id;
	}

	public void setMember_id(String member_id) {
		this.member_id = member_id;
	}

	public String getP_question_content() {
		return p_question_content;
	}

	public void setP_question_content(String p_question_content) {
		this.p_question_content = p_question_content;
	}

	public Date getQuestion_date() {
		return question_date;
	}

	public void setQuestion_date(Date question_date) {
		this.question_date = question_date;
	}

	public int getProduct_code() {
		return product_code;
	}

	public void setProduct_code(int product_code) {
		this.product_code = product_code;
	}

	public String getStatus() {
		return status;
	}

	public void setStatus(String status) {
		this.status = status;
	}

	public int getQuestion_level() {
		return question_level;
	}

	public void setQuestion_level(int question_level) {
		this.question_level = question_level;
	}

	public int getP_question_code_ref() {
		return p_question_code_ref;
	}

	public void setP_question_code_ref(int p_question_code_ref) {
		this.p_question_code_ref = p_question_code_ref;
	}

	@Override
	public String toString() {
		return "ProductQuestion [p_question_code=" + p_question_code + ", member_id=" + member_id
				+ ", p_question_content=" + p_question_content + ", question_date=" + question_date + ", product_code="
				+ product_code + ", status=" + status + ", question_level=" + question_level + ", p_question_code_ref="
				+ p_question_code_ref + "]";
	}

	
}
