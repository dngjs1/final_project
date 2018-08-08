package com.notnull.shop.product.model.dao;

import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.stereotype.Repository;

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
@Repository
public class ProductDAOImpl implements ProductDAO {

	@Override
	public List<ProductListJoin> selectProductList(SqlSessionTemplate sqlSession) {
		return sqlSession.selectList("product.selectProductList");
	}

	@Override
	public int insertProduct(SqlSessionTemplate sqlSession, Product product) {
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

	@Override
	public ProductJoinCategory selectProduct(SqlSessionTemplate sqlSession, String productCode) {
		return sqlSession.selectOne("product.selectProduct",productCode);
	}

	@Override
	public List<ProductOption> selectOption(SqlSessionTemplate sqlSession, String productCode) {
		return sqlSession.selectList("product.selectOption",productCode);
	}

	@Override
	public List<ProductReview> selectReview(SqlSessionTemplate sqlSession,String productCode) {
		return sqlSession.selectList("product.selectReview",productCode);
	}

	@Override
	public int reviewInsert(SqlSessionTemplate sqlSession, ProductReview productReview) {
		return sqlSession.insert("product.reviewInsert",productReview);
	}

	@Override
	public int insertReviewImg(SqlSessionTemplate sqlSession, ProductReviewImg productReviewImg) {
		return sqlSession.insert("product.insertReviewImg",productReviewImg);
	}

	@Override
	public List<ProductReviewImgJoin> selectReviewImg(SqlSessionTemplate sqlSession, String productCode) {
		return sqlSession.selectList("product.selectReviewImg",productCode);
	}

	@Override
	public List<ProductListJoin> reviewStarOrder(SqlSessionTemplate sqlSession) {
		return sqlSession.selectList("product.reviewStarOrder");
	}

	@Override
	public List<ProductListJoin> highPriceOrder(SqlSessionTemplate sqlSession) {
		return sqlSession.selectList("product.highPriceOrder");
	}

	@Override
	public List<ProductListJoin> lowPriceOrder(SqlSessionTemplate sqlSession) {
		return sqlSession.selectList("product.lowPriceOrder");
	}

	@Override
	public List<ProductListJoin> writeDateOrder(SqlSessionTemplate sqlSession) {
		return sqlSession.selectList("product.writeDateOrder");
	}
	
	
}
