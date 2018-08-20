package com.notnull.shop.rental.model.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.notnull.shop.rental.model.dao.FileDAO;
import com.notnull.shop.rental.model.vo.File;

@Service
public class FileServiceImpl implements FileService{

	@Autowired
	FileDAO dao;
	
	@Override
	public boolean insertFile(File fileVO) {
		return dao.insertFile(fileVO);
	}
	
	@Override
	public List<File> GetFileList(int fileSeq) {
		return dao.getFileList(fileSeq);
	}

}
