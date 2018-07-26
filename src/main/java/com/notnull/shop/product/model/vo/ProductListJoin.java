package com.notnull.shop.product.model.vo;

public class ProductListJoin {

	private int product_code;
	private String product_name;
	private String new_p_img_path;
	private int price;
	
	public ProductListJoin() {}

	public ProductListJoin(int product_code, String product_name, String new_p_img_path, int price) {
		super();
		this.product_code = product_code;
		this.product_name = product_name;
		this.new_p_img_path = new_p_img_path;
		this.price = price;
	}

	public int getProduct_code() {
		return product_code;
	}

	public void setProduct_code(int product_code) {
		this.product_code = product_code;
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

	@Override
	public String toString() {
		return "ProductListJoin [product_code=" + product_code + ", product_name=" + product_name + ", new_p_img_path="
				+ new_p_img_path + ", price=" + price + "]";
	}

	
	
	
	
}
