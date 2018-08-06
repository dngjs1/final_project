package com.notnull.shop.product.model.dao;

import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;

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


public interface ProductDAO {
	List<ProductListJoin> selectProductList(SqlSessionTemplate sqlSession);
	
	int insertProduct(SqlSessionTemplate sqlSession,Product product);


	int insertImgList(SqlSessionTemplate sqlSession,ProductImg productImg);
	
	int insertDetail(SqlSessionTemplate sqlSession,ProductDetailImg productDetailImg);
	
	int insertOption(SqlSessionTemplate sqlSession,ProductOption productOption);
	
	List<ProductCategory> selectCategoryList(SqlSessionTemplate sqlSession);
	
	ProductJoinCategory selectProduct(SqlSessionTemplate sqlSession,String productCode);
	
	List<ProductOption> selectOption(SqlSessionTemplate sqlSession,String productCode);
	
	List<ProductReview> selectReview(SqlSessionTemplate sqlSession,String productCode);
	
	int reviewInsert(SqlSessionTemplate sqlSession,ProductReview productReview);
	
	int insertReviewImg(SqlSessionTemplate sqlSession,ProductReviewImg productReviewImg);
	
	List<ProductReviewImgJoin> selectReviewImg(SqlSessionTemplate sqlSession,String productCode);
}
