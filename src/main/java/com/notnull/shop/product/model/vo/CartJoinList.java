package com.notnull.shop.product.model.vo;

public class CartJoinList {
	private int cart_code;
	private int product_code;
	private String product_name;
	private int cart_quantity;
	private int product_option_code;
	private String option_size;
	private int left_amount;
	private String new_p_img_path;
	private int price;
	private String product_delete;
	
	public CartJoinList() {}

	public CartJoinList(int cart_code, int product_code, String product_name, int cart_quantity,
			int product_option_code, String option_size, int left_amount, String new_p_img_path, int price,
			String product_delete) {
		super();
		this.cart_code = cart_code;
		this.product_code = product_code;
		this.product_name = product_name;
		this.cart_quantity = cart_quantity;
		this.product_option_code = product_option_code;
		this.option_size = option_size;
		this.left_amount = left_amount;
		this.new_p_img_path = new_p_img_path;
		this.price = price;
		this.product_delete = product_delete;
	}

	@Override
	public String toString() {
		return "CartJoinList [cart_code=" + cart_code + ", product_code=" + product_code + ", product_name="
				+ product_name + ", cart_quantity=" + cart_quantity + ", product_option_code=" + product_option_code
				+ ", option_size=" + option_size + ", left_amount=" + left_amount + ", new_p_img_path=" + new_p_img_path
				+ ", price=" + price + ", product_delete=" + product_delete + "]";
	}

	public int getCart_code() {
		return cart_code;
	}

	public void setCart_code(int cart_code) {
		this.cart_code = cart_code;
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

	public String getProduct_delete() {
		return product_delete;
	}

	public void setProduct_delete(String product_delete) {
		this.product_delete = product_delete;
	}

}
