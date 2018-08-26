package com.notnull.shop.product.model.service;

import java.util.List;
import java.util.Map;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.notnull.shop.member.model.vo.PointLog;
import com.notnull.shop.product.model.dao.ProductDAO;
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

@Service
public class ProductServiceImpl implements ProductService {

	@Autowired
	private ProductDAO productDAO;
	
	@Autowired
	SqlSessionTemplate sqlSession;

	@Override
	public List<ProductListJoin> selectProductList(int cPage,int numPerPage) {
		return productDAO.selectProductList(sqlSession,cPage,numPerPage);
	}
	
	@Override
	public List<ProductListJoin> selectProductList() {
		return productDAO.selectProductList(sqlSession);
	}
	
	@Override
	public int productListCount() {
		return productDAO.productListCount(sqlSession);
	}

	@Override
	public List<ProductListJoin> searchProduct(String searchName) {
		return productDAO.searchProduct(sqlSession,searchName);
	}


	@Override
	public int insertProduct(Product product, List<ProductImg> productImgList,List<ProductDetailImg> productDetailImgList,List<ProductOption> productOptionList) {

		int result=0;
		int product_code=0;
		
		try
		{
			result=productDAO.insertProduct(sqlSession,product);
			product_code=product.getProduct_code();
			if(productImgList.size()>0)
			{
				for(ProductImg productImg : productImgList)
				{
					productImg.setProduct_code(product_code);
					result=productDAO.insertImgList(sqlSession,productImg);
				}
				
			}
			if(productDetailImgList.size()>0)
			{
				for(ProductDetailImg productDetailImg : productDetailImgList)
				{
					productDetailImg.setProduct_code(product_code);
					result=productDAO.insertDetail(sqlSession,productDetailImg);
				}
			}
			if(productOptionList.size()>0)
			{
				for(ProductOption productOption : productOptionList)
				{
					productOption.setProduct_code(product_code);
					result=productDAO.insertOption(sqlSession,productOption);
				}
			}
		}
		catch(Exception e)
		{
			e.printStackTrace();
			throw new RuntimeException();	
		}
		
		return result;
	}

	
	@Override
	public int updateProduct(Product product, List<ProductImg> productImgList,
			List<ProductDetailImg> productDetailImgList, List<ProductOption> productOptionList) {
		int result=0;
		int product_code= product.getProduct_code();
		
		try
		{
			result=productDAO.updateProduct(sqlSession,product);
			product_code=product.getProduct_code();
			if(productImgList.size()>0)
			{
				for(ProductImg productImg : productImgList)
				{
					productImg.setProduct_code(product_code);
					result=productDAO.updateImgList(sqlSession,productImg);
					
				}
				
			}
			if(productDetailImgList.size()>0)
			{
				for(ProductDetailImg productDetailImg : productDetailImgList)
				{
					productDetailImg.setProduct_code(product_code);
					result=productDAO.updateDetail(sqlSession,productDetailImg);
				
				}
			}
			
			if(productOptionList.size()>0)
			{
				productDAO.deleteOption(sqlSession,product_code);
				for(ProductOption productOption : productOptionList)
				{
					productOption.setProduct_code(product_code);
					result=productDAO.insertOption(sqlSession,productOption);
				}
				
				
			}
		}
		catch(Exception e)
		{
			e.printStackTrace();
			throw new RuntimeException();	
		}
		
		return result;
	}
	
	@Override
	public List<ProductCategory> selectCategoryList() {
		return productDAO.selectCategoryList(sqlSession);
	}

	@Override
	public ProductJoinCategory selectProduct(int productCode) {
		return productDAO.selectProduct(sqlSession,productCode);
	}

	@Override
	public List<ProductOption> selectOption(int productCode) {
		return productDAO.selectOption(sqlSession,productCode);
	}

	
	@Override
	public List<ProductReview> selectReview(int productCode) {
		return productDAO.selectReview(sqlSession,productCode);
	}

	@Override
	public int selectProductReviewCount(int product_code) {
		return productDAO.selectProductReviewCount(sqlSession,product_code);
	}

	
	@Override
	public int reviewInsert(ProductReview productReview,List<ProductReviewImg> productReviewImgList) {
		int result=0;
		int review_code=0;
		try {		
			result=productDAO.reviewInsert(sqlSession, productReview);
			review_code=productReview.getReview_code();
			if(productReviewImgList.size()>0 && productReviewImgList !=null)
			{
				for(ProductReviewImg productReviewImg : productReviewImgList)
				{
					productReviewImg.setReview_code(review_code);
					result=productDAO.insertReviewImg(sqlSession,productReviewImg);
				}
			}
			
		}catch(Exception e)
		{
			e.printStackTrace();
			throw new RuntimeException();	
		}
		
		
		return result;
	}

	@Override
	public List<ProductReviewImgJoin> selectReviewImg(int productCode) {
		return productDAO.selectReviewImg(sqlSession,productCode);
	}

	@Override
	public List<ProductListJoin> reviewStarOrder(int cPage,int numPerPage ) {
		return productDAO.reviewStarOrder(sqlSession,cPage,numPerPage);
	}
	
	@Override
	public List<ProductListJoin> highPriceOrder(int cPage,int numPerPage) {
		return productDAO.highPriceOrder(sqlSession,cPage,numPerPage);
	}

	@Override
	public List<ProductListJoin> lowPriceOrder(int cPage,int numPerPage) {
		return productDAO.lowPriceOrder(sqlSession,cPage,numPerPage);
	}

	@Override
	public List<ProductListJoin> writeDateOrder(int cPage,int numPerPage) {
		return productDAO.writeDateOrder(sqlSession,cPage,numPerPage);
	}
	
	@Override
	public List<ProductListJoin> categorySort(String p_category_name,int cPage, int numPerPage) {
		return productDAO.categorySort(sqlSession,p_category_name,cPage,numPerPage);
	}
	
	@Override
	public int categorySortCount(String p_category_name) {
		return productDAO.categorySortCount(sqlSession,p_category_name);
	}


	@Override
	public int insertCart(Cart cart) {
		return productDAO.insertCart(sqlSession,cart);
	}

	@Override
	public List<CartJoinList> selectCartList(String member_id) {
		return productDAO.selectCartList(sqlSession,member_id);
	}
	
	@Override
	public List<CartJoinList> selectCartList(String[] cart_codes) {
		return productDAO.selectCartList(sqlSession,cart_codes);
	}

	@Override
	public int plusCart(Cart cart) {
		return productDAO.plusCart(sqlSession,cart);
	}

	@Override
	public int changeCart(Cart cart) {
		return productDAO.changeCart(sqlSession,cart);
	}

	@Override
	public int deleteCart(int cart_code) {
		return productDAO.deleteCart(sqlSession,cart_code);
	}

	@Override
	public int deleteSelectCart(String[] cart_codes) {
		return productDAO.deleteSelectCart(sqlSession,cart_codes);
	}

	@Override
	public ProductJoinOption selectProductJoinOption(int product_option_code) {
		return productDAO.selectProductJoinOption(sqlSession,product_option_code);
	}
	
	@Override
	public int insertBuyList(List<BuyInfo> buyList) {
		int result=0;
		try {		
			if(buyList.size()>0)
			{
				for(BuyInfo buy : buyList)
				{
					result=productDAO.insertBuy(sqlSession,buy);
				}
			}
			
		}catch(Exception e){
			e.printStackTrace();
			throw new RuntimeException();	
		}
		return result;
	}

	@Override
	public int insertPoint(PointLog pointLog) {
		return productDAO.insertPoint(sqlSession,pointLog);
	}
	
	@Override
	public int selectPoint(String member_id) {
		return productDAO.selectPoint(sqlSession,member_id);
	}
	
	@Override
	public int updateLeftList(List<BuyInfo> buyList) {
		int result=0;
		try {		
			if(buyList.size()>0)
			{
				for(BuyInfo buy : buyList)
				{
					result=productDAO.updateLeftList(sqlSession,buy);
				}
			}
			
		}catch(Exception e){
			e.printStackTrace();
			throw new RuntimeException();	
		}
		return result;
	}

	@Override
	public int addQuestion(ProductQuestion productQuestion) {
		return productDAO.addQuestion(sqlSession,productQuestion);
	}

	@Override
	public int deleteQuestion(int p_question_code) {
		return productDAO.deleteQuestion(sqlSession,p_question_code);
	}
	
	@Override
	public List<ProductQuestion> selectQuestion(int productCode) {
		return productDAO.selectQuestion(sqlSession,productCode);
	}

	@Override
	public List<ProductDetailImg> selectDetailImg(int productCode) {
		return productDAO.selectDetailImg(sqlSession,productCode);
	}

	@Override
	public List<ProductImg> selectImgList(int productCode) {
		return productDAO.selectImgList(sqlSession,productCode);
	}

	@Override
	public int addLike(ProductReviewLike productReviewLike) {
		return productDAO.addLike(sqlSession,productReviewLike);
	}

	@Override
	public ProductReviewLike selectLike(int review_code) {
		return productDAO.selectLike(sqlSession,review_code);
	}

	@Override
	public int deleteLike(ProductReviewLike productReviewLike) {
		return productDAO.deleteLike(sqlSession,productReviewLike);
	}

	@Override
	public int updateLike(ProductReviewLike productReviewLike) {
		return productDAO.updateLike(sqlSession,productReviewLike);
	}

	@Override
	public List<ProductReviewLike> selectLikeList() {
		return productDAO.selectLikeList(sqlSession);
	}

	@Override
	public String checkLike(Map map) {
		return productDAO.checkLike(sqlSession,map);
	}

	@Override
	public int deleteProduct(int product_code) {
		return productDAO.deleteProduct(sqlSession,product_code);
	}


	@Override
	public int deleteReview(int review_code) {
		return productDAO.deleteReview(sqlSession,review_code);
	}

	
	
}
