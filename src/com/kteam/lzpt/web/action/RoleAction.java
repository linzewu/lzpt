package com.kteam.lzpt.web.action;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.List;

import javax.servlet.http.HttpServletResponse;

import net.sf.json.JSONArray;

import org.apache.commons.logging.Log;
import org.apache.commons.logging.LogFactory;
import org.apache.struts2.ServletActionContext;

import com.kteam.lzpt.entity.Role;
import com.kteam.lzpt.manager.IRoleManager;

public class RoleAction extends BaseAction {
	
	
	public Role role;

	private IRoleManager roleManager;
	

	public Role getRole() {
		return role;
	}

	public void setRole(Role role) {
		this.role = role;
	}

	public IRoleManager getRoleManager() {
		return roleManager;
	}

	public void setRoleManager(IRoleManager roleManager) {
		this.roleManager = roleManager;
	}

	/**
	 * 查询角色
	 */
	public void queryRoles() {
		try {
			HttpServletResponse response = ServletActionContext.getResponse();
			response.setCharacterEncoding("UTF-8");
			PrintWriter pw;

			pw = response.getWriter();

			List<Role> roles = this.roleManager.getRoles();

			JSONArray jsonArray = JSONArray.fromObject(roles);

			pw.print(jsonArray.toString());
		} catch (IOException e) {
			
			log.error("查询角色列表异常",e);
		}
	}
	
	/**
	 * 添加角色
	 */
	public void addRole(){
		
		HttpServletResponse response = ServletActionContext.getResponse();
		PrintWriter pw=null;
			
		try {
			pw = response.getWriter();
			this.roleManager.addRole(role);
			pw.print("succeed");
		}catch (Exception e) {
			log.error("添加角色异常", e);
			if(pw!=null){
				pw.print("error");
			}
		}
		
	}
	
	/**
	 * 修改角色
	 */
	public void modifyRole(){
		HttpServletResponse response = ServletActionContext.getResponse();
		PrintWriter pw=null;
			
		try {
			pw = response.getWriter();
			this.roleManager.modifyRole(role);
			pw.print("succeed");
		}catch (Exception e) {
			log.error("修改角色异常", e);
			if(pw!=null){
				pw.print("error");
			}
		}
	}
	/**
	 * 验证角色名称的唯一性
	 */
	public void validateRole(){
		HttpServletResponse response = ServletActionContext.getResponse();		
		response.setCharacterEncoding("UTF-8");
		PrintWriter pw = null;
		try
		{
			
			pw = response.getWriter();	
			int count = roleManager.validateRoleName(role.getRoleName());
			if (count > 0)
			{
				pw.print("false");
			}
			else
			{
				pw.print("true");
			}
		} catch (Exception e)
		{
			pw.print("false");
			log.error("validateRole(): " + e.toString());
			
		} finally
		{
			pw.close();
		}
	}
	

}
