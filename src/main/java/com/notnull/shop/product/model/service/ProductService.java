package com.notnull.shop.product.model.service;

import java.util.List;

import com.notnull.shop.product.model.vo.Product;
import com.notnull.shop.product.model.vo.ProductCategory;
import com.notnull.shop.product.model.vo.ProductDetailImg;
import com.notnull.shop.product.model.vo.ProductImg;
import com.notnull.shop.product.model.vo.ProductListJoin;
import com.notnull.shop.product.model.vo.ProductOption;

public interface ProductService {

	List<ProductListJoin> selectProductList();
	
	int insertProduct(Product product,List<ProductImg> productImgList,List<ProductDetailImg> productDetailImgList,List<ProductOption> productOptionList);
	
	List<ProductCategory> selectCategoryList();
	
	Product selectProduct(String productCode);
}
