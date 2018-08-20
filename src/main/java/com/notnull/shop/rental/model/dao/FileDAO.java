package com.notnull.shop.rental.model.dao;

import java.util.List;

import com.notnull.shop.rental.model.vo.File;

public interface FileDAO {

	boolean insertFile(File fileVO);

	List<File> getFileList(int fileSeq);

}
