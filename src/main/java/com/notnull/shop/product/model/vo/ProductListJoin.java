package com.notnull.shop.product.model.vo;

import java.sql.Date;

public class ProductListJoin {

	private int product_code;
	private Date write_date;
	private String product_name;
	private String new_p_img_path;
	private int price;
	private int review_star;
	
	public ProductListJoin() {}

	public ProductListJoin(int product_code, Date write_date, String product_name, String new_p_img_path, int price,
			int review_star) {
		super();
		this.product_code = product_code;
		this.write_date = write_date;
		this.product_name = product_name;
		this.new_p_img_path = new_p_img_path;
		this.price = price;
		this.review_star = review_star;
	}

	public int getProduct_code() {
		return product_code;
	}

	public void setProduct_code(int product_code) {
		this.product_code = product_code;
	}

	public Date getWrite_date() {
		return write_date;
	}

	public void setWrite_date(Date write_date) {
		this.write_date = write_date;
	}

	public String getProduct_name() {
		return product_name;
	}

	public void setProduct_name(String product_name) {
		this.product_name = product_name;
	}

	public String getNew_p_img_path() {
		return new_p_img_path;
	}

	public void setNew_p_img_path(String new_p_img_path) {
		this.new_p_img_path = new_p_img_path;
	}

	public int getPrice() {
		return price;
	}

	public void setPrice(int price) {
		this.price = price;
	}

	public int getReview_star() {
		return review_star;
	}

	public void setReview_star(int review_star) {
		this.review_star = review_star;
	}

	@Override
	public String toString() {
		return "ProductListJoin [product_code=" + product_code + ", write_date=" + write_date + ", product_name="
				+ product_name + ", new_p_img_path=" + new_p_img_path + ", price=" + price + ", review_star="
				+ review_star + "]";
	}

	

	
	
	
	
}
