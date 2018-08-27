package com.notnull.shop;

import java.text.DateFormat;
import java.util.Date;
import java.util.List;
import java.util.Locale;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.notnull.shop.product.model.service.ProductService;
import com.notnull.shop.product.model.vo.ProductListJoin;

/**
 * Handles requests for the application home page.
 */
@Controller
public class HomeController {
	
	private static final Logger logger = LoggerFactory.getLogger(HomeController.class);
	
	
	@Autowired
	private ProductService service;
	/**
	 * Simply selects the home view to render by returning its name.
	 */
	@RequestMapping(value = "/", method = RequestMethod.GET)
	public String home(Locale locale, Model model) {
		logger.info("Welcome home! The client locale is {}.", locale);
		
		String p_category_name="캠핑";
		List<ProductListJoin> campList = service.categorySort(p_category_name);
		
		p_category_name="수영";
		List<ProductListJoin> swimList = service.categorySort(p_category_name);
		
		p_category_name="등산";
		List<ProductListJoin> climbList = service.categorySort(p_category_name);
		
		p_category_name="낚시";
		List<ProductListJoin> fishList = service.categorySort(p_category_name);
		
		Date date = new Date();
		DateFormat dateFormat = DateFormat.getDateTimeInstance(DateFormat.LONG, DateFormat.LONG, locale);
		
		String formattedDate = dateFormat.format(date);
		
		model.addAttribute("serverTime", formattedDate );
		model.addAttribute("campList",campList);
		model.addAttribute("swimList",swimList);
		model.addAttribute("climbList",climbList);
		model.addAttribute("fishList",fishList);
		
		
		return "index";
	}
	
}
