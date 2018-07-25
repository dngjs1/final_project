package com.notnull.shop.member.model.vo;

import java.sql.Date;

public class Member {

	private String member_id;
	private String member_pw;
	private String member_name;
	private Date birthday;
	private String gender;
	private String phone;
	private String post_no;
	private String address;
	private String detail_address;
	private String email;
	private String email_alarm;
	private String member_level;
	private Date join_date;
	private String esc_status;
	
	
	public Member() {
		
	}


	public Member(String member_id, String member_pw, String member_name, Date birthday, String gender, String phone,
			String post_no, String address, String detail_address, String email, String email_alarm,
			String member_level, Date join_date, String esc_status) {
		super();
		this.member_id = member_id;
		this.member_pw = member_pw;
		this.member_name = member_name;
		this.birthday = birthday;
		this.gender = gender;
		this.phone = phone;
		this.post_no = post_no;
		this.address = address;
		this.detail_address = detail_address;
		this.email = email;
		this.email_alarm = email_alarm;
		this.member_level = member_level;
		this.join_date = join_date;
		this.esc_status = esc_status;
	}


	public String getMember_id() {
		return member_id;
	}


	public void setMember_id(String member_id) {
		this.member_id = member_id;
	}


	public String getMember_pw() {
		return member_pw;
	}


	public void setMember_pw(String member_pw) {
		this.member_pw = member_pw;
	}


	public String getMember_name() {
		return member_name;
	}


	public void setMember_name(String member_name) {
		this.member_name = member_name;
	}


	public Date getBirthday() {
		return birthday;
	}


	public void setBirthday(Date birthday) {
		this.birthday = birthday;
	}


	public String getGender() {
		return gender;
	}


	public void setGender(String gender) {
		this.gender = gender;
	}


	public String getPhone() {
		return phone;
	}


	public void setPhone(String phone) {
		this.phone = phone;
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


	public String getEmail() {
		return email;
	}


	public void setEmail(String email) {
		this.email = email;
	}


	public String getEmail_alarm() {
		return email_alarm;
	}


	public void setEmail_alarm(String email_alarm) {
		this.email_alarm = email_alarm;
	}


	public String getMember_level() {
		return member_level;
	}


	public void setMember_level(String member_level) {
		this.member_level = member_level;
	}


	public Date getJoin_date() {
		return join_date;
	}


	public void setJoin_date(Date join_date) {
		this.join_date = join_date;
	}


	public String getEsc_status() {
		return esc_status;
	}


	public void setEsc_status(String esc_status) {
		this.esc_status = esc_status;
	}


	@Override
	public String toString() {
		return "Member [member_id=" + member_id + ", member_pw=" + member_pw + ", member_name=" + member_name
				+ ", birthday=" + birthday + ", gender=" + gender + ", phone=" + phone + ", post_no=" + post_no
				+ ", address=" + address + ", detail_address=" + detail_address + ", email=" + email + ", email_alarm="
				+ email_alarm + ", member_level=" + member_level + ", join_date=" + join_date + ", esc_status="
				+ esc_status + "]";
	}
	
	

	
}
