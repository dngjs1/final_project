package com.notnull.shop.product.model.vo;

import java.sql.Date;

public class BuyInfo {
	private int buy_code;
	private int product_option_code;
	private int buy_quantity;
	private String member_id;
	private String receiver_post_no;
	private String receiver_d_address;
	private String receiver_name;
	private String phone2;
	private String request;
	private Date buy_date;
	
	public BuyInfo() {
		// TODO Auto-generated constructor stub
	}

	public BuyInfo(int buy_code, int product_option_code, int buy_quantity, String member_id, String receiver_post_no,
			String receiver_d_address, String receiver_name, String phone2, String request, Date buy_date) {
		super();
		this.buy_code = buy_code;
		this.product_option_code = product_option_code;
		this.buy_quantity = buy_quantity;
		this.member_id = member_id;
		this.receiver_post_no = receiver_post_no;
		this.receiver_d_address = receiver_d_address;
		this.receiver_name = receiver_name;
		this.phone2 = phone2;
		this.request = request;
		this.buy_date = buy_date;
	}

	@Override
	public String toString() {
		return "BuyInfo [buy_code=" + buy_code + ", product_option_code=" + product_option_code + ", buy_quantity="
				+ buy_quantity + ", member_id=" + member_id + ", receiver_post_no=" + receiver_post_no
				+ ", receiver_d_address=" + receiver_d_address + ", receiver_name=" + receiver_name + ", phone2="
				+ phone2 + ", request=" + request + ", buy_date=" + buy_date + "]";
	}

	public int getBuy_code() {
		return buy_code;
	}

	public void setBuy_code(int buy_code) {
		this.buy_code = buy_code;
	}

	public int getProduct_option_code() {
		return product_option_code;
	}

	public void setProduct_option_code(int product_option_code) {
		this.product_option_code = product_option_code;
	}

	public int getBuy_quantity() {
		return buy_quantity;
	}

	public void setBuy_quantity(int buy_quantity) {
		this.buy_quantity = buy_quantity;
	}

	public String getMember_id() {
		return member_id;
	}

	public void setMember_id(String member_id) {
		this.member_id = member_id;
	}

	public String getReceiver_post_no() {
		return receiver_post_no;
	}

	public void setReceiver_post_no(String receiver_post_no) {
		this.receiver_post_no = receiver_post_no;
	}

	public String getReceiver_d_address() {
		return receiver_d_address;
	}

	public void setReceiver_d_address(String receiver_d_address) {
		this.receiver_d_address = receiver_d_address;
	}

	public String getReceiver_name() {
		return receiver_name;
	}

	public void setReceiver_name(String receiver_name) {
		this.receiver_name = receiver_name;
	}

	public String getPhone2() {
		return phone2;
	}

	public void setPhone2(String phone2) {
		this.phone2 = phone2;
	}

	public String getRequest() {
		return request;
	}

	public void setRequest(String request) {
		this.request = request;
	}

	public Date getBuy_date() {
		return buy_date;
	}

	public void setBuy_date(Date buy_date) {
		this.buy_date = buy_date;
	}
}
