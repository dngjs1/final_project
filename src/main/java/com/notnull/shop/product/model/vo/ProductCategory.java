package com.notnull.shop.product.model.vo;

public class ProductCategory {
	private String p_category_code;
	private String p_category_name;
	
	public ProductCategory() {}

	public ProductCategory(String p_category_code, String p_category_name) {
		super();
		this.p_category_code = p_category_code;
		this.p_category_name = p_category_name;
	}

	public String getP_category_code() {
		return p_category_code;
	}

	public void setP_category_code(String p_category_code) {
		this.p_category_code = p_category_code;
	}

	public String getP_category_name() {
		return p_category_name;
	}

	public void setP_category_name(String p_category_name) {
		this.p_category_name = p_category_name;
	}

	@Override
	public String toString() {
		return "ProductCategory [p_category_code=" + p_category_code + ", p_category_name=" + p_category_name + "]";
	}
	
	
	
	
}
