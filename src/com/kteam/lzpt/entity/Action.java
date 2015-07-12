package com.kteam.lzpt.entity;

/** 
 * <p>Title: Action </p> 
 * <p>Description: </p> 
 * <p>version:1.0</p> 
 * <p>Company: dcss</p> 
 * @author    林泽武 
 * @date       2012-7-5 
 * <p>
 * 修改时间：<br/>
 * 修改人：<br/>
 * 修改原因：<br/>
 * </p>
 */
public class Action extends BaseEntity {
	
	//主键 id 序列号
	private String id;
	
	//标题
	private String title;
	
	//
	private String command;

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

	/**
	 * @return the command
	 */
	public String getCommand() {
	
		return command;
	}

	/**
	 * @param command the command to set
	 */
	public void setCommand(String command) {
	
		this.command = command;
	}

	
}
