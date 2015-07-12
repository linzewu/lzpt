package com.kteam.lzpt.entity;

import java.util.Date;
import java.util.List;

import javax.xml.bind.annotation.XmlRootElement;

/** 
 * <p>Title: User 用户</p> 
 * <p>Description: </p> 
 * <p>version:1.0</p> 
 * <p>Company: dcss</p> 
 * @author    林泽武 
 * @date       2012-7-4 
 * <p>修改时间：</p> 
 * <p>修改人：</p> 
 * <p>修改原因：</p>
 */
@XmlRootElement(name="User")
public class User extends BaseEntity {
	
	//激活状态
	public static final int STATE_ACTIVATING=0;
	
	//状态失效
	public static final int STATE_INVALID=1;

	
	//用户Id主键  序列号 
	private String id;
	
	//用户名 
	private String userName;
	
	//密码
	private String password;
	
	//用户角色
	private List<Role> roles;
	
	//姓名
	private String name;
	
	//上一次登录时间
	private Date lastLoingTime;
	
	//本次登录时间
	private Date loginTime;
	
	//角色id 用,号隔开 。。页面参数
	private String roleid;
	
	private String unitId;
	
	
	
	//////////////非持久化字段//////////////////////////////////////
	private Role defaultRole;
	
	
	public Role getDefaultRole() {
		return defaultRole;
	}

	public void setDefaultRole(Role defaultRole) {
		this.defaultRole = defaultRole;
	}

	public String getUnitId() {
		return unitId;
	}

	public void setUnitId(String unitId) {
		this.unitId = unitId;
	}

	/**
	 * 用户id 序列号
	 * @return
	 */
	public String getId() {
		return id;
	}

	/**
	 * 用户id 序列号
	 * @param id
	 */
	public void setId(String id) {
		this.id = id;
	}

	/**
	 * 用户账户
	 * @return
	 */
	public String getUserName() {
		return userName;
	}

	/**
	 * 用户账户
	 * @return
	 */
	public void setUserName(String userName) {
		this.userName = userName;
	}

	/**
	 * 用户密码
	 * @return
	 */
	public String getPassword() {
		return password;
	}

	/**
	 * 用户密码
	 * @return
	 */
	public void setPassword(String password) {
		this.password = password;
	}


	
	/**
	 * 用户角色
	 * @return
	 */
	public List<Role> getRoles() {
		return roles;
	}

	/**
	 * 用户角色
	 * @return
	 */
	public void setRoles(List<Role> roles) {
		this.roles = roles;
	}

	
	/**
	 * 姓名
	 * @return
	 */
	public String getName() {
		return name;
	}

	/**
	 * 用户姓名
	 * @param name
	 */
	public void setName(String name) {
		this.name = name;
	}

	/**
	 * 用户上一次登录时间
	 * @return
	 */
	public Date getLastLoingTime() {
		return lastLoingTime;
	}

	/**
	 * 用户上一次登录时间
	 * @return
	 */
	public void setLastLoingTime(Date lastLoingTime) {
		this.lastLoingTime = lastLoingTime;
	}

	/**
	 * 当前登录时间
	 * @return
	 */
	public Date getLoginTime() {
		return loginTime;
	}

	/**
	 * 当前登录时间
	 * @return
	 */
	public void setLoginTime(Date loginTime) {
		this.loginTime = loginTime;
	}

	public String getRoleid() {
		return roleid;
	}

	public void setRoleid(String roleid) {
		this.roleid = roleid;
	}


}
