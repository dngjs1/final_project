package com.notnull.shop.company.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
public class companyController {
	
	@RequestMapping("/introMain.do")
	public String memberEnroll() {
		
		return "company/introMain";
	}
}
