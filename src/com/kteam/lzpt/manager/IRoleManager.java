package com.kteam.lzpt.manager;

import java.util.List;

import com.kteam.lzpt.entity.Role;

public interface IRoleManager {
	
	public void addRole(Role role);
	
	public void modifyRole(Role role);
	
	public void deleteRole(String id);
	
	//查询角色没有分页
	public List<Role> getRoles();
	
	//查询角色
	public Role getRoleById(String id);
	
	//查询角色记录数
	public Integer getRolesTotal(Role role);
	
	//验证角色名称的唯一性
	public int validateRoleName(String rolename);

}
