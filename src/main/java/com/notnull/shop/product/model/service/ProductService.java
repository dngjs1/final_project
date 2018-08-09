package com.notnull.shop.product.model.service;

import java.util.List;

import com.notnull.shop.product.model.vo.Cart;
import com.notnull.shop.product.model.vo.CartJoinList;
import com.notnull.shop.product.model.vo.Product;
import com.notnull.shop.product.model.vo.ProductCategory;
import com.notnull.shop.product.model.vo.ProductDetailImg;
import com.notnull.shop.product.model.vo.ProductImg;
import com.notnull.shop.product.model.vo.ProductJoinCategory;
import com.notnull.shop.product.model.vo.ProductListJoin;
import com.notnull.shop.product.model.vo.ProductOption;
import com.notnull.shop.product.model.vo.ProductReview;

public interface ProductService {

	List<ProductListJoin> selectProductList();
	
	int insertProduct(Product product,List<ProductImg> productImgList,List<ProductDetailImg> productDetailImgList,List<ProductOption> productOptionList);
	
	List<ProductCategory> selectCategoryList();
	
	ProductJoinCategory selectProduct(int productCode);
	
	List<ProductOption> selectOption(int productCode);
	
	List<ProductReview> selectReview();
	
	int insertCart(Cart cart);
	
	List<CartJoinList> selectCartList(String member_id);
}
