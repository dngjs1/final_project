package com.notnull.shop.rental.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.multipart.MultipartHttpServletRequest;

import com.notnull.shop.rental.model.service.FileService;
import com.notnull.shop.rental.model.vo.File;
import com.notnull.shop.rental.util.FileUpload;

@Controller
public class FileController {
	
	@Autowired
	FileService service;
	
	//이미지 업로드
	@RequestMapping(value="/rentalImageUpload.do", method=RequestMethod.POST)
	public @ResponseBody String insertImage(MultipartHttpServletRequest req, MultipartFile file) {
		FileUpload fileUpload;
		String path;
		String url;
		File fileVO = new File();
		
		//init
		path = req.getSession().getServletContext().getRealPath("/")+"upload/image/";//파일 저장 경로
		
		fileUpload = new FileUpload(file, path);
		
		//file
		fileVO.setFileSize(file.getSize());
		fileVO.setContentType(file.getContentType());
		fileVO.setOriginalFileName(fileUpload.getOrgFileName());
		fileVO.setStoredFileName(fileUpload.getStoredFileName());
		
		//action
		service.insertFile(fileVO);
		
		//return
		url = req.getContextPath()+"/upload/image"+fileUpload.getStoredFileName();
		
		return url;
	}
	
}
