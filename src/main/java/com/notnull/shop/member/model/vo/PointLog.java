package com.notnull.shop.member.model.vo;

import java.sql.Date;

public class PointLog {
	private int point_code;
	private String member_id;
	private int point_increase;
	private Date point_date;
	
	public PointLog() {
		// TODO Auto-generated constructor stub
	}

	public PointLog(int point_code, String member_id, int point_increase, Date point_date) {
		super();
		this.point_code = point_code;
		this.member_id = member_id;
		this.point_increase = point_increase;
		this.point_date = point_date;
	}

	@Override
	public String toString() {
		return "PointLog [point_code=" + point_code + ", member_id=" + member_id + ", point_increase=" + point_increase
				+ ", point_date=" + point_date + "]";
	}

	public int getPoint_code() {
		return point_code;
	}

	public void setPoint_code(int point_code) {
		this.point_code = point_code;
	}

	public String getMember_id() {
		return member_id;
	}

	public void setMember_id(String member_id) {
		this.member_id = member_id;
	}

	public int getPoint_increase() {
		return point_increase;
	}

	public void setPoint_increase(int point_increase) {
		this.point_increase = point_increase;
	}

	public Date getPoint_date() {
		return point_date;
	}

	public void setPoint_date(Date point_date) {
		this.point_date = point_date;
	}

}
