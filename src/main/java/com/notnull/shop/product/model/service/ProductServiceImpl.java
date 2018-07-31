package com.notnull.shop.product.model.service;

import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.notnull.shop.product.model.dao.ProductDAO;
import com.notnull.shop.product.model.vo.Product;
import com.notnull.shop.product.model.vo.ProductCategory;
import com.notnull.shop.product.model.vo.ProductDetailImg;
import com.notnull.shop.product.model.vo.ProductImg;
import com.notnull.shop.product.model.vo.ProductJoinCategory;
import com.notnull.shop.product.model.vo.ProductListJoin;
import com.notnull.shop.product.model.vo.ProductOption;

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
			System.out.println(product_code);
			System.out.println("상품코드 "+product_code);
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
	public ProductJoinCategory selectProduct(String productCode) {
		return productDAO.selectProduct(sqlSession,productCode);
	}

	@Override
	public ProductOption selectOption(String productCode) {
		return productDAO.selectOption(sqlSession,productCode);
	}
	
	
}
