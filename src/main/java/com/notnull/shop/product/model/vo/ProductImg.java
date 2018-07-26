package com.notnull.shop.product.model.vo;

public class ProductImg {
	private int p_img_code;
	private String p_img_path;
	private String new_p_img_path;
	private int product_code;
	
	public ProductImg() {}

	public ProductImg(int p_img_code, String p_img_path, String new_p_img_path, int product_code) {
		super();
		this.p_img_code = p_img_code;
		this.p_img_path = p_img_path;
		this.new_p_img_path = new_p_img_path;
		this.product_code = product_code;
	}

	public int getP_img_code() {
		return p_img_code;
	}

	public void setP_img_code(int p_img_code) {
		this.p_img_code = p_img_code;
	}

	public String getP_img_path() {
		return p_img_path;
	}

	public void setP_img_path(String p_img_path) {
		this.p_img_path = p_img_path;
	}

	public String getNew_p_img_path() {
		return new_p_img_path;
	}

	public void setNew_p_img_path(String new_p_img_path) {
		this.new_p_img_path = new_p_img_path;
	}

	public int getProduct_code() {
		return product_code;
	}

	public void setProduct_code(int product_code) {
		this.product_code = product_code;
	}

	@Override
	public String toString() {
		return "ProductImg [p_img_code=" + p_img_code + ", p_img_path=" + p_img_path + ", new_p_img_path="
				+ new_p_img_path + ", product_code=" + product_code + "]";
	}

	
	
	
}
