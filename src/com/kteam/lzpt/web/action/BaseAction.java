package com.kteam.lzpt.web.action;

import org.apache.commons.logging.Log;
import org.apache.commons.logging.LogFactory;

public class BaseAction {
	
	protected static Log log = LogFactory.getLog(BaseAction.class);
	//当前页
	protected int page;
	//页面查询的行数
	protected int rows;
	
	private String pageName;
	
	public String getPageName() {
		return pageName;
	}
	public void setPageName(String pageName) {
		this.pageName = pageName;
	}
	
	public int getRows() {
		return rows;
	}
	public void setRows(int rows) {
		this.rows = rows;
	}
	public int getPage() {
		return page;
	}
	public void setPage(int page) {
		this.page = page;
	}
	
	/**
	 * 跳转页面方法
	 * @return
	 */
	public String  toPage(){
		return pageName;
	}
	
	
	

}
