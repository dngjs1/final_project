package com.notnull.shop.product.model.service;

import java.util.List;
import java.util.Map;

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

public interface ProductService {

	List<ProductListJoin> selectProductList(int cPage,int numPerPage);
	
	int productListCount();
	
	List<ProductListJoin> searchProduct(String searchName);
	
	List<ProductListJoin> reviewStarOrder(int cPage,int numPerPage);
	
	List<ProductListJoin> highPriceOrder(int cPage,int numPerPage);
	
	List<ProductListJoin> lowPriceOrder(int cPage,int numPerPage);
	
	List<ProductListJoin> writeDateOrder(int cPage,int numPerPage);
	
	List<ProductListJoin> categorySort(String p_category_name,int cPage,int numPerPage);
	
	List<ProductListJoin> categorySort(String p_category_name);
	
	int categorySortCount(String p_category_name);
	
	int insertProduct(Product product,List<ProductImg> productImgList,List<ProductDetailImg> productDetailImgList,List<ProductOption> productOptionList);
	
	int updateProduct(Product product,List<ProductImg> productImgList,List<ProductDetailImg> productDetailImgList,List<ProductOption> productOptionList);
	
	List<ProductCategory> selectCategoryList();
		
	ProductJoinCategory selectProduct(int productCode);
	
	List<ProductOption> selectOption(int productCode);
	
	List<ProductReviewImgJoin> selectReviewImg(int productCode);
	
	List<ProductDetailImg> selectDetailImg(int productCode);
	
	List<ProductImg> selectImgList(int productCode);
	
	int insertCart(Cart cart);
	
	List<CartJoinList> selectCartList(String member_id);
	
	List<CartJoinList> selectCartList(String[] cart_codes);
	
	int plusCart(Cart cart);

	int changeCart(Cart cart);
	
	int deleteCart(int cart_code);
	
	int deleteSelectCart(String[] cart_codes);
	
	ProductJoinOption selectProductJoinOption(int product_option_code);
	
	int insertBuyList(List<BuyInfo> buyList);
	
	int insertPoint(PointLog pointLog);
	
	int selectPoint(String member_id);
	
	int updateLeftList(List<BuyInfo> buyList);
	
	List<ProductReview> selectReview(int productCode);
	
	int selectProductReviewCount(int product_code);
	
	int reviewInsert(ProductReview productReview,List<ProductReviewImg> productReviewImgList);
	
	int addQuestion(ProductQuestion productQuestion);
	
	int deleteQuestion(int p_question_code);
	
	List<ProductQuestion> selectQuestion(int productCode);
	
	int addLike(ProductReviewLike productReviewLike);
	
	ProductReviewLike selectLike(int review_code);
	
	int deleteLike(ProductReviewLike productReviewLike);
	
	int updateLike(ProductReviewLike productReviewLike);
	
	List<ProductReviewLike> selectLikeList();
	
	String checkLike(Map map);
	
	int deleteProduct(int product_code);
	
	int deleteReview(int review_code);
}
