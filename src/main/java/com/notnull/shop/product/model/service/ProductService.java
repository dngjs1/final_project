package com.notnull.shop.product.model.service;

import java.util.List;
import java.util.Map;

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

public interface ProductService {

	List<ProductListJoin> selectProductList();
	
	List<ProductListJoin> reviewStarOrder();
	
	List<ProductListJoin> highPriceOrder();
	
	List<ProductListJoin> lowPriceOrder();
	
	List<ProductListJoin> writeDateOrder();
	
	int insertProduct(Product product,List<ProductImg> productImgList,List<ProductDetailImg> productDetailImgList,List<ProductOption> productOptionList);
	
	List<ProductCategory> selectCategoryList();
	
	ProductJoinCategory selectProduct(int productCode);
	
	List<ProductOption> selectOption(int productCode);
	
	int insertCart(Cart cart);
	
	List<CartJoinList> selectCartList(String member_id);
	
	int plusCart(Cart cart);

	int changeCart(Cart cart);
	
	int deleteCart(int cart_code);
	
	List<ProductReview> selectReview(int productCode);
	
	int reviewInsert(ProductReview productReview,List<ProductReviewImg> productReviewImgList);
	
	List<ProductReviewImgJoin> selectReviewImg(int productCode);
	
	List<ProductDetailImg> selectDetailImg(int productCode);
	
	List<ProductImg> selectImgList(int productCode);
	
	int addQuestion(ProductQuestion productQuestion);
	
	int deleteQuestion(int p_question_code);
	
	List<ProductQuestion> selectQuestion(int productCode);
	
	int addLike(ProductReviewLike productReviewLike);
	
	ProductReviewLike selectLike(int review_code);
	
	int deleteLike(ProductReviewLike productReviewLike);
	
	int updateLike(ProductReviewLike productReviewLike);
	
	List<ProductReviewLike> selectLikeList();
		
}
