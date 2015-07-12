package com.kteam.lzpt.web.action;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import net.sf.json.JSONObject;
import net.sf.json.JsonConfig;

import org.apache.struts2.ServletActionContext;

import com.kteam.lzpt.common.DateJsonValueProcessor;
import com.kteam.lzpt.entity.KeyWordsConfig;
import com.kteam.lzpt.entity.SearchWay;
import com.kteam.lzpt.entity.User;
import com.kteam.lzpt.manager.IKeyWordsConfigManager;
import com.kteam.lzpt.manager.SearchWayManager;

public class KeyWordsConfigAction extends BaseAction {
	
	private IKeyWordsConfigManager keyWordsConfigManager;
	
	private KeyWordsConfig kw;
	
	private SearchWayManager searchWayManager;
	
	//搜索方式
	private String swid;

	public IKeyWordsConfigManager getKeyWordsConfigManager() {
		return keyWordsConfigManager;
	}

	public void setKeyWordsConfigManager(
			IKeyWordsConfigManager keyWordsConfigManager) {
		this.keyWordsConfigManager = keyWordsConfigManager;
	}

	public KeyWordsConfig getKw() {
		return kw;
	}

	public void setKw(KeyWordsConfig kw) {
		this.kw = kw;
	}	

	public String getSwid() {
		return swid;
	}

	public void setSwid(String swid) {
		this.swid = swid;
	}	

	public SearchWayManager getSearchWayManager() {
		return searchWayManager;
	}

	public void setSearchWayManager(SearchWayManager searchWayManager) {
		this.searchWayManager = searchWayManager;
	}

	/**
	 * 添加关键字
	 */
	public void addKeyWordsConfig()
	{
		HttpServletResponse response = ServletActionContext.getResponse();
		HttpServletRequest request = ServletActionContext.getRequest();
		PrintWriter pw=null;
		System.out.println(swid+"****************************************");
		String[] sids = swid.split(",");
		try {
			pw = response.getWriter();
			kw.setCreateTime(new Date());
			User user = (User) request.getSession().getAttribute("user");
			kw.setCreateUser(user.getName());
			List<SearchWay> swlist = this.searchWayManager.querySearchWaysById(sids);
			kw.setSwList(swlist);
			this.keyWordsConfigManager.addKeyWord(kw);
			pw.print("succeed");
		}catch (Exception e) {
			log.error("添加关键字异常", e);
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
	 * 更新关键字
	 */
	public void updateKeyWordsConfig(){
		
		HttpServletResponse response = ServletActionContext.getResponse();
		HttpServletRequest request = ServletActionContext.getRequest();
		PrintWriter pw=null;
		String[] sids = swid.split(",");	
		try {
			pw = response.getWriter();
			kw.setUpdateTime(new Date());
			User user = (User) request.getSession().getAttribute("user");
			kw.setUpdateUser(user.getName());
			List<SearchWay> swlist = this.searchWayManager.querySearchWaysById(sids);
			kw.setSwList(swlist);
			this.keyWordsConfigManager.updateKeyWord(kw);
			pw.print("succeed");
		}catch (Exception e) {
			log.error("更新关键字异常", e);
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
	 * 分页查询关键字
	 */
	public void queryKeyWordsConfig()
	{
		PrintWriter pw = null; 
		try {
			HttpServletResponse response = ServletActionContext.getResponse();
			response.setCharacterEncoding("UTF-8");
			
			pw = response.getWriter();
			List<KeyWordsConfig> keyWordsConfig= this.keyWordsConfigManager.queryKeyWordsConfig(kw, rows,page);
			
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
			
			jsonMap.put("total", this.keyWordsConfigManager.getKeyWordsConfigTotal(kw));
			jsonMap.put("rows", keyWordsConfig);
			
			
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
	
	public void deleteKeyWordsConfig()
	{
		PrintWriter pw = null;
		try {
			HttpServletResponse response = ServletActionContext.getResponse();
			response.setCharacterEncoding("UTF-8");
			pw = response.getWriter();
			keyWordsConfigManager.deleteKeyWord(kw.getId());
			
			pw.print("success");
		} catch (IOException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
			pw.print("false");
		}catch (Exception e) {
			// TODO: handle exception
			e.printStackTrace();
			pw.print("false");
		}finally
		{
			if (null != pw)
			{
				pw.close();
			}
		}
	}
	
	public String getKeyWordsConfigById()
	{
		kw = keyWordsConfigManager.getKeyWordById(kw.getId());
		
		return "keyWordInfo";
	}
	
	

}
