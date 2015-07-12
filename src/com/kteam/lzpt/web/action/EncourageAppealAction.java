package com.kteam.lzpt.web.action;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.ArrayList;
import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import net.sf.json.JSONArray;
import net.sf.json.JSONObject;
import net.sf.json.JsonConfig;
import net.sf.json.util.PropertyFilter;

import org.apache.struts2.ServletActionContext;

import com.kteam.lzpt.common.DateJsonValueProcessor;
import com.kteam.lzpt.entity.EncourageAppeal;
import com.kteam.lzpt.entity.Role;
import com.kteam.lzpt.entity.TaskProcess;
import com.kteam.lzpt.entity.User;
import com.kteam.lzpt.entity.WorkArchive;
import com.kteam.lzpt.manager.IEncourageAppealManager;

public class EncourageAppealAction extends BaseAction {
	
	private IEncourageAppealManager encourageAppealManager;
	
	private EncourageAppeal ea;

	public IEncourageAppealManager getEncourageAppealManager() {
		return encourageAppealManager;
	}

	public void setEncourageAppealManager(
			IEncourageAppealManager encourageAppealManager) {
		this.encourageAppealManager = encourageAppealManager;
	}

	public EncourageAppeal getEa() {
		return ea;
	}

	public void setEa(EncourageAppeal ea) {
		this.ea = ea;
	}
	
	/**
	 * 查询奖励诉求
	 */
	public void queryEncourageAppeal() {
		PrintWriter pw = null; 
		try {
			HttpServletResponse response = ServletActionContext.getResponse();
			response.setCharacterEncoding("UTF-8");
			

			pw = response.getWriter();
			Map<String,Object> jsonMap = new HashMap<String,Object>();

			List<EncourageAppeal> eas = this.encourageAppealManager.queryEncourageAppeal(ea, rows,page);
			
			JsonConfig config = new JsonConfig();
			//转换日期格式
			config.registerJsonValueProcessor(Date.class, new DateJsonValueProcessor());
			//过滤掉用户中的roles,powers属性
			config.setJsonPropertyFilter(new PropertyFilter() {			
				@Override
				public boolean apply(Object arg0, String arg1, Object arg2) {
					if (arg1.equals("ewa")) {
						return true;
					} else {
						return false;
					}			
				}
			});
			
			jsonMap.put("total", this.encourageAppealManager.getEncourageAppealTotal(ea));
			jsonMap.put("rows", eas);

			JSONArray jsonArray = JSONArray.fromObject(eas,config);
			
			pw.print(jsonArray.toString());
			
		} catch (IOException e) {
			e.printStackTrace();
			log.error("查询奖励诉求列表异常",e);
		}finally
		{
			if (null != pw)
			{
				pw.close();
			}
		}
	}
	
	/**
	 * 添加奖励诉求
	 */
	public void addEncourageAppeal(){
		
		HttpServletResponse response = ServletActionContext.getResponse();
		HttpServletRequest request = ServletActionContext.getRequest();
		PrintWriter pw=null;
			
		try {
			pw = response.getWriter();
			ea.setCreateTime(new Date());
			User user = (User) request.getSession().getAttribute("user");
			ea.setCreateUser(user.getName());
			this.encourageAppealManager.addEncourageAppeal(ea);
			pw.print("succeed");
		}catch (Exception e) {
			log.error("添加奖励诉求异常", e);
			if(pw!=null){
				pw.print("error");
			}
		}finally
		{
			if (null != pw)
			{
				pw.close();
			}
		}
		
	}
	
	/**
	 * 修改奖励诉求
	 */
	public void modifyEncourageAppeal(){
		HttpServletResponse response = ServletActionContext.getResponse();
		HttpServletRequest request = ServletActionContext.getRequest();
		PrintWriter pw=null;
			
		try {
			pw = response.getWriter();
			ea.setUpdateTime(new Date());
			User user = (User) request.getSession().getAttribute("user");
			ea.setUpdateUser(user.getName());
			this.encourageAppealManager.modifyEncourageAppeal(ea);
			pw.print("succeed");
		}catch (Exception e) {
			log.error("修改奖励诉求异常", e);
			if(pw!=null){
				pw.print("error");
			}
		}finally
		{
			if (null != pw)
			{
				pw.close();
			}
		}
	}
	
	public void getWaidById()
	{
		HttpServletResponse response = ServletActionContext.getResponse();
		HttpServletRequest request = ServletActionContext.getRequest();
		PrintWriter pw=null;
		
		try {
			pw = response.getWriter();
			ea = this.encourageAppealManager.getEncourageAppealById(ea.getId());

			pw.print(ea.getEwa().getId());
			
		} catch (IOException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
			log.error(e.toString());
		}finally
		{
			if (null != pw)
			{
				pw.close();
			}
		}
	}
	
	public void deleteEncourageAppeal()
	{
		HttpServletResponse response = ServletActionContext.getResponse();
		PrintWriter pw=null;
		try {
			pw = response.getWriter();
			this.encourageAppealManager.deleteEncourageAppeal(ea.getId());

			pw.print("success");
			
		} catch (IOException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
			log.error(e.toString());
			pw.print("error");
		}finally
		{
			if (null != pw)
			{
				pw.close();
			}
		}
	}
	
	/**
	 * 根据id查询奖励诉求
	 */
	public String getEncourageAppealById()
	{
		HttpServletResponse response = ServletActionContext.getResponse();
		HttpServletRequest request = ServletActionContext.getRequest();
		String returl = request.getParameter("reqUrl");
		
		try {
			ea = this.encourageAppealManager.getEncourageAppealById(ea.getId());
			
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
			log.error(e.toString());
		}
		
		if ("toinfo".equals(returl))
		{
			if (ea.getEtype() == 0)
			{
				return "toinfo";
			}
			else
			{
				return "toinfo1";
			}
			
		}
		else
		{		
			if (ea.getEtype() == 0)
			{
				return "tomodify";
			}
			else
			{
				return "tomodify1";
			}
			
		}
		
	}
	
public void pushEncourageAppeal(){
		
		HttpServletResponse response = ServletActionContext.getResponse();
		response.setCharacterEncoding("UTF-8");
		PrintWriter pw = null;
		
		try{
			pw = response.getWriter();
			
			Integer status = this.ea.getState();
			
			this.ea=this.encourageAppealManager.getEncourageAppealById(ea.getId());
			
			
			
			this.ea.setState(status);
			
			this.encourageAppealManager.modifyEncourageAppeal(this.ea);
			
			pw.print("success");
		}catch (Exception e) {
			if(pw!=null){
				pw.print("error");
			}
			log.error("修改任务状态出错", e);
		}
		
	}

/**
 * 修改奖励诉求
 */
public void modifyEncourageAppealtotal(){
	HttpServletResponse response = ServletActionContext.getResponse();
	HttpServletRequest request = ServletActionContext.getRequest();
	PrintWriter pw=null;
		
	try {
		pw = response.getWriter();
		Integer score = this.ea.getEscores();
		
		this.ea=this.encourageAppealManager.getEncourageAppealById(ea.getId());	
		
		this.ea.setEscores(score);
		
		this.encourageAppealManager.modifyEncourageAppeal(this.ea);
		pw.print("success");
	}catch (Exception e) {
		e.printStackTrace();
		log.error("修改奖励诉求异常", e);
		if(pw!=null){
			pw.print("error");
		}
	}finally
	{
		if (null != pw)
		{
			pw.close();
		}
	}
}

	

}
