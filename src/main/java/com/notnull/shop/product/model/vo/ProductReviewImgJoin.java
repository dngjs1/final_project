package com.notnull.shop.product.model.vo;

public class ProductReviewImgJoin {
	
	private int product_code;
	private int review_code;
	private String new_review_img_path;
	
	public ProductReviewImgJoin() {}

	public ProductReviewImgJoin(int product_code, int review_code, String new_review_img_path) {
		super();
		this.product_code = product_code;
		this.review_code = review_code;
		this.new_review_img_path = new_review_img_path;
	}

	public int getProduct_code() {
		return product_code;
	}

	public void setProduct_code(int product_code) {
		this.product_code = product_code;
	}

	public int getReview_code() {
		return review_code;
	}

	public void setReview_code(int review_code) {
		this.review_code = review_code;
	}

	public String getNew_review_img_path() {
		return new_review_img_path;
	}

	public void setNew_review_img_path(String new_review_img_path) {
		this.new_review_img_path = new_review_img_path;
	}

	@Override
	public String toString() {
		return "ProductReviewImgJoin [product_code=" + product_code + ", review_code=" + review_code
				+ ", new_review_img_path=" + new_review_img_path + "]";
	}

	 
	
	
	
}
