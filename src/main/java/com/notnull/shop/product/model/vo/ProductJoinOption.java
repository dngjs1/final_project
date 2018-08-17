package com.notnull.shop.product.model.vo;

public class ProductJoinOption {
	private int product_code;
	private int product_option_code;
	private String option_size;
	private int price;
	private String product_name;
	private String new_p_img_path;
	
	public ProductJoinOption() {
		// TODO Auto-generated constructor stub
	}

	public ProductJoinOption(int product_code, int product_option_code, String option_size, int price,
			String product_name, String new_p_img_path) {
		super();
		this.product_code = product_code;
		this.product_option_code = product_option_code;
		this.option_size = option_size;
		this.price = price;
		this.product_name = product_name;
		this.new_p_img_path = new_p_img_path;
	}

	@Override
	public String toString() {
		return "ProductJoinOption [product_code=" + product_code + ", product_option_code=" + product_option_code
				+ ", option_size=" + option_size + ", price=" + price + ", product_name=" + product_name
				+ ", new_p_img_path=" + new_p_img_path + "]";
	}

	public int getProduct_code() {
		return product_code;
	}

	public void setProduct_code(int product_code) {
		this.product_code = product_code;
	}

	public int getProduct_option_code() {
		return product_option_code;
	}

	public void setProduct_option_code(int product_option_code) {
		this.product_option_code = product_option_code;
	}

	public String getOption_size() {
		return option_size;
	}

	public void setOption_size(String option_size) {
		this.option_size = option_size;
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

	public String getNew_p_img_path() {
		return new_p_img_path;
	}

	public void setNew_p_img_path(String new_p_img_path) {
		this.new_p_img_path = new_p_img_path;
	}

	
}
