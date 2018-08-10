package com.notnull.shop.product.model.service;

import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.notnull.shop.product.model.dao.ProductDAO;
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

@Service
public class ProductServiceImpl implements ProductService {

	@Autowired
	private ProductDAO productDAO;
	
	@Autowired
	SqlSessionTemplate sqlSession;

	@Override
	public List<ProductListJoin> selectProductList() {
		return productDAO.selectProductList(sqlSession);
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
	public int reviewInsert(ProductReview productReview,List<ProductReviewImg> productReviewImgList) {
		int result=0;
		int review_code=0;
		try {		
			result=productDAO.reviewInsert(sqlSession, productReview);
			review_code=productReview.getReview_code();
			if(productReviewImgList.size()>0)
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
	public List<ProductListJoin> reviewStarOrder() {
		return productDAO.reviewStarOrder(sqlSession);
	}

	@Override
	public List<ProductListJoin> highPriceOrder() {
		return productDAO.highPriceOrder(sqlSession);
	}

	@Override
	public List<ProductListJoin> lowPriceOrder() {
		return productDAO.lowPriceOrder(sqlSession);
	}

	@Override
	public List<ProductListJoin> writeDateOrder() {
		return productDAO.writeDateOrder(sqlSession);
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
<<<<<<< HEAD
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
=======
	public int addQuestion(ProductQuestion productQuestion) {
		return productDAO.addQuestion(sqlSession,productQuestion);
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
>>>>>>> SUPER_branch
	}

	
	
}
