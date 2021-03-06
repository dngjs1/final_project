package com.notnull.shop.rental.util;

import java.io.File;
import java.io.FileOutputStream;
import java.io.IOException;
import java.io.OutputStream;
import java.util.UUID;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.web.multipart.MultipartFile;

public class FileUpload {
	private static final Logger logger = LoggerFactory.getLogger(FileUpload.class);

	private String storedFileName;
	private String orgFileName;
	
	@SuppressWarnings("unused")//사용하지 않는 경고 제외
	private FileUpload() {}
	
	public FileUpload(MultipartFile uploadFile, String path) {
		File file;
		OutputStream out = null;
		byte[] bytes;
		String ext;
		
		System.out.println(uploadFile.getOriginalFilename()+"1");
		
		//file 저장
		if(!uploadFile.getOriginalFilename().equals("")) {
			try {
				//이름짓기
				orgFileName = uploadFile.getOriginalFilename();
				//확장자
				ext = orgFileName.substring(orgFileName.lastIndexOf("."));
				do {
					//UUID 생성
					storedFileName = UUID.randomUUID().toString().replace("-", "")+ext;
					file = new File(path+storedFileName);

					logger.info("저장된 파일 이름: {}",storedFileName);
				} while(isFile(file));
	            
				
				bytes = uploadFile.getBytes();
	            
				//파일 저장
	            out = new FileOutputStream(file);
	            out.write(bytes);
	            
			} catch (IOException e) {
				logger.error("upload: {}",e.getMessage());
			} finally {
	            try {
					out.close();
				} catch (IOException e) {
					logger.error("close: {}",e.getMessage());
				}
				logger.info("upload file end");
			}
            
            
		} else {
			logger.info("upload file null");
			//bbs 저장
			storedFileName = "-1";
			orgFileName = "-1";
		}
		
	}

	public String getStoredFileName() {
		return storedFileName;
	}

	public void setStoredFileName(String storedFileName) {
		this.storedFileName = storedFileName;
	}

	public String getOrgFileName() {
		return orgFileName;
	}

	public void setOrgFileName(String orgFileName) {
		this.orgFileName = orgFileName;
	}
	
	private boolean isFile(File file) {
		
		if (file.exists()) {
			return true;
		} else {
			return false;
		}
		
	}
	
}
