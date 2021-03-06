package com.notnull.shop.product.model.dao;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.RowBounds;
import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.stereotype.Repository;

import com.notnull.shop.member.model.vo.PointLog;
import com.notnull.shop.product.model.vo.BuyInfo;
import com.notnull.shop.product.model.vo.Cart;
import com.notnull.shop.product.model.vo.CartJoinList;
import com.notnull.shop.product.model.vo.Product;
import com.notnull.shop.product.model.vo.ProductCategory;
import com.notnull.shop.product.model.vo.ProductDetailImg;
import com.notnull.shop.product.model.vo.ProductImg;
import com.notnull.shop.product.model.vo.ProductJoinCategory;
import com.notnull.shop.product.model.vo.ProductJoinOption;
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
	public List<ProductListJoin> selectProductList(SqlSessionTemplate sqlSession,int cPage,int numPerPage) {
		
		RowBounds rb=new RowBounds((cPage-1)*numPerPage,numPerPage);
		
		return sqlSession.selectList("product.selectProductList",null,rb);
	}
	
	
	@Override
	public int productListCount(SqlSessionTemplate sqlSession) {
		return sqlSession.selectOne("product.productListCount");
	}

	
	@Override
	public List<ProductListJoin> searchProduct(SqlSessionTemplate sqlSession, String searchName) {
		return sqlSession.selectList("product.searchProduct",searchName);
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
	public int updateProduct(SqlSessionTemplate sqlSession, Product product) {
		return sqlSession.update("product.updateProduct",product);
	}

	@Override
	public int updateImgList(SqlSessionTemplate sqlSession, ProductImg productImg) {
		return sqlSession.update("product.updateImgList",productImg);
	}

	@Override
	public int updateDetail(SqlSessionTemplate sqlSession, ProductDetailImg productDetailImg) {
		return sqlSession.update("product.updateDetail",productDetailImg);
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
	public int selectProductReviewCount(SqlSessionTemplate sqlSession, int product_code) {
		return sqlSession.selectOne("product.selectProductReviewCount",product_code);
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
	public List<ProductListJoin> reviewStarOrder(SqlSessionTemplate sqlSession,int cPage,int numPerPage) {
		RowBounds rb=new RowBounds((cPage-1)*numPerPage,numPerPage);
		return sqlSession.selectList("product.reviewStarOrder",null,rb);
	}
	
	
	@Override
	public List<ProductListJoin> highPriceOrder(SqlSessionTemplate sqlSession,int cPage,int numPerPage) {
		RowBounds rb=new RowBounds((cPage-1)*numPerPage,numPerPage);
		return sqlSession.selectList("product.highPriceOrder",null,rb);
	}

	@Override
	public List<ProductListJoin> lowPriceOrder(SqlSessionTemplate sqlSession,int cPage,int numPerPage) {
		RowBounds rb=new RowBounds((cPage-1)*numPerPage,numPerPage);
		return sqlSession.selectList("product.lowPriceOrder",null,rb);
	}

	@Override
	public List<ProductListJoin> writeDateOrder(SqlSessionTemplate sqlSession,int cPage,int numPerPage) {
		RowBounds rb=new RowBounds((cPage-1)*numPerPage,numPerPage);
		return sqlSession.selectList("product.writeDateOrder",null,rb);
	}
	
	@Override
	public List<ProductListJoin> categorySort(SqlSessionTemplate sqlSession,String p_category_name, int cPage, int numPerPage) {
		RowBounds rb=new RowBounds((cPage-1)*numPerPage,numPerPage);
		return sqlSession.selectList("product.categorySort",p_category_name,rb);
	}
	
	@Override
	public List<ProductListJoin> categorySort(SqlSessionTemplate sqlSession,String p_category_name) {
		return sqlSession.selectList("product.categorySort",p_category_name);
	}

	@Override
	public int categorySortCount(SqlSessionTemplate sqlSession, String p_category_name) {
		return sqlSession.selectOne("product.categorySortCount",p_category_name);
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
	public List<CartJoinList> selectCartList(SqlSessionTemplate sqlSession, String[] cart_codes) {
		return sqlSession.selectList("product.selectCartList2",cart_codes);
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
	public int deleteSelectCart(SqlSessionTemplate sqlSession, String[] cart_codes) {
		return sqlSession.delete("product.deleteSelectCart",cart_codes);
	}

	@Override
	public ProductJoinOption selectProductJoinOption(SqlSessionTemplate sqlSession, int product_option_code) {
		return sqlSession.selectOne("product.selectProductJoinOption",product_option_code);
	}
	
	@Override
	public int insertBuy(SqlSessionTemplate sqlSession, BuyInfo buy) {
		return sqlSession.insert("product.insertBuy",buy);
	}

	@Override
	public int insertPoint(SqlSessionTemplate sqlSession, PointLog pointLog) {
		return sqlSession.insert("product.insertPoint",pointLog);
	}
	
	@Override
	public int selectPoint(SqlSessionTemplate sqlSession, String member_id) {
		return sqlSession.selectOne("product.selectPoint",member_id);
	}
	
	@Override
	public int updateLeftList(SqlSessionTemplate sqlSession, BuyInfo buy) {
		return sqlSession.update("product.updateLeftList",buy);
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

	@Override
	public String checkLike(SqlSessionTemplate sqlSession, Map map) {
		return sqlSession.selectOne("product.checkLike",map);
	}

	@Override
	public int deleteProduct(SqlSessionTemplate sqlSession, int product_code) {
		return sqlSession.update("product.deleteProduct",product_code);
	}

	@Override
	public int deleteOption(SqlSessionTemplate sqlSession, int product_code) {
		return sqlSession.delete("product.deleteOption",product_code);
	}


	@Override
	public int deleteReview(SqlSessionTemplate sqlSession, int review_code) {
		return sqlSession.delete("product.deleteReview",review_code);
	}
	
	
}
