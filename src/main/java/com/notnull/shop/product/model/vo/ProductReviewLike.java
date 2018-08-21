package com.notnull.shop.product.model.vo;

public class ProductReviewLike {

	private int review_code;
	private String member_id;
	private String like_status;
	
	public ProductReviewLike() {}

	public ProductReviewLike(int review_code, String member_id, String like_status) {
		super();
		this.review_code = review_code;
		this.member_id = member_id;
		this.like_status = like_status;
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

	public String getLike_status() {
		return like_status;
	}

	public void setLike_status(String like_status) {
		this.like_status = like_status;
	}

	@Override
	public String toString() {
		return "ProductReviewLike [review_code=" + review_code + ", member_id=" + member_id + ", like_status="
				+ like_status + "]";
	}
		
}
