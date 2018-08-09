package com.notnull.shop.product.model.vo;

import java.sql.Date;

public class Cart {
	private int cart_code;
	private int product_code;
	private int cart_quantity;
	private String member_id;
	private Date cart_date;
	private int product_option_code;
	
	public Cart() {}

	public Cart(int cart_code, int product_code, int cart_quantity, String member_id, Date cart_date,
			int product_option_code) {
		super();
		this.cart_code = cart_code;
		this.product_code = product_code;
		this.cart_quantity = cart_quantity;
		this.member_id = member_id;
		this.cart_date = cart_date;
		this.product_option_code = product_option_code;
	}

	@Override
	public String toString() {
		return "Cart [cart_code=" + cart_code + ", product_code=" + product_code + ", cart_quantity=" + cart_quantity
				+ ", member_id=" + member_id + ", cart_date=" + cart_date + ", product_option_code="
				+ product_option_code + "]";
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

	public int getCart_quantity() {
		return cart_quantity;
	}

	public void setCart_quantity(int cart_quantity) {
		this.cart_quantity = cart_quantity;
	}

	public String getMember_id() {
		return member_id;
	}

	public void setMember_id(String member_id) {
		this.member_id = member_id;
	}

	public Date getCart_date() {
		return cart_date;
	}

	public void setCart_date(Date cart_date) {
		this.cart_date = cart_date;
	}

	public int getProduct_option_code() {
		return product_option_code;
	}

	public void setProduct_option_code(int product_option_code) {
		this.product_option_code = product_option_code;
	}

	
}
