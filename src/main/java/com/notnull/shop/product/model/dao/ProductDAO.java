package com.notnull.shop.product.model.dao;

import java.util.List;
import java.util.Map;

import org.mybatis.spring.SqlSessionTemplate;

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


public interface ProductDAO {
	List<ProductListJoin> selectProductList(SqlSessionTemplate sqlSession,int cPage,int numPerPage);
	
	List<ProductListJoin> selectProductList(SqlSessionTemplate sqlSession);
	
	int productListCount(SqlSessionTemplate sqlSession);
	
	List<ProductListJoin> searchProduct(SqlSessionTemplate sqlSession,String searchName);
	
	List<ProductListJoin> reviewStarOrder(SqlSessionTemplate sqlSession,int cPage,int numPerPage);
	
	List<ProductListJoin> highPriceOrder(SqlSessionTemplate sqlSession,int cPage,int numPerPage);
	
	List<ProductListJoin> lowPriceOrder(SqlSessionTemplate sqlSession,int cPage,int numPerPage);
	
	List<ProductListJoin> writeDateOrder(SqlSessionTemplate sqlSession,int cPage,int numPerPage);
	
	List<ProductListJoin> categorySort(SqlSessionTemplate sqlSession,String p_category_name,int cPage,int numPerPage);
	
	int categorySortCount(SqlSessionTemplate sqlSession,String p_category_name);
	
	int insertProduct(SqlSessionTemplate sqlSession,Product product);

	int insertImgList(SqlSessionTemplate sqlSession,ProductImg productImg);
	
	int insertDetail(SqlSessionTemplate sqlSession,ProductDetailImg productDetailImg);
	
	int insertOption(SqlSessionTemplate sqlSession,ProductOption productOption);
	
	int updateProduct(SqlSessionTemplate sqlSession, Product product);
	
	int updateImgList(SqlSessionTemplate sqlSession,ProductImg productImg);
	
	int updateDetail(SqlSessionTemplate sqlSession,ProductDetailImg productDetailImg);
	
	List<ProductCategory> selectCategoryList(SqlSessionTemplate sqlSession);
	
	ProductJoinCategory selectProduct(SqlSessionTemplate sqlSession,int productCode);
	
	List<ProductOption> selectOption(SqlSessionTemplate sqlSession,int productCode);
	
	int insertCart(SqlSessionTemplate sqlSession,Cart cart);
	
	List<CartJoinList> selectCartList(SqlSessionTemplate sqlSession,String member_id);
	
	List<CartJoinList> selectCartList(SqlSessionTemplate sqlSession,String[] cart_codes);
	
	int plusCart(SqlSessionTemplate sqlSession,Cart cart);
	
	int changeCart(SqlSessionTemplate sqlSession,Cart cart);
	
	int deleteCart(SqlSessionTemplate sqlSession,int cart_code);

	int deleteSelectCart(SqlSessionTemplate sqlSession,String[] cart_codes);
	
	ProductJoinOption selectProductJoinOption(SqlSessionTemplate sqlSession,int product_option_code);
	
	int insertBuy(SqlSessionTemplate sqlSession,BuyInfo buy);
	
	int insertPoint(SqlSessionTemplate sqlSession,PointLog pointLog);
	
	int selectPoint(SqlSessionTemplate sqlSession,String member_id);
	
	int updateLeftList(SqlSessionTemplate sqlSession,BuyInfo buy);
	
	List<ProductReview> selectReview(SqlSessionTemplate sqlSession,int productCode);
	
	int selectProductReviewCount(SqlSessionTemplate sqlSession,int product_code);
	
	List<ProductDetailImg> selectDetailImg(SqlSessionTemplate sqlSession,int productCode);
	
	List<ProductImg> selectImgList(SqlSessionTemplate sqlSession,int productCode);
	
	int reviewInsert(SqlSessionTemplate sqlSession,ProductReview productReview);
	
	int insertReviewImg(SqlSessionTemplate sqlSession,ProductReviewImg productReviewImg);
	
	List<ProductReviewImgJoin> selectReviewImg(SqlSessionTemplate sqlSession,int productCode);
	
	int addQuestion(SqlSessionTemplate sqlSession,ProductQuestion productQuestion);
	
	int deleteQuestion(SqlSessionTemplate sqlSession,int p_question_code);
	
	List<ProductQuestion> selectQuestion(SqlSessionTemplate sqlSession,int productCode);
	
	int addLike(SqlSessionTemplate sqlSession,ProductReviewLike productReviewLike);
	
	ProductReviewLike selectLike(SqlSessionTemplate sqlSession,int review_code);
	
	int deleteLike(SqlSessionTemplate sqlSession,ProductReviewLike productReviewLike);
	
	int updateLike(SqlSessionTemplate sqlSession,ProductReviewLike productReviewLike);	
	
	List<ProductReviewLike> selectLikeList(SqlSessionTemplate sqlSession);
	
	String checkLike(SqlSessionTemplate sqlSession,Map map);
	
	int deleteProduct(SqlSessionTemplate sqlSession,int product_code);
	
	int deleteOption(SqlSessionTemplate sqlSession,int product_code);
	
	int deleteReview(SqlSessionTemplate sqlSession,int review_code);
	
}
