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
	
	@Autowired
	RentalServiceImpl rental;
	
	@RequestMapping("/rentalMain.do")
	public String memberEnroll() {
		
		return "rental/rentalMain";
	}
	
	//사진업로드
	@RequestMapping(value="/rentalImageUpload.do", method=RequestMethod.POST)
	public @ResponseBody String setImageUpload(MultipartFile uploadFile, HttpServletRequest request) {

		String url = rental.setImageUpload(uploadFile);
		
		
		String requestURL = request.getRequestURL().toString();
		String[] urlSplit =  requestURL.split("/");
		String localPath = "http://"+urlSplit[2];
		
		return localPath+"/img/photo/"+url;
	}
}
