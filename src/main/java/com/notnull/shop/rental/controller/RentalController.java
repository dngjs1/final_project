package com.notnull.shop.rental.controller;

import java.util.ArrayList;
import java.util.List;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.notnull.shop.product.model.service.ProductService;
import com.notnull.shop.product.model.vo.ProductCategory;
import com.notnull.shop.rental.model.service.RentalService;
import com.notnull.shop.rental.model.vo.Rental;

@Controller
public class RentalController {
	
	@Autowired
	RentalService service;
	
	@Autowired
	private ProductService service2;
	
	@RequestMapping("/rentalMain.do")
	public String memberEnroll() {
		
		return "rental/rentalMain";
	}
	
	//글쓰기 폼
	@RequestMapping("/rentalWrite.do")
	public String rentalWriteGet(HttpServletRequest req, Model model) {

		List<ProductCategory> categoryList=new ArrayList<ProductCategory>();
		categoryList=service2.selectCategoryList();
		
		model.addAttribute("categoryList",categoryList);
		return "rental/rentalUpload";
	}
	
	//글쓰기
	@RequestMapping(value="/rentalWrite.do",method=RequestMethod.POST) 
	public String rentalWritePost(Rental rental, HttpServletRequest req){
		service.insertRental(rental);
		
		return "rental/rentalMain";
	}
}
