package com.kteam.lzpt.entity;

/**
 * 搜索方式
 * @author Administrator
 *
 */
public class SearchWay extends BaseEntity{
	
	private String id;
	
	//搜索方式
	private String searchmode;
	
	//搜索网站
	private String website;

	public String getId() {
		return id;
	}

	public void setId(String id) {
		this.id = id;
	}

	public String getSearchmode() {
		return searchmode;
	}

	public void setSearchmode(String searchmode) {
		this.searchmode = searchmode;
	}

	public String getWebsite() {
		return website;
	}

	public void setWebsite(String website) {
		this.website = website;
	}
	
	

}
