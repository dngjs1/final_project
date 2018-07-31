package com.notnull.shop.product.model.dao;

import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.stereotype.Repository;

import com.notnull.shop.product.model.vo.Product;
import com.notnull.shop.product.model.vo.ProductCategory;
import com.notnull.shop.product.model.vo.ProductDetailImg;
import com.notnull.shop.product.model.vo.ProductImg;
import com.notnull.shop.product.model.vo.ProductListJoin;
import com.notnull.shop.product.model.vo.ProductOption;
@Repository
public class ProductDAOImpl implements ProductDAO {

	@Override
	public List<ProductListJoin> selectProductList(SqlSessionTemplate sqlSession) {
		return sqlSession.selectList("product.selectProductList");
	}

	@Override
	public int insertProduct(SqlSessionTemplate sqlSession, Product product) {
		System.out.println(product);
		
		return sqlSession.insert("product.insertProduct",product);
	}

	@Override
	public int insertImgList(SqlSessionTemplate sqlSession, ProductImg productImg) {
		return sqlSession.insert("product.insertImgList",productImg);
	}

	@Override
	public List<ProductCategory> selectCategoryList(SqlSessionTemplate sqlSession) {
		return sqlSession.selectList("product.selectCategoryList");
	}

	@Override
	public int insertDetail(SqlSessionTemplate sqlSession, ProductDetailImg productDetailImg) {
		return sqlSession.insert("product.insertDetail",productDetailImg);
	}

	@Override
	public int insertOption(SqlSessionTemplate sqlSession, ProductOption productOption) {
		return sqlSession.insert("product.insertOption",productOption);
	}

	

}
