package com.kteam.lzpt.web.action;

import java.io.PrintWriter;
import java.util.List;

import javax.servlet.http.HttpServletResponse;

import net.sf.json.JSONArray;

import org.apache.struts2.ServletActionContext;

import com.kteam.lzpt.manager.ITaskManager;

public class CaseCheckAction extends BaseAction {
	
	private ITaskManager taskManager;	
	private int year;
	
	public ITaskManager getTaskManager() {
		return taskManager;
	}

	public void setTaskManager(ITaskManager taskManager) {
		this.taskManager = taskManager;
	}
	
	public int getYear() {
		return year;
	}

	public void setYear(int year) {
		this.year = year;
	}

	/**
	 * 乡镇廉政年度综合考核
	 */
	public void xzYearCheck()
	{
		HttpServletResponse response = ServletActionContext.getResponse();
		response.setCharacterEncoding("UTF-8");
		PrintWriter pw = null;
		try
		{
			pw = response.getWriter();
			List l = taskManager.getYearCheck(year);
			JSONArray ja = JSONArray.fromObject(l);
			pw.print(ja.toString());
			
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
	
	
	public void xzYearAvg(){
		
		HttpServletResponse response = ServletActionContext.getResponse();
		response.setCharacterEncoding("UTF-8");
		PrintWriter pw = null;
		try
		{
			pw = response.getWriter();
			
			List l = taskManager.getYearOfWorkItemAvg(year);
			JSONArray ja = JSONArray.fromObject(l);
			pw.print(ja.toString());
			
			System.out.println(ja);
			
			
			
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
