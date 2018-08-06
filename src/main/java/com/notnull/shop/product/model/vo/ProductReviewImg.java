package com.notnull.shop.product.model.vo;

public class ProductReviewImg {

	private int review_img_code;
	private String review_img_path;
	private String new_review_img_path;
	private int review_code;
	
	public ProductReviewImg() {}

	public ProductReviewImg(int review_img_code, String review_img_path, String new_review_img_path, int review_code) {
		super();
		this.review_img_code = review_img_code;
		this.review_img_path = review_img_path;
		this.new_review_img_path = new_review_img_path;
		this.review_code = review_code;
	}

	public int getReview_img_code() {
		return review_img_code;
	}

	public void setReview_img_code(int review_img_code) {
		this.review_img_code = review_img_code;
	}

	public String getReview_img_path() {
		return review_img_path;
	}

	public void setReview_img_path(String review_img_path) {
		this.review_img_path = review_img_path;
	}

	public String getNew_review_img_path() {
		return new_review_img_path;
	}

	public void setNew_review_img_path(String new_review_img_path) {
		this.new_review_img_path = new_review_img_path;
	}

	public int getReview_code() {
		return review_code;
	}

	public void setReview_code(int review_code) {
		this.review_code = review_code;
	}

	@Override
	public String toString() {
		return "ProductReviewImg [review_img_code=" + review_img_code + ", review_img_path=" + review_img_path
				+ ", new_review_img_path=" + new_review_img_path + ", review_code=" + review_code + "]";
	}	
	
}
