package com.kteam.lzpt.web.action;

import java.io.PrintWriter;
import java.util.Date;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import net.sf.json.JSONArray;
import net.sf.json.JSONObject;
import net.sf.json.JsonConfig;
import net.sf.json.util.PropertyFilter;

import org.apache.struts2.ServletActionContext;

import com.kteam.lzpt.common.DateJsonValueProcessor;
import com.kteam.lzpt.entity.QuarterOutlay;
import com.kteam.lzpt.entity.User;
import com.kteam.lzpt.manager.IQuarterOutlayManager;

public class QuarterOutlayAction extends BaseAction {
	
	private IQuarterOutlayManager qom;
	
	private QuarterOutlay qo;	
	
	private String uname;
	
	public IQuarterOutlayManager getQom() {
		return qom;
	}

	public void setQom(IQuarterOutlayManager qom) {
		this.qom = qom;
	}

	public QuarterOutlay getQo() {
		return qo;
	}

	public void setQo(QuarterOutlay qo) {
		this.qo = qo;
	}
	

	public String getUname() {
		return uname;
	}

	public void setUname(String uname) {
		this.uname = uname;
	}

	/**
	 * 添加季度经费
	 */
	public void addQuarterOutlay()
	{
		HttpServletRequest request = ServletActionContext.getRequest();
		HttpServletResponse response = ServletActionContext.getResponse();
		PrintWriter pw = null;
		try
		{
			pw = response.getWriter();
			qo.setCreateTime(new Date());
			User user = (User) request.getSession().getAttribute("user");
			
			qo.setCreateUser(user.getUserName());
			qom.addQuarterOutlay(qo);
			pw.write("success");
		}catch(Exception e)
		{
			log.debug(e.toString());
			pw.write("error");
		}finally
		{
			if (null != pw)
			{
				pw.close();
			}
		}
	}
	
	/**
	 * 修改季度经费
	 */
	public void modifyQuarterOutlay()
	{
		HttpServletRequest request = ServletActionContext.getRequest();
		HttpServletResponse response = ServletActionContext.getResponse();
		PrintWriter pw = null;
		try
		{
			pw = response.getWriter();
			qo.setUpdateTime(new Date());
			User user = (User) request.getSession().getAttribute("user");
			qo.setUpdateUser(user.getUserName());
			qom.modifyQuarterOutlay(qo);
			pw.write("success");
		}catch(Exception e)
		{
			log.debug(e.toString());
			pw.write("error");
		}finally
		{
			if (null != pw)
			{
				pw.close();
			}
		}
	}
	
	/**
	 * 删除季度经费
	 */
	public void deleteQuarterOutlay()
	{
		
		HttpServletResponse response = ServletActionContext.getResponse();
		PrintWriter pw = null;
		try
		{
			pw = response.getWriter();

			qom.deleteQuarterOutlay(qo.getId());
			pw.write("success");
		}catch(Exception e)
		{
			log.debug(e.toString());
			pw.write("error");
		}finally
		{
			if (null != pw)
			{
				pw.close();
			}
		}
	}
	
	/**
	 * 查询季度经费列表
	 */
	public void queryQuarterOutlays()
	{
		
		HttpServletResponse response = ServletActionContext.getResponse();
		HttpServletRequest request = ServletActionContext.getRequest();
		response.setCharacterEncoding("UTF-8");
		PrintWriter pw = null;
		try
		{
			pw = response.getWriter();
			JsonConfig js = new JsonConfig();
			js.registerJsonValueProcessor(Date.class, new DateJsonValueProcessor());
			js.setJsonPropertyFilter(new PropertyFilter() {			
				@Override
				public boolean apply(Object arg0, String arg1, Object arg2) {
					if (arg1.equals("wa")) {
						return true;
					} else {
						return false;
					}			
				}
			});
			List<QuarterOutlay> list = qom.getQuarterOutlays(qo, rows, page,uname);
			
			
			for(QuarterOutlay q:list){
					q.setWaid(q.getWa().getId());
			}
			
			JSONArray ja = JSONArray.fromObject(list,js);
			JSONObject jo = new JSONObject();
			
			jo.put("total", qom.getQuarterOutlayCount(qo,uname));
			jo.put("rows", ja);
			
			pw.print(ja.toString());
		}catch(Exception e)
		{
			log.debug(e.toString());
			e.printStackTrace();
		}
		finally
		{
			if (null != pw)
			{
				pw.close();
			}
		}
	}
	
	/**
	 * 根据id查询季度经费列表
	 * @return
	 */
	public String getQuarterOutlayById()
	{
		HttpServletResponse response = ServletActionContext.getResponse();
		HttpServletRequest request = ServletActionContext.getRequest();
		String returl = request.getParameter("reqUrl");
		
		try {
			qo = this.qom.getQuarterOutlayById(qo.getId());
			qo.getWa().getId();
		} catch (Exception e) {
			e.printStackTrace();
			log.error(e.toString());
		}
		
		if ("toinfo".equals(returl))
		{
			return "toinfo";
			
		}
		else
		{		
			return "tomodify";
			
		}
		
	}
	
	/**
	 * 修改季度经费状态
	 */
	public void pushQuarterOutlay(){
		
		HttpServletResponse response = ServletActionContext.getResponse();
		response.setCharacterEncoding("UTF-8");
		PrintWriter pw = null;
		
		try{
			pw = response.getWriter();
			
			Integer status = this.qo.getState();
			
			this.qo=this.qom.getQuarterOutlayById(qo.getId());
			
			
			
			this.qo.setState(status);
			this.qo.setPublicTime(new Date());
			
			this.qom.modifyQuarterOutlay(qo);
			
			pw.print("success");
		}catch (Exception e) {
			if(pw!=null){
				pw.print("error");
			}
			log.error("修改任务状态出错", e);
		}
		
	}
	
	/**
	 * 查询三公经费支出监察
	 */
	public void getQueryOutlayCheck()
	{
		HttpServletResponse response = ServletActionContext.getResponse();
		response.setCharacterEncoding("UTF-8");
		PrintWriter pw = null;
		try
		{
			pw = response.getWriter();
			List l = qom.getQuarterOutlaysCheck(qo,uname);
			JSONArray ja = JSONArray.fromObject(l);
			pw.print(ja.toString());
			System.out.println(ja.toString());
		}catch(Exception e)
		{
			log.debug(e.toString());
		} finally
		{
			if (null != pw)
			{
				pw.close();
			}
		}
	}
	
	public void isQuarterExist()
	{
		HttpServletResponse response = ServletActionContext.getResponse();
		HttpServletRequest request = ServletActionContext.getRequest();
		response.setCharacterEncoding("UTF-8");
		PrintWriter pw = null;
		try
		{
			pw = response.getWriter();
			User user = (User) request.getSession().getAttribute("user");
			
			int count = qom.isQuarterExist(qo, user.getUserName());
			if (count > 0)
			{
				pw.print("false");
			}
			else
			{
				pw.print("true");
			}
			
		}catch(Exception e)
		{
			log.debug(e.toString());
		} finally
		{
			if (null != pw)
			{
				pw.close();
			}
		}
	}

}
