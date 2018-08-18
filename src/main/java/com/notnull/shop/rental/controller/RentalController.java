package com.notnull.shop.rental.controller;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;

import com.notnull.shop.rental.model.service.RentalServiceImpl;

@Controller
public class RentalController {
	
	
	@RequestMapping("/rentalMain.do")
	public String memberEnroll() {
		
		return "rental/rentalMain";
	}
	
}
