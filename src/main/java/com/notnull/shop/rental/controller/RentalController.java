package com.notnull.shop.rental.controller;

import java.util.ArrayList;
import java.util.List;
import java.util.regex.Matcher;
import java.util.regex.Pattern;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

import com.notnull.shop.common.PageCreate;
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
	
	//리스트
	@RequestMapping(value= "/rentalMain.do", method=RequestMethod.GET)
	public String ListRental(HttpServletRequest req, @RequestParam(value="cPage",required=false,defaultValue="1") int cPage, Model model) {
		List<Rental> list;
		int numPerPage = 5;
		
		int totalCount = service.selectRentalCount();
		
		list = service.RentalList(cPage, numPerPage);
		
		String pageBar = new PageCreate().getPageBar(cPage, numPerPage, totalCount, "/rentalMain.do");
		
		for(Rental rental : list) {
		    String re1=".*?";	// Non-greedy match on filler
		    String re2="((?:\\/[\\w\\.\\-]+)+)";	// Unix Path 1

		    Pattern p = Pattern.compile(re1+re2,Pattern.CASE_INSENSITIVE | Pattern.DOTALL);
		    
		    Matcher m = p.matcher(rental.getContent());
		    if (m.find())
		    {
		    	rental.setImgUrl("."+m.group(1));
		    }
		    
		}
		model.addAttribute("list", list);
		model.addAttribute("pageBar", pageBar);
		model.addAttribute("cPage", cPage);
		model.addAttribute("totalCount",totalCount);
		
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
	@RequestMapping(value="/rentalWrite2.do",method=RequestMethod.POST) 
	public String rentalWritePost(Rental rental, HttpServletRequest req){
		System.out.println(rental.getStart_date());
		System.out.println(rental.getEnd_date());
		service.insertRental(rental);
		
		return "redirect:/rentalMain.do";
	}
	
	//상세보기
	@RequestMapping(value="/rentalDetail.do", method=RequestMethod.GET)
	public String detailGet(int rental_obj_code, HttpServletRequest req, Model model) {
		Rental rental = new Rental();
		
		rental = service.getRental(rental_obj_code);
		String re1=".*?";	// Non-greedy match on filler
		String re2="((?:\\/[\\w\\.\\-]+)+)";	// Unix Path 1

	    Pattern p = Pattern.compile(re1+re2,Pattern.CASE_INSENSITIVE | Pattern.DOTALL);
		    
	    Matcher m = p.matcher(rental.getContent());
	    if (m.find()) {
		    rental.setImgUrl("."+m.group(1));
		}
		model.addAttribute("rental", rental);
		
		return "rental/rentalView";
	}
	
}
