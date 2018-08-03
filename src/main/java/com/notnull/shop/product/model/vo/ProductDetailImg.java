package com.notnull.shop.product.model.vo;

public class ProductDetailImg {

	private int p_detail_img_code;
	private String p_detail_img_path;
	private String new_p_detail_img_path;
	private int product_code;
	
	public ProductDetailImg() {}

	public ProductDetailImg(int p_detail_img_code, String p_detail_img_path, String new_p_detail_img_path,
			int product_code) {
		super();
		this.p_detail_img_code = p_detail_img_code;
		this.p_detail_img_path = p_detail_img_path;
		this.new_p_detail_img_path = new_p_detail_img_path;
		this.product_code = product_code;
	}

	public int getP_detail_img_code() {
		return p_detail_img_code;
	}

	public void setP_detail_img_code(int p_detail_img_code) {
		this.p_detail_img_code = p_detail_img_code;
	}

	public String getP_detail_img_path() {
		return p_detail_img_path;
	}

	public void setP_detail_img_path(String p_detail_img_path) {
		this.p_detail_img_path = p_detail_img_path;
	}

	public String getNew_p_detail_img_path() {
		return new_p_detail_img_path;
	}

	public void setNew_p_detail_img_path(String new_p_detail_img_path) {
		this.new_p_detail_img_path = new_p_detail_img_path;
	}

	public int getProduct_code() {
		return product_code;
	}

	public void setProduct_code(int product_code) {
		this.product_code = product_code;
	}

	@Override
	public String toString() {
		return "ProductDetailImg [p_detail_img_code=" + p_detail_img_code + ", p_detail_img_path=" + p_detail_img_path
				+ ", new_p_detail_img_path=" + new_p_detail_img_path + ", product_code=" + product_code + "]";
	}
	
	
	
}
