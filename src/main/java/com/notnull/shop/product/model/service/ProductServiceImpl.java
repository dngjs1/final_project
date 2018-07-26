package com.notnull.shop.product.model.service;

import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.notnull.shop.product.model.dao.ProductDAO;
import com.notnull.shop.product.model.vo.Product;
import com.notnull.shop.product.model.vo.ProductCategory;
import com.notnull.shop.product.model.vo.ProductImg;
import com.notnull.shop.product.model.vo.ProductListJoin;

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
	public int insertProduct(Product product, List<ProductImg> productImgList) {

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


	
	
	
}
