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
import net.sf.json.JSONObject;
import net.sf.json.JsonConfig;


import org.apache.struts2.ServletActionContext;

import com.kteam.lzpt.common.DateJsonValueProcessor;

import com.kteam.lzpt.entity.SearchWay;
import com.kteam.lzpt.entity.User;
import com.kteam.lzpt.manager.SearchWayManager;

public class SearchWayAction extends BaseAction {
	
	private SearchWayManager searchWayManager;
	
	private SearchWay sw;

	public SearchWayManager getSearchWayManager() {
		return searchWayManager;
	}

	public void setSearchWayManager(SearchWayManager searchWayManager) {
		this.searchWayManager = searchWayManager;
	}

	public SearchWay getSw() {
		return sw;
	}

	public void setSw(SearchWay sw) {
		this.sw = sw;
	}
	
	/**
	 * 查询搜索方式
	 */
	public void querySearchWay()
	{
		PrintWriter pw = null;
		try {
			HttpServletResponse response = ServletActionContext.getResponse();
			response.setCharacterEncoding("UTF-8");
			
			pw = response.getWriter();
			List<SearchWay> searchWay= searchWayManager.querySearchWay(sw, rows,page);
			
			Map<String,Object> jsonMap = new HashMap<String,Object>();
			
			JsonConfig config = new JsonConfig();
			//转换日期格式
			config.registerJsonValueProcessor(Date.class, new DateJsonValueProcessor());
			
			/**过滤掉用户中的roles,powers属性
			config.setJsonPropertyFilter(new PropertyFilter() {			
				@Override
				public boolean apply(Object arg0, String arg1, Object arg2) {
					if (arg1.equals("cwsList") || arg1.equals("weList")
							|| arg1.equals("teList") || arg1.equals("rpList")
							|| arg1.equals("cimList") || arg1.equals("wa")) {
						return true;
					} else {
						return false;
					}			
				}
			});**/
			
			jsonMap.put("total", searchWayManager.getSearchWayTotal(sw));
			jsonMap.put("rows", searchWay);
			
			
			JSONObject jo = JSONObject.fromObject(jsonMap,config);
			pw.print(jo.toString());
		} catch (IOException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
			log.info(e.toString());
		}catch (Exception e) {
			// TODO: handle exception
			e.printStackTrace();
			log.info(e.toString());
		}finally
		{
			if (null != pw)
			{
				pw.close();
			}
		}
	}
	
	/**
	 * 添加搜索方式
	 */
	public void addSearchWay(){
		
		HttpServletResponse response = ServletActionContext.getResponse();
		HttpServletRequest request = ServletActionContext.getRequest();
		PrintWriter pw=null;
			
		try {
			pw = response.getWriter();
			sw.setCreateTime(new Date());
			User user = (User) request.getSession().getAttribute("user");
			sw.setCreateUser(user.getName());
			this.searchWayManager.addSearchWay(sw);
			pw.print("succeed");
		}catch (Exception e) {
			log.error("添加搜索方式异常", e);
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
	 * 更新搜索方式
	 */
	public void updateSearchWay(){
		
		HttpServletResponse response = ServletActionContext.getResponse();
		HttpServletRequest request = ServletActionContext.getRequest();
		PrintWriter pw=null;
			
		try {
			pw = response.getWriter();
			sw.setUpdateTime(new Date());
			User user = (User) request.getSession().getAttribute("user");
			sw.setUpdateUser(user.getName());
			this.searchWayManager.updateSearchWay(sw);
			pw.print("succeed");
		}catch (Exception e) {
			log.error("更新搜索方式异常", e);
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
	 * 查询所有搜索方式
	 */
	public void querySearchWays()
	{
		HttpServletResponse response = ServletActionContext.getResponse();
		response.setCharacterEncoding("UTF-8");
		PrintWriter pw = null;
		try {
			pw = response.getWriter();
			List<SearchWay> list = this.searchWayManager.querySearchWays();
			JSONArray ja = JSONArray.fromObject(list);
			pw.print(ja.toString());
		} catch (IOException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
			log.info(e.toString());
		}
		finally
		{
			if (null != pw)
			{
				pw.close();
			}
		}
	}
	
	

}
