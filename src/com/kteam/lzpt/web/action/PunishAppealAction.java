package com.kteam.lzpt.web.action;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import net.sf.json.JSONArray;
import net.sf.json.JsonConfig;
import net.sf.json.util.PropertyFilter;

import org.apache.struts2.ServletActionContext;

import com.kteam.lzpt.common.DateJsonValueProcessor;
import com.kteam.lzpt.entity.EncourageAppeal;
import com.kteam.lzpt.entity.PunishAppeal;
import com.kteam.lzpt.entity.User;
import com.kteam.lzpt.manager.IPunishAppealManager;

public class PunishAppealAction extends BaseAction {
	
	private IPunishAppealManager punishAppealManager;
	
	private PunishAppeal pa;

	public IPunishAppealManager getPunishAppealManager() {
		return punishAppealManager;
	}

	public void setPunishAppealManager(IPunishAppealManager punishAppealManager) {
		this.punishAppealManager = punishAppealManager;
	}

	public PunishAppeal getPa() {
		return pa;
	}

	public void setPa(PunishAppeal pa) {
		this.pa = pa;
	}
	
	/**
	 * 查询惩罚诉求
	 */
	public void queryPunishAppeal() {
		PrintWriter pw = null; 
		try {
			HttpServletResponse response = ServletActionContext.getResponse();
			response.setCharacterEncoding("UTF-8");
			

			pw = response.getWriter();
			Map<String,Object> jsonMap = new HashMap<String,Object>();

			List<PunishAppeal> eas = this.punishAppealManager.queryPunishAppeal(pa, rows,page);
			
			JsonConfig config = new JsonConfig();
			//转换日期格式
			config.registerJsonValueProcessor(Date.class, new DateJsonValueProcessor());
			//过滤掉用户中的roles,powers属性
			config.setJsonPropertyFilter(new PropertyFilter() {			
				@Override
				public boolean apply(Object arg0, String arg1, Object arg2) {
					if (arg1.equals("pwa")) {
						return true;
					} else {
						return false;
					}			
				}
			});
			
			jsonMap.put("total", this.punishAppealManager.getPunishAppealTotal(pa));
			jsonMap.put("rows", eas);

			JSONArray jsonArray = JSONArray.fromObject(eas,config);

			pw.print(jsonArray.toString());
		} catch (IOException e) {
			
			log.error("查询惩罚诉求列表异常",e);
		}finally
		{
			if (null != pw)
			{
				pw.close();
			}
		}
	}
	
	/**
	 * 添加惩罚诉求
	 */
	public void addPunishAppeal(){
		
		HttpServletResponse response = ServletActionContext.getResponse();
		HttpServletRequest request = ServletActionContext.getRequest();
		PrintWriter pw=null;
			
		try {
			pw = response.getWriter();
			pa.setCreateTime(new Date());
			User user = (User) request.getSession().getAttribute("user");
			pa.setCreateUser(user.getName());
			this.punishAppealManager.addPunishAppeal(pa);
			pw.print("succeed");
		}catch (Exception e) {
			log.error("添加惩罚诉求异常", e);
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
	 * 修改惩罚诉求
	 */
	public void modifyPunishAppeal(){
		HttpServletResponse response = ServletActionContext.getResponse();
		HttpServletRequest request = ServletActionContext.getRequest();
		PrintWriter pw=null;
			
		try {
			pw = response.getWriter();
			pa.setUpdateTime(new Date());
			User user = (User) request.getSession().getAttribute("user");
			pa.setUpdateUser(user.getName());
			this.punishAppealManager.modifyPunishAppeal(pa);
			pw.print("succeed");
		}catch (Exception e) {
			log.error("修改惩罚诉求异常", e);
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
			pa = this.punishAppealManager.getPunishAppealById(pa.getId());

			pw.print(pa.getPwa().getId());
			
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
	
	public void deletePunishAppeal()
	{
		HttpServletResponse response = ServletActionContext.getResponse();
		PrintWriter pw=null;
		try {
			pw = response.getWriter();
			this.punishAppealManager.deletePunishAppeal(pa.getId());

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
	

}
