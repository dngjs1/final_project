package com.notnull.shop.rental.model.service;

import java.util.List;

import com.notnull.shop.rental.model.vo.File;

public interface FileService {

	boolean insertFile(File fileVO);

	List<File> GetFileList(int fileSeq);

}
