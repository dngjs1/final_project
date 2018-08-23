package com.notnull.shop.rental.model.vo;

public class RentalPerson {

	private int rental_code;
	private int rental_obj_code;
	private String member_id;
	private String start_date;
	private String end_date;
	public int getRental_code() {
		return rental_code;
	}
	public void setRental_code(int rental_code) {
		this.rental_code = rental_code;
	}
	public int getRental_obj_code() {
		return rental_obj_code;
	}
	public void setRental_obj_code(int rental_obj_code) {
		this.rental_obj_code = rental_obj_code;
	}
	public String getMember_id() {
		return member_id;
	}
	public void setMember_id(String member_id) {
		this.member_id = member_id;
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
	@Override
	public String toString() {
		return "RentalPerson [rental_code=" + rental_code + ", rental_obj_code=" + rental_obj_code + ", member_id="
				+ member_id + ", start_date=" + start_date + ", end_date=" + end_date + "]";
	}
	
	
}
