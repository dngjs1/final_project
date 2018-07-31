package com.notnull.shop.product.model.dao;

import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;

import com.notnull.shop.product.model.vo.Product;

import com.notnull.shop.product.model.vo.ProductCategory;
import com.notnull.shop.product.model.vo.ProductDetailImg;
import com.notnull.shop.product.model.vo.ProductImg;
import com.notnull.shop.product.model.vo.ProductListJoin;


public interface ProductDAO {
	List<ProductListJoin> selectProductList(SqlSessionTemplate sqlSession);
	
	int insertProduct(SqlSessionTemplate sqlSession,Product product);


	int insertImgList(SqlSessionTemplate sqlSession,ProductImg productImg);
	
	int insertDetail(SqlSessionTemplate sqlSession,ProductDetailImg productDetailImg);
	
	List<ProductCategory> selectCategoryList(SqlSessionTemplate sqlSession);
}
