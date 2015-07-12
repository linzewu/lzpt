package com.kteam.lzpt.entity;

public class Notice {
	
	//主键
	private String id;
	
	private String title;
	
	private String contents;
	
	// Y: 有效       N：无效
	private String isAvail;

	public String getId() {
		return id;
	}

	public void setId(String id) {
		this.id = id;
	}

	public String getTitle() {
		return title;
	}

	public void setTitle(String title) {
		this.title = title;
	}

	public String getContents() {
		return contents;
	}

	public void setContents(String contents) {
		this.contents = contents;
	}

	public String getIsAvail() {
		return isAvail;
	}

	public void setIsAvail(String isAvail) {
		this.isAvail = isAvail;
	}
	
	

}
