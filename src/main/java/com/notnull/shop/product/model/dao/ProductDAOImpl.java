package com.notnull.shop.product.model.dao;

import java.util.List;
import java.util.Map;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.stereotype.Repository;

import com.notnull.shop.product.model.vo.Cart;
import com.notnull.shop.product.model.vo.CartJoinList;
import com.notnull.shop.product.model.vo.Product;
import com.notnull.shop.product.model.vo.ProductCategory;
import com.notnull.shop.product.model.vo.ProductDetailImg;
import com.notnull.shop.product.model.vo.ProductImg;
import com.notnull.shop.product.model.vo.ProductJoinCategory;
import com.notnull.shop.product.model.vo.ProductListJoin;
import com.notnull.shop.product.model.vo.ProductOption;
import com.notnull.shop.product.model.vo.ProductQuestion;
import com.notnull.shop.product.model.vo.ProductReview;
import com.notnull.shop.product.model.vo.ProductReviewImg;
import com.notnull.shop.product.model.vo.ProductReviewImgJoin;
import com.notnull.shop.product.model.vo.ProductReviewLike;
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
	public ProductJoinCategory selectProduct(SqlSessionTemplate sqlSession, int productCode) {
		return sqlSession.selectOne("product.selectProduct",productCode);
	}

	@Override
	public List<ProductOption> selectOption(SqlSessionTemplate sqlSession, int productCode) {
		return sqlSession.selectList("product.selectOption",productCode);
	}

	@Override
	public List<ProductReview> selectReview(SqlSessionTemplate sqlSession,int productCode) {
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
	public List<ProductReviewImgJoin> selectReviewImg(SqlSessionTemplate sqlSession, int productCode) {
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

	@Override
	public int insertCart(SqlSessionTemplate sqlSession, Cart cart) {
		return sqlSession.insert("product.insertCart",cart);
	}

	@Override
	public List<CartJoinList> selectCartList(SqlSessionTemplate sqlSession, String member_id) {
		return sqlSession.selectList("product.selectCartList",member_id);
	}

	@Override
	public int plusCart(SqlSessionTemplate sqlSession, Cart cart) {
		return sqlSession.update("product.plusCart",cart);
	}

	@Override
	public int changeCart(SqlSessionTemplate sqlSession, Cart cart) {
		return sqlSession.update("product.changeCart",cart);
	}

	@Override
	public int deleteCart(SqlSessionTemplate sqlSession, int cart_code) {
		return sqlSession.delete("product.deleteCart",cart_code);
	}
	
	@Override
	public int addQuestion(SqlSessionTemplate sqlSession, ProductQuestion productQuestion) {
		return sqlSession.insert("product.addQuestion",productQuestion);
	}

	@Override
	public int deleteQuestion(SqlSessionTemplate sqlSession, int p_question_code) {
		return sqlSession.delete("product.deleteQuestion",p_question_code);
	}

	
	@Override
	public List<ProductQuestion> selectQuestion(SqlSessionTemplate sqlSession, int productCode) {
		return sqlSession.selectList("product.selectQuestion",productCode);
	}

	@Override
	public List<ProductDetailImg> selectDetailImg(SqlSessionTemplate sqlSession, int productCode) {
		return sqlSession.selectList("product.selectDetailImg",productCode);
	}

	@Override
	public List<ProductImg> selectImgList(SqlSessionTemplate sqlSession, int productCode) {
		return sqlSession.selectList("product.selectImgList",productCode);
	}

	@Override
	public int addLike(SqlSessionTemplate sqlSession, ProductReviewLike productReviewLike) {
		return sqlSession.insert("product.addLike",productReviewLike);
	}

	@Override
	public ProductReviewLike selectLike(SqlSessionTemplate sqlSession, int review_code) {
		return sqlSession.selectOne("product.selectLike",review_code);
	}

	@Override
	public int deleteLike(SqlSessionTemplate sqlSession, ProductReviewLike productReviewLike) {
		return sqlSession.delete("product.deleteLike",productReviewLike);
	}

	@Override
	public int updateLike(SqlSessionTemplate sqlSession, ProductReviewLike productReviewLike) {
		return sqlSession.update("product.updateLike",productReviewLike);
	}

	@Override
	public List<ProductReviewLike> selectLikeList(SqlSessionTemplate sqlSession) {
		return sqlSession.selectList("product.selectLikeList");
	}


	
}
