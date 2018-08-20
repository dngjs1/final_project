package com.notnull.shop.rental.model.dao;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.notnull.shop.rental.model.vo.File;

@Repository
public class FileDAOimpl implements FileDAO{
	private static final String ns = "Files.";

	@Autowired
	SqlSession session;
	
	@Override
	public boolean insertFile(File fileVO) {
		return session.insert(ns+"insertFile", fileVO)>0?true:false;
	}

	@Override
	public List<File> getFileList(int fileSeq) {
		return session.selectList(ns+"getFileList", fileSeq);
	}

}
