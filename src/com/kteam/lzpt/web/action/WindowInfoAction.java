package com.kteam.lzpt.web.action;

import java.io.PrintWriter;
import java.util.Date;
import java.util.List;

import javax.servlet.http.HttpServletResponse;

import net.sf.json.JSONArray;
import net.sf.json.JsonConfig;
import net.sf.json.util.PropertyFilter;

import org.apache.struts2.ServletActionContext;

import com.kteam.lzpt.common.DateJsonValueProcessor;
import com.kteam.lzpt.entity.WindowInfo;
import com.kteam.lzpt.manager.IWindowInfoManager;

public class WindowInfoAction extends BaseAction {
	
	private WindowInfo wi;
	
	private IWindowInfoManager wim;
	
	public WindowInfo getWi() {
		return wi;
	}

	public void setWi(WindowInfo wi) {
		this.wi = wi;
	}

	public IWindowInfoManager getWim() {
		return wim;
	}

	public void setWim(IWindowInfoManager wim) {
		this.wim = wim;
	}
	
	
	public void add(){
		
		HttpServletResponse response = ServletActionContext.getResponse();
		response.setCharacterEncoding("UTF-8");
		PrintWriter pw = null;
		try {
			pw = response.getWriter();
			wim.addWindowInfo(wi);
			pw.print("success");
		} catch (Exception e) {
			if (pw != null) {
				pw.print("error");
			}
			log.error("添加任务出错", e);
		}
	}
	
	public void modify() {
		HttpServletResponse response = ServletActionContext.getResponse();
		response.setCharacterEncoding("UTF-8");
		PrintWriter pw = null;
		try {
			pw = response.getWriter();
			
			String name=wi.getName();
			
			wi=wim.getWindowInfoById(wi.getId());
			wi.setName(name);
			wi.setUpdateTime(new Date());
			
			wim.modifyWindowInfo(wi);
			pw.print("success");
		} catch (Exception e) {
			if (pw != null) {
				pw.print("error");
			}
			log.error("修改任务出错", e);
		}

	}
	
	public void getList(){
		
		HttpServletResponse response = ServletActionContext.getResponse();
		response.setCharacterEncoding("UTF-8");
		PrintWriter pw = null;
		try {
			pw = response.getWriter();
			
			
			List<WindowInfo> wis = wim.getWindowInfos();
			
			JsonConfig config = new JsonConfig();
			config.setJsonPropertyFilter(new PropertyFilter() {			
				@Override
				public boolean apply(Object arg0, String arg1, Object arg2) {
					if(arg1.equals("id")||arg1.equals("name")||arg1.equals("state")){
						return false;
					}else{
						return true;
					}
				}
			});
		
			JSONArray ja = JSONArray.fromObject(wis, config);
			
			pw.print(ja);
			
		} catch (Exception e) {
			if (pw != null) {
				pw.print("error");
			}
			log.error("查询列表出错", e);
		}
	}
	
	public void modifyState(){
		HttpServletResponse response = ServletActionContext.getResponse();
		response.setCharacterEncoding("UTF-8");
		PrintWriter pw = null;
		try {
			pw = response.getWriter();
			
			int state=wi.getState();
			
			wi=wim.getWindowInfoById(wi.getId());
			wi.setUpdateTime(new Date());
			wi.setState(state);
			wim.modifyWindowInfo(wi);
			pw.print("success");
		} catch (Exception e) {
			if (pw != null) {
				pw.print("error");
			}
			log.error("修改任务出错", e);
		}
		
	}
	

}
