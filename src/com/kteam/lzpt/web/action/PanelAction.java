package com.kteam.lzpt.web.action;

import java.io.PrintWriter;
import java.util.Date;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import net.sf.json.JSONArray;
import net.sf.json.JsonConfig;
import net.sf.json.util.PropertyFilter;

import org.apache.struts2.ServletActionContext;

import com.kteam.lzpt.entity.Task;
import com.kteam.lzpt.entity.TaskProcess;
import com.kteam.lzpt.manager.ITaskManager;

public class PanelAction extends BaseAction {

	private ITaskManager taskManager;
	
	public final static int N=10;
	
	private int processState;

	public ITaskManager getTaskManager() {
		return taskManager;
	}

	public void setTaskManager(ITaskManager taskManager) {
		this.taskManager = taskManager;
	}

	public int getProcessState() {
		return processState;
	}

	public void setProcessState(int processState) {
		this.processState = processState;
	}

	public void getOverdueTask() throws Exception {
		HttpServletResponse response = ServletActionContext.getResponse();
		
		HttpServletRequest request=ServletActionContext.getRequest();
		
		response.setCharacterEncoding("UTF-8");
		PrintWriter pw = null;

		try {
			pw = response.getWriter();
			
			
			String type = request.getParameter("type");
			
			List<Task> tasks=null;
			
			if("1".equals(type)){
				tasks = taskManager.getOverdueTaskByTime(14,ITaskManager.LASTDATE_TYPE);
			}else{
				tasks = taskManager.getOverdueTaskByTime(14,ITaskManager.ENDDATE_TYPE);
			}
			
			
			
			JsonConfig config = new JsonConfig();
			config.setJsonPropertyFilter(new PropertyFilter() {			
				@Override
				public boolean apply(Object arg0, String arg1, Object arg2) {
					if(arg1.equals("id")||arg1.equals("title")){
						return false;
					}else{
						return true;
					}			
				}
			});
			
			
			JSONArray jsonTask=JSONArray.fromObject(tasks,config);
			
			pw.print(jsonTask.toString());
			
		} catch (Exception e) {
			if (pw != null) {
				pw.print("error");
			}
			log.error("查询过期任务出错", e);
		}

	}
	
	
	public void getProcessTaskTop_n(){
		
		HttpServletResponse response = ServletActionContext.getResponse();
		
		response.setCharacterEncoding("UTF-8");
		PrintWriter pw = null;
		

		try {
			pw = response.getWriter();
			
			List<TaskProcess> taskProcesses = this.taskManager.getTaskProcess(1,0,N);
			
			JsonConfig config = new JsonConfig();
			config.setJsonPropertyFilter(new PropertyFilter() {
				@Override
				public boolean apply(Object arg0, String arg1, Object arg2) {
					if(arg1.equals("id")||arg1.equals("processTitle")){
						return false;
					}else{
						return true;
					}		
				}
			});
			
			JSONArray jsonTaskProcess=JSONArray.fromObject(taskProcesses,config);
			pw.print(jsonTaskProcess.toString());
			
		} catch (Exception e) {
			if (pw != null) {
				pw.print("error");
			}
			log.error("查询最新上报任务任务出错", e);
		}
		
	}
	
	public void getTaskProcessByState()
	{
		HttpServletResponse response = ServletActionContext.getResponse();
		
		response.setCharacterEncoding("UTF-8");
		PrintWriter pw = null;
		try {
			pw = response.getWriter();
			List<TaskProcess> li = this.taskManager.getTaskProcessByState(processState);
			JsonConfig config = new JsonConfig();
			config.setJsonPropertyFilter(new PropertyFilter() {
				@Override
				public boolean apply(Object arg0, String arg1, Object arg2) {
					if(arg1.equals("id")||arg1.equals("processTitle")){
						return false;
					}else{
						return true;
					}		
				}
			});
			
			JSONArray jsonTaskProcess=JSONArray.fromObject(li,config);
			pw.print(jsonTaskProcess.toString());
			
		}
		catch(Exception e)
		{
			log.error(e.toString());
		}finally
		{
			if (null != pw)
			{
				pw.close();
			}
		}
	}

}
