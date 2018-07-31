package com.notnull.shop.product.model.vo;

public class ProductOption {
	private int product_option_code;
	private String option_size;
	private int left_amount;
	private int product_code;
	
	public ProductOption() {}

	public ProductOption(int product_option_code, String option_size, int left_amount, int product_code) {
		super();
		this.product_option_code = product_option_code;
		this.option_size = option_size;
		this.left_amount = left_amount;
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

	public int getLeft_amount() {
		return left_amount;
	}

	public void setLeft_amount(int left_amount) {
		this.left_amount = left_amount;
	}

	public int getProduct_code() {
		return product_code;
	}

	public void setProduct_code(int product_code) {
		this.product_code = product_code;
	}

	@Override
	public String toString() {
		return "ProductOption [product_option_code=" + product_option_code + ", option_size=" + option_size
				+ ", left_amount=" + left_amount + ", product_code=" + product_code + "]";
	}
	
	
	
}
