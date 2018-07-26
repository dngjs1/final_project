package com.notnull.shop.product.model.vo;

import java.sql.Date;

public class Product {

	private int product_code;
	private int price;
	private String product_name;
	private Date release_date;
	private String country;
	private String real_size;
	private String p_category_code;
	private String p_board_content;
	private Date write_date;
	
	public Product() {}

	public Product(int product_code, int price, String product_name, Date release_date, String country,
			String real_size, String p_category_code, String p_board_content, Date write_date) {
		super();
		this.product_code = product_code;
		this.price = price;
		this.product_name = product_name;
		this.release_date = release_date;
		this.country = country;
		this.real_size = real_size;
		this.p_category_code = p_category_code;
		this.p_board_content = p_board_content;
		this.write_date = write_date;
	}

	public int getProduct_code() {
		return product_code;
	}

	public void setProduct_code(int product_code) {
		this.product_code = product_code;
	}

	public int getPrice() {
		return price;
	}

	public void setPrice(int price) {
		this.price = price;
	}

	public String getProduct_name() {
		return product_name;
	}

	public void setProduct_name(String product_name) {
		this.product_name = product_name;
	}

	public Date getRelease_date() {
		return release_date;
	}

	public void setRelease_date(Date release_date) {
		this.release_date = release_date;
	}

	public String getCountry() {
		return country;
	}

	public void setCountry(String country) {
		this.country = country;
	}

	public String getReal_size() {
		return real_size;
	}

	public void setReal_size(String real_size) {
		this.real_size = real_size;
	}

	public String getP_category_code() {
		return p_category_code;
	}

	public void setP_category_code(String p_category_code) {
		this.p_category_code = p_category_code;
	}

	public String getP_board_content() {
		return p_board_content;
	}

	public void setP_board_content(String p_board_content) {
		this.p_board_content = p_board_content;
	}

	public Date getWrite_date() {
		return write_date;
	}

	public void setWrite_date(Date write_date) {
		this.write_date = write_date;
	}

	@Override
	public String toString() {
		return "Product [product_code=" + product_code + ", price=" + price + ", product_name=" + product_name
				+ ", release_date=" + release_date + ", country=" + country + ", real_size=" + real_size
				+ ", p_category_code=" + p_category_code + ", p_board_content=" + p_board_content + ", write_date="
				+ write_date + "]";
	}

	
	
	
}
