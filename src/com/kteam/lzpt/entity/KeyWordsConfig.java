package com.kteam.lzpt.entity;

import java.util.List;

/**
 * 关键字
 * @author Administrator
 *
 */
public class KeyWordsConfig extends BaseEntity{
	
	private String id;
	
	//关键字
	private String keyWords;
	
	//搜索方式
	private List<SearchWay> swList;

	public String getId() {
		return id;
	}

	public void setId(String id) {
		this.id = id;
	}

	public String getKeyWords() {
		return keyWords;
	}

	public void setKeyWords(String keyWords) {
		this.keyWords = keyWords;
	}

	public List<SearchWay> getSwList() {
		return swList;
	}

	public void setSwList(List<SearchWay> swList) {
		this.swList = swList;
	}
	
	

}
