package com.notnull.shop.rental.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
public class RentalController {
	
	@RequestMapping("/rentalMain.do")
	public String memberEnroll() {
		
		return "rental/rentalMain";
	}
}
