package com.notnull.shop.rental.model.vo;

public class File {

	//file
	private int fileSeq;
	private String originalFileName;
	private String storedFileName;
	private Long fileSize;
	private String fileKBSize;
	private String contentType;
	private String createAt;
	
	//postFile
	private int postSeq;



	public int getFileSeq() {
		return fileSeq;
	}

	public void setFileSeq(int fileSeq) {
		this.fileSeq = fileSeq;
	}

	public String getOriginalFileName() {
		return originalFileName;
	}

	public void setOriginalFileName(String originalFileName) {
		this.originalFileName = originalFileName;
	}

	public String getStoredFileName() {
		return storedFileName;
	}

	public void setStoredFileName(String storedFileName) {
		this.storedFileName = storedFileName;
	}

	public Long getFileSize() {
		return fileSize;
	}

	public void setFileSize(Long fileSize) {
		this.fileSize = fileSize;
	}

	public String getFileKBSize() {
		return fileKBSize;
	}

	public void setFileKBSize(String fileKBSize) {
		this.fileKBSize = fileKBSize;
	}

	public String getContentType() {
		return contentType;
	}

	public void setContentType(String contentType) {
		this.contentType = contentType;
	}

	public String getCreateAt() {
		return createAt;
	}

	public void setCreateAt(String createAt) {
		this.createAt = createAt;
	}

	public int getPostSeq() {
		return postSeq;
	}

	public void setPostSeq(int postSeq) {
		this.postSeq = postSeq;
	}

	@Override
	public String toString() {
		return "File [fileSeq=" + fileSeq + ", originalFileName=" + originalFileName + ", storedFileName="
				+ storedFileName + ", fileSize=" + fileSize + ", fileKBSize=" + fileKBSize + ", contentType="
				+ contentType + ", createAt=" + createAt + ", postSeq=" + postSeq + "]";
	}
	
	
}
