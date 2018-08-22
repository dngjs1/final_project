package com.notnull.shop.rental.model.vo;


public class Rental {
	
	private int rental_obj_code;
	private String p_category_code;
	private String title;
	private String content;
	private String member_id;
	private int price;
	private String post_no;
	private String address;
	private String detail_address;
	private String phone;
	private String start_date;
	private String end_date;
	private String p_category_name;
	
	
	
	public String getP_category_name() {
		return p_category_name;
	}

	public void setP_category_name(String p_category_name) {
		this.p_category_name = p_category_name;
	}

	private String imgUrl;

	public int getRental_obj_code() {
		return rental_obj_code;
	}

	public void setRental_obj_code(int rental_obj_code) {
		this.rental_obj_code = rental_obj_code;
	}

	public String getP_category_code() {
		return p_category_code;
	}

	public void setP_category_code(String p_category_code) {
		this.p_category_code = p_category_code;
	}

	public String getTitle() {
		return title;
	}

	public void setTitle(String title) {
		this.title = title;
	}

	public String getContent() {
		return content;
	}

	public void setContent(String content) {
		this.content = content;
	}

	public String getMember_id() {
		return member_id;
	}

	public void setMember_id(String member_id) {
		this.member_id = member_id;
	}

	public int getPrice() {
		return price;
	}

	public void setPrice(int price) {
		this.price = price;
	}

	public String getPost_no() {
		return post_no;
	}

	public void setPost_no(String post_no) {
		this.post_no = post_no;
	}

	public String getAddress() {
		return address;
	}

	public void setAddress(String address) {
		this.address = address;
	}

	public String getDetail_address() {
		return detail_address;
	}

	public void setDetail_address(String detail_address) {
		this.detail_address = detail_address;
	}

	public String getPhone() {
		return phone;
	}

	public void setPhone(String phone) {
		this.phone = phone;
	}

	public String getStart_date() {
		return start_date;
	}

	public void setStart_date(String start_date) {
		this.start_date = start_date;
	}

	public String getEnd_date() {
		return end_date;
	}

	public void setEnd_date(String end_date) {
		this.end_date = end_date;
	}

	public String getImgUrl() {
		return imgUrl;
	}

	public void setImgUrl(String imgUrl) {
		this.imgUrl = imgUrl;
	}

	@Override
	public String toString() {
		return "Rental [rental_obj_code=" + rental_obj_code + ", p_category_code=" + p_category_code + ", title="
				+ title + ", content=" + content + ", member_id=" + member_id + ", price=" + price + ", post_no="
				+ post_no + ", address=" + address + ", detail_address=" + detail_address + ", phone=" + phone
				+ ", start_date=" + start_date + ", end_date=" + end_date + ", imgUrl=" + imgUrl + "]";
	}

	
}
