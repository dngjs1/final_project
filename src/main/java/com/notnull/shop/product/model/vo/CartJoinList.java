package com.notnull.shop.product.model.vo;

public class CartJoinList {
	private int product_code;
	private String product_name;
	private int cart_quantity;
	private String option_size;
	private String new_p_img_path;
	private int price;
	
	public CartJoinList() {}
	
	public CartJoinList(int product_code, String product_name, int cart_quantity, String option_size,
			String new_p_img_path, int price) {
		super();
		this.product_code = product_code;
		this.product_name = product_name;
		this.cart_quantity = cart_quantity;
		this.option_size = option_size;
		this.new_p_img_path = new_p_img_path;
		this.price = price;
	}

	@Override
	public String toString() {
		return "CartJoinList [product_code=" + product_code + ", product_name=" + product_name + ", cart_quantity="
				+ cart_quantity + ", option_size=" + option_size + ", new_p_img_path=" + new_p_img_path + ", price="
				+ price + "]";
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

	public int getCart_quantity() {
		return cart_quantity;
	}

	public void setCart_quantity(int cart_quantity) {
		this.cart_quantity = cart_quantity;
	}

	public String getOption_size() {
		return option_size;
	}

	public void setOption_size(String option_size) {
		this.option_size = option_size;
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
	
	
}
