package com.kteam.lzpt.entity;

import java.util.Date;

/** 
 * <p>Title: BaseEntity</p> 
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
public class BaseEntity {
	
	//创建者
	private String createUser;
	
	//修改者
	private String updateUser;
	
	//创建时间
	private Date createTime;
	
	//更新时间
	private Date updateTime;
	
	//状态
	private int state;
	
	public BaseEntity(){
		updateTime=new Date();
	}

	/**
	 *  创建者
	 * @return
	 */
	public String getCreateUser() {
		return createUser;
	}

	/**
	 * 创建者
	 * @param createUser
	 */
	public void setCreateUser(String createUser) {
		this.createUser = createUser;
	}

	/**
	 * 修改者
	 * @return
	 */
	public String getUpdateUser() {
		return updateUser;
	}

	/**
	 * 修改者
	 * @param updateUser
	 */
	public void setUpdateUser(String updateUser) {
		this.updateUser = updateUser;
	}

	/**
	 * 创建时间
	 * @return
	 */
	public Date getCreateTime() {
		return createTime;
	}

	/**
	 * 创建时间
	 * @param createTime
	 */
	public void setCreateTime(Date createTime) {
		this.createTime = createTime;
	}

	/**
	 * 更新时间
	 * @return
	 */
	public Date getUpdateTime() {
		return updateTime;
	}

	/**
	 * 更新时间
	 * @param updateTime
	 */
	public void setUpdateTime(Date updateTime) {
		this.updateTime = updateTime;
	}

	/**
	 * 状态
	 * @return the state
	 */
	public int getState() {
	
		return state;
	}

	/**
	 * 状态
	 * @param state the state to set
	 */
	public void setState(int state) {
	
		this.state = state;
	}

	
	
	
}
