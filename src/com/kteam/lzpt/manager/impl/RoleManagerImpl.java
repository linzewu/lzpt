package com.kteam.lzpt.manager.impl;

import java.util.List;

import org.springframework.orm.hibernate3.support.HibernateDaoSupport;

import com.kteam.lzpt.entity.Role;
import com.kteam.lzpt.manager.IRoleManager;

public class RoleManagerImpl extends HibernateDaoSupport implements IRoleManager {

	@Override
	public void addRole(Role role) {
		this.getHibernateTemplate().save(role);

	}

	@Override
	public void modifyRole(Role role) {
		this.getHibernateTemplate().update(role);

	}

	@Override
	public void deleteRole(String id) {
		this.getHibernateTemplate().delete(id);

	}

	@Override
	public List<Role> getRoles() {
		
		List<Role> roles = this.getHibernateTemplate().find("FROM Role role");
		
		return roles;
	}

	@Override
	public Role getRoleById(String id) {
		Role role = this.getHibernateTemplate().load(Role.class,id);
		return role;
	}

	@Override
	public Integer getRolesTotal(Role role) {
		// TODO Auto-generated method stub
		return null;
	}
	
	/**
     * 验证角色名称的唯一性
     * @param rolename 
     * @return int 记录数
     * @throws Exception
     */
	public int validateRoleName(String rolename) {
		int count = (Integer) this.getHibernateTemplate().findByNamedParam("From Role where roleName = :rolename", "rolename", rolename).size();
		return count;
	}

}
