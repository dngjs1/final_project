package com.notnull.shop.product.model.service;

import java.util.List;

import com.notnull.shop.product.model.vo.Product;
import com.notnull.shop.product.model.vo.ProductCategory;
import com.notnull.shop.product.model.vo.ProductDetailImg;
import com.notnull.shop.product.model.vo.ProductImg;
import com.notnull.shop.product.model.vo.ProductJoinCategory;
import com.notnull.shop.product.model.vo.ProductListJoin;
import com.notnull.shop.product.model.vo.ProductOption;
import com.notnull.shop.product.model.vo.ProductReview;
import com.notnull.shop.product.model.vo.ProductReviewImg;
import com.notnull.shop.product.model.vo.ProductReviewImgJoin;

public interface ProductService {

	List<ProductListJoin> selectProductList();
	
	List<ProductListJoin> reviewStarOrder();
	
	List<ProductListJoin> highPriceOrder();
	
	List<ProductListJoin> lowPriceOrder();
	
	List<ProductListJoin> writeDateOrder();
	
	int insertProduct(Product product,List<ProductImg> productImgList,List<ProductDetailImg> productDetailImgList,List<ProductOption> productOptionList);
	
	List<ProductCategory> selectCategoryList();
	
	ProductJoinCategory selectProduct(String productCode);
	
	List<ProductOption> selectOption(String productCode);
	
	List<ProductReview> selectReview(String productCode);
	
	int reviewInsert(ProductReview productReview,List<ProductReviewImg> productReviewImgList);
	
	List<ProductReviewImgJoin> selectReviewImg(String productCode);
	
	
}
