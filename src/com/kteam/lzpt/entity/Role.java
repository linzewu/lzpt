package com.kteam.lzpt.entity;

import java.util.List;

/** 
 * <p>Title: Role 角色</p> 
 * <p>Description: </p> 
 * <p>version:1.0</p> 
 * <p>Company: dcss</p> 
 * @author    林泽武 
 * @date       2012-7-4 
 * <p>修改时间：</p> 
 * <p>修改人：</p> 
 * <p>修改原因：</p>
 */
public class Role extends BaseEntity {
	
	public static final  String ROLE_UNIT_MANAGER="乡镇单位管理员";
	
	//主键 序列号
	private String id;
	
	//角色名
	private String roleName;
	
	//角色包含的菜单
	private List<Menu> menus;
	
	//描述
	private String descripition;

	/**
	 * 角色Id
	 * @return the id
	 */
	public String getId() {
	
		return id;
	}

	/**
	 * 角色Id
	 * @param id the id to set
	 */
	public void setId(String id) {
	
		this.id = id;
	}

	/**
	 * 角色名称
	 * @return the roleName
	 */
	public String getRoleName() {
	
		return roleName;
	}

	/**
	 * 角色名称
	 * @param roleName the roleName to set
	 */
	public void setRoleName(String roleName) {
	
		this.roleName = roleName;
	}

	/**
	 * 角色拥有的菜单
	 * @return the menus
	 */
	public List<Menu> getMenus() {
	
		return menus;
	}

	/**
	 * 角色拥有的菜单
	 * @param menus the menus to set
	 */
	public void setMenus(List<Menu> menus) {
	
		this.menus = menus;
	}

	/**
	 * @return the descripition
	 */
	public String getDescripition() {
	
		return descripition;
	}

	/**
	 * @param descripition the descripition to set
	 */
	public void setDescripition(String descripition) {
	
		this.descripition = descripition;
	}
	
	
	
}
