package com.notnull.shop.infoBoard.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
public class InfoBoardController {
	
	@RequestMapping("/infoMain.do")
	public String memberEnroll() {
		
		return "info/infoMain";
	}
}
