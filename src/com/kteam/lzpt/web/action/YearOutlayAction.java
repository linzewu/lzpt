package com.kteam.lzpt.web.action;

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
import net.sf.json.util.PropertyFilter;

import org.apache.struts2.ServletActionContext;

import com.kteam.lzpt.common.DateJsonValueProcessor;
import com.kteam.lzpt.entity.YearOutlay;
import com.kteam.lzpt.entity.User;
import com.kteam.lzpt.manager.IYearOutlayManager;

public class YearOutlayAction extends BaseAction {
	
	private IYearOutlayManager yom;
	
	private YearOutlay yo;	
	
	private String uname;
	
	private int year1;
	private int year2;
	private String waid;
	

	public IYearOutlayManager getYom() {
		return yom;
	}

	public void setYom(IYearOutlayManager yom) {
		this.yom = yom;
	}

	public YearOutlay getYo() {
		return yo;
	}

	public void setYo(YearOutlay yo) {
		this.yo = yo;
	}

	public String getUname() {
		return uname;
	}

	public void setUname(String uname) {
		this.uname = uname;
	}	

	public int getYear1() {
		return year1;
	}

	public void setYear1(int year1) {
		this.year1 = year1;
	}

	public int getYear2() {
		return year2;
	}

	public void setYear2(int year2) {
		this.year2 = year2;
	}

	public String getWaid() {
		return waid;
	}

	public void setWaid(String waid) {
		this.waid = waid;
	}

	/**
	 * 添加年度经费
	 */
	public void addYearOutlay()
	{
		HttpServletRequest request = ServletActionContext.getRequest();
		HttpServletResponse response = ServletActionContext.getResponse();
		PrintWriter pw = null;
		try
		{
			pw = response.getWriter();
			yo.setCreateTime(new Date());
			User user = (User) request.getSession().getAttribute("user");
			yo.setCreateUser(user.getUserName());
			yom.addYearOutlay(yo);
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
	 * 修改年度经费
	 */
	public void modifyYearOutlay()
	{
		HttpServletRequest request = ServletActionContext.getRequest();
		HttpServletResponse response = ServletActionContext.getResponse();
		PrintWriter pw = null;
		try
		{
			pw = response.getWriter();
			yo.setUpdateTime(new Date());
			User user = (User) request.getSession().getAttribute("user");
			yo.setUpdateUser(user.getUserName());
			yom.modifyYearOutlay(yo);
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
	 * 删除年度经费
	 */
	public void deleteYearOutlay()
	{
		
		HttpServletResponse response = ServletActionContext.getResponse();
		PrintWriter pw = null;
		try
		{
			pw = response.getWriter();

			yom.deleteYearOutlay(yo.getId());
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
	 * 查询年度经费列表
	 */
	public void queryYearOutlays()
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
			List list = yom.getYearOutlays(yo, rows, page,uname);
			JSONArray ja = JSONArray.fromObject(list,js);
			JSONObject jo = new JSONObject();
			
			jo.put("total", yom.getYearOutlayCount(yo,uname));
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
	 * 根据id查询年度经费列表
	 * @return
	 */
	public String getYearOutlayById()
	{
		HttpServletResponse response = ServletActionContext.getResponse();
		HttpServletRequest request = ServletActionContext.getRequest();
		String returl = request.getParameter("reqUrl");
		
		try {
			yo = this.yom.getYearOutlayById(yo.getId());
			System.out.println(yo.getWa().getWname());
		} catch (Exception e) {
			// TODO Auto-generated catch block
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
	 * 修改年度经费状态
	 */
	public void pushYearOutlay(){
		
		HttpServletResponse response = ServletActionContext.getResponse();
		response.setCharacterEncoding("UTF-8");
		PrintWriter pw = null;
		
		try{
			pw = response.getWriter();
			
			Integer status = this.yo.getState();
			
			this.yo=this.yom.getYearOutlayById(yo.getId());
			
			
			
			this.yo.setState(status);
			this.yo.setPublicTime(new Date());
			
			this.yom.modifyYearOutlay(yo);
			
			pw.print("success");
		}catch (Exception e) {
			if(pw!=null){
				pw.print("error");
			}
			log.error("修改任务状态出错", e);
		}
		
	}
	
	/**
	 * 查询年度经费对比
	 */
	public void getYearOutlayCompare()
	{
		HttpServletResponse response = ServletActionContext.getResponse();
		response.setCharacterEncoding("UTF-8");
		PrintWriter pw = null;
		try
		{
			pw = response.getWriter();
			List l = yom.getYearOutlayCompare(year1, year2, waid, uname);
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

}
