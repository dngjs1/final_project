package com.notnull.shop.product.model.vo;

import java.sql.Date;

public class ProductReview {

	private int review_code;
	private String member_id;
	private int review_star;
	private String review_content;
	private Date review_date;
	private int product_code;
	
	public ProductReview() {}

	public ProductReview(int review_code, String member_id, int review_star, String review_content, Date review_date,
			int product_code) {
		super();
		this.review_code = review_code;
		this.member_id = member_id;
		this.review_star = review_star;
		this.review_content = review_content;
		this.review_date = review_date;
		this.product_code = product_code;
	}

	public int getReview_code() {
		return review_code;
	}

	public void setReview_code(int review_code) {
		this.review_code = review_code;
	}

	public String getMember_id() {
		return member_id;
	}

	public void setMember_id(String member_id) {
		this.member_id = member_id;
	}

	public int getReview_star() {
		return review_star;
	}

	public void setReview_star(int review_star) {
		this.review_star = review_star;
	}

	public String getReview_content() {
		return review_content;
	}

	public void setReview_content(String review_content) {
		this.review_content = review_content;
	}

	public Date getReview_date() {
		return review_date;
	}

	public void setReview_date(Date review_date) {
		this.review_date = review_date;
	}

	public int getProduct_code() {
		return product_code;
	}

	public void setProduct_code(int product_code) {
		this.product_code = product_code;
	}

	@Override
	public String toString() {
		return "ProductReview [review_code=" + review_code + ", member_id=" + member_id + ", review_star=" + review_star
				+ ", review_content=" + review_content + ", review_date=" + review_date + ", product_code="
				+ product_code + "]";
	}
	
	
}
