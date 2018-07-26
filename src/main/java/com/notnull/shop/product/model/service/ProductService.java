package com.notnull.shop.product.model.service;

import java.util.List;

import com.notnull.shop.product.model.vo.Product;
import com.notnull.shop.product.model.vo.ProductCategory;
import com.notnull.shop.product.model.vo.ProductImg;
import com.notnull.shop.product.model.vo.ProductListJoin;

public interface ProductService {

	List<ProductListJoin> selectProductList();
	
	
	int insertProduct(Product product,List<ProductImg> productImgList);
	
	List<ProductCategory> selectCategoryList();
}
