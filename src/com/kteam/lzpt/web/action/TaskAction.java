package com.kteam.lzpt.web.action;

import java.io.PrintWriter;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Calendar;
import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import net.sf.json.JSONArray;
import net.sf.json.JSONObject;
import net.sf.json.JsonConfig;
import net.sf.json.util.PropertyFilter;

import org.apache.struts2.ServletActionContext;
import org.hibernate.Hibernate;

import com.kteam.lzpt.common.DateJsonValueProcessor;
import com.kteam.lzpt.entity.Role;
import com.kteam.lzpt.entity.Task;
import com.kteam.lzpt.entity.TaskProcess;
import com.kteam.lzpt.entity.User;
import com.kteam.lzpt.entity.WorkArchive;
import com.kteam.lzpt.manager.ITaskManager;

public class TaskAction extends BaseAction {
	 
	private ITaskManager taskManager;
	
	private TaskProcess taskProcess;

	private Task task;
	
	private String units;
	
	private int score;
	
	private String scoreRemark;
	

	public String getUnits() {
		return units;
	}

	public void setUnits(String units) {
		this.units = units;
	}

	public ITaskManager getTaskManager() {
		return taskManager;
	}

	public void setTaskManager(ITaskManager taskManager) {
		this.taskManager = taskManager;
	}

	public Task getTask() {
		return task;
	}

	public void setTask(Task task) {
		this.task = task;
	}

	public TaskProcess getTaskProcess() {
		return taskProcess;
	}

	public void setTaskProcess(TaskProcess taskProcess) {
		this.taskProcess = taskProcess;
	}

	public int getScore() {
		return score;
	}

	public void setScore(int score) {
		this.score = score;
	}

	public String getScoreRemark() {
		return scoreRemark;
	}

	public void setScoreRemark(String scoreRemark) {
		this.scoreRemark = scoreRemark;
	}

	public void addTask() {
		HttpServletResponse response = ServletActionContext.getResponse();
		response.setCharacterEncoding("UTF-8");
		PrintWriter pw = null;
		try {
			pw = response.getWriter();
			this.taskManager.addTask(task);
			pw.print("succeed");
		} catch (Exception e) {
			if (pw != null) {
				pw.print("error");
			}
			log.error("添加任务出错", e);
		}

	}

	public void modifyTask() {
		HttpServletResponse response = ServletActionContext.getResponse();
		response.setCharacterEncoding("UTF-8");
		PrintWriter pw = null;
		try {
			this.taskManager.modifyTask(task);
			pw = response.getWriter();
			pw.print("succeed");
		} catch (Exception e) {
			if (pw != null) {
				pw.print("error");
			}
			log.error("修改任务出错", e);
		}

	}
	
	
	public void deleteTask(){
		HttpServletResponse response = ServletActionContext.getResponse();
		response.setCharacterEncoding("UTF-8");
		PrintWriter pw = null;
		try {
			this.taskManager.deleteTask(task.getId());
			pw = response.getWriter();
			pw.print("success");
		} catch (Exception e) {
			if (pw != null) {
				pw.print("error");
			}
			log.error("删除任务出错", e);
		}
	}

	public void getTasks() {

		HttpServletResponse response = ServletActionContext.getResponse();
		response.setCharacterEncoding("UTF-8");
		PrintWriter pw = null;
		try {
			pw = response.getWriter();
			List<Task> tasks = this.taskManager.getTaskByTemplate(task, rows,
					page);
//			tasks = clearTaskLazy(tasks);
			JsonConfig config = new JsonConfig();
			config.registerJsonValueProcessor(Date.class,  
			          new DateJsonValueProcessor("yyyy-MM-dd"));
			config.setJsonPropertyFilter(new PropertyFilter() {			
				@Override
				public boolean apply(Object arg0, String arg1, Object arg2) {
					
					if(arg1.equals("id")||arg1.equals("title")||arg1.equals("tasksProcess")
							||arg1.equals("status")||arg1.equals("units")||arg1.equals("wname")
							||arg1.equals("unit")
							||arg1.equals("startDate")||arg1.equals("endDate")
							||arg1.equals("processState")
							||arg1.equals("score")||arg1.equals("scoreRemark")){
						
						return false;
					}else{
						return true;
					}
				}
			});
			JSONArray ja = JSONArray.fromObject(tasks,config);
			Map<String, Object> jsonMap = new HashMap<String, Object>();

			jsonMap.put("total", taskManager.getTaskTotal(task));
			jsonMap.put("rows", ja);
		
			pw.print(JSONObject.fromObject(jsonMap));
		} catch (Exception e) {
			if (pw != null) {
				pw.print("error");
			}
			log.error("查询任务列表出错", e);
		}
	}

	public String getTaskByid() {
		try {
			task = this.taskManager.getTaskById(task.getId());
		} catch (Exception e) {
			
			log.error("查询任务详细出错", e);
		}
		return this.getPageName();

	}
	
	
	public void modifyUploadFileToTask(){
		
		HttpServletResponse response = ServletActionContext.getResponse();
		response.setCharacterEncoding("UTF-8");
		PrintWriter pw = null;
		try{
			pw = response.getWriter();
			
			String temp=this.getTask().getFilesToJson();
			
			this.task=this.getTaskManager().getTaskById(task.getId());
			
			this.task.setFilesToJson(temp);
			this.getTaskManager().modifyTask(this.task);
			
			pw.print("success");
			
		}catch (Exception e) {
			if(pw!=null){
				pw.print("error");
			}
			log.error("同步删除文件出错", e);
		}
	}
	
	public void modifyTaskUnits(){
		
		HttpServletResponse response = ServletActionContext.getResponse();
		response.setCharacterEncoding("UTF-8");
		PrintWriter pw = null;
		
		try{
			pw = response.getWriter();
			
			List<WorkArchive> unitList=new ArrayList<WorkArchive>();
			
			if(!"".equals(units.trim())){
				
				String[] temp = units.trim().split(",");
				
				for(String unitId:temp){
					WorkArchive wa=new WorkArchive();
					wa.setId(unitId);
					unitList.add(wa);
				}
			}
			
			this.task=this.getTaskManager().getTaskById(task.getId());
			
			
			this.task.setUnits(unitList);
			
			this.getTaskManager().modifyTask(this.task);
			
			pw.print("success");
		}catch (Exception e) {
			if(pw!=null){
				pw.print("error");
			}
			log.error("同步删除文件出错", e);
		}
		
	}
	
	
	public void pushTask(){
		
		HttpServletResponse response = ServletActionContext.getResponse();
		response.setCharacterEncoding("UTF-8");
		PrintWriter pw = null;
		
		try{
			pw = response.getWriter();
			
			Integer status = this.task.getStatus();
			
			this.task=this.getTaskManager().getTaskById(task.getId());
			
			List<TaskProcess> tps=new ArrayList<TaskProcess>();
			
			
			for(WorkArchive unit: task.getUnits()){
				TaskProcess tp=new TaskProcess();
				tp.setTask(task);
				tp.setUnit(unit);
				tps.add(tp);
			}
			
			this.task.setTasksProcess(tps);
			
			this.task.setStatus(status);
			
			this.getTaskManager().modifyTask(this.task);
			
			pw.print("success");
		}catch (Exception e) {
			if(pw!=null){
				pw.print("error");
			}
			log.error("修改任务状态出错", e);
		}
		
	}
	
	
	public void getTaskUnit(){
		
		HttpServletResponse response = ServletActionContext.getResponse();
		response.setCharacterEncoding("UTF-8");
		PrintWriter pw = null;
		
		try{
			pw = response.getWriter();
			
			this.task=this.getTaskManager().getTaskById(task.getId());
			
			List<WorkArchive> unitsList = this.task.getUnits();
			
			if(unitsList==null)
				unitsList=new ArrayList<WorkArchive>();
			
			JsonConfig config = new JsonConfig();
			config.setJsonPropertyFilter(new PropertyFilter() {			
				@Override
				public boolean apply(Object arg0, String arg1, Object arg2) {
					if (arg1.equals("caList") || arg1.equals("wsList")
							|| arg1.equals("wimList") || arg1.equals("subWorkArchives")) {
						return true;
					} else {
						return false;
					}			
				}
			});
			JSONArray ja = JSONArray.fromObject(unitsList,config);
			pw.print(ja.toString());
		}catch (Exception e) {
			if(pw!=null){
				pw.print("error");
			}
			log.error("同步删除文件出错", e);
		}
	}
	
	public void getTaskProcessByUserUnit(){
		HttpSession session = ServletActionContext.getRequest().getSession();
		HttpServletResponse response = ServletActionContext.getResponse();
		response.setCharacterEncoding("UTF-8");
		PrintWriter pw = null;
		try{
			pw=response.getWriter();
			
			User user =(User)session.getAttribute("user");
			
			boolean flag=false;
			
			for(Role role:user.getRoles()){
				if(role.getRoleName().equals(Role.ROLE_UNIT_MANAGER)){
					flag=true;
				}
			}
			
			if(flag){
				
				
			List<Task>  tps = this.getTaskManager().getTaskProcessByUnitId(user.getUnitId(),taskProcess.getProcessState());
				
				
				JsonConfig config = new JsonConfig();
				config.setJsonPropertyFilter(new PropertyFilter() {			
					@Override
					public boolean apply(Object arg0, String arg1, Object arg2) {
						if (arg1.equals("units")||arg1.equals("tasksProcess")||arg1.equals("workItem")) {
							return true;
						} else {
							return false;
						}
					}
				});
				JSONArray ja = JSONArray.fromObject(tps,config);
				pw.print(ja.toString());
			}
		}catch (Exception e) {
			if(pw!=null){
				pw.print("error");
			}
			log.error("查询处理任务列表出错", e);
			
		}
	}
	
	public void getTaskProcessByWorkItem(){
		
		HttpServletResponse response = ServletActionContext.getResponse();
		response.setCharacterEncoding("UTF-8");
		PrintWriter pw = null;
		try{
			pw=response.getWriter();
			
			List<TaskProcess>  tps = this.getTaskManager().getTaskProcessByWorkItem(task.getWorkItem().getId(),taskProcess.getProcessState());
			
			JsonConfig config = new JsonConfig();
			config.setJsonPropertyFilter(new PropertyFilter() {			
				@Override
				public boolean apply(Object arg0, String arg1, Object arg2) {
					
					if(arg0 instanceof TaskProcess&&!arg1.equals("task")){
						return false;
					}else if(arg0 instanceof WorkArchive && arg1.equals("wname") ){
						return false;
					}else if (arg0 instanceof Date){
						return false;
					}else{
						return true;
					}

				}
			});
			JSONArray ja = JSONArray.fromObject(tps,config);
			pw.print(ja.toString());
			
		}catch (Exception e) {
			if(pw!=null){
				pw.print("error");
			}
			log.error("查询处理任务列表出错", e);
			
		}
		
	}
	
	public void addTaskProcess(){
		HttpSession session = ServletActionContext.getRequest().getSession();
		HttpServletResponse response = ServletActionContext.getResponse();
		response.setCharacterEncoding("UTF-8");
		PrintWriter pw = null;
		try{
			User user =(User)session.getAttribute("user");
			pw=response.getWriter();
			
			TaskProcess tp =taskManager.getUnitTaskProcessByTaskId(user.getUnitId(), taskProcess.getTask().getId());
			
			if(tp!=null&&tp.getId()!=null){
				
				tp.setProcessContext(taskProcess.getProcessContext());
				
				tp.setProcessDate(new Date());
				
				tp.setProcessfilesJson(taskProcess.getProcessfilesJson());
				
				tp.setProcessRemark(taskProcess.getProcessRemark());
				
				tp.setProcessState(taskProcess.getProcessState());
				
				tp.setProcessTitle(taskProcess.getProcessTitle());
				
				Task task = tp.getTask();
				
				int systemScore = toCountScore(task);
				
				tp.setSystemScore(systemScore);
				
				this.taskManager.modifyTaskProcess(tp);
				
				List<TaskProcess> tps = task.getTasksProcess();
				
				boolean flag=true;
				
				for(TaskProcess t :tps){
					if(t.getProcessState()==0){
						flag=false;
						break;
					}
				}
				
				if(flag){
					task=tp.getTask();
					task.setStatus(Task.STATUS_OVER);
					this.taskManager.modifyTask(task);
				}
				
			}
			else{
				throw new Exception("无法找到该数据");
			}
			
			
			pw.print("success");
		}catch (Exception e) {
			if(pw!=null){
				pw.print("error");
			}
			log.error(e);
		}
		
	}
	
	/**
	 * 计算分数
	 * @param task
	 * @return
	 */
	private  int toCountScore(Task task){
		
		int systemScore=0;
		
		Date date=new Date();
		
		Calendar endCalendar = Calendar.getInstance();
		
//		Calendar lastCalendar = Calendar.getInstance();
		
		
		endCalendar.setTime(task.getEndDate());
		
//		lastCalendar.setTime(task.getLastDate());
		
		
//		lastCalendar.add(Calendar.DAY_OF_MONTH, 1);
		//最后期限的第二天凌晨，也就是超过期限的时刻
		endCalendar.add(Calendar.DAY_OF_MONTH, 1);
		
		if(date.getTime() < endCalendar.getTime().getTime()){
			systemScore=Task.SYSTEMSCORE;
		}else{
			systemScore=((Double)(Task.SYSTEMSCORE*(task.getPercentage()/100.0))).intValue();
		}
		return systemScore;
	}
	
	public String getTaskAndProcessByid(){
		HttpSession session = ServletActionContext.getRequest().getSession();
		
		User user =(User)session.getAttribute("user");
		
		taskProcess = this.taskManager.getUnitTaskProcessByTaskId(user.getUnitId(), task.getId());
		
		Hibernate.initialize(taskProcess.getTask());
		
		return this.getPageName();
		
	}
	
	
	public String getTaskProcessByid(){
		
		taskProcess = this.taskManager.getTaskProcessByid(taskProcess.getId());
		
		Hibernate.initialize(taskProcess.getTask());
		
		return this.getPageName();
	}
	
	
	
	public void searchFile(){
		HttpServletResponse response = ServletActionContext.getResponse();
		response.setCharacterEncoding("UTF-8");
		PrintWriter pw = null;
		try{
			pw=response.getWriter();
			 HttpServletRequest  request = ServletActionContext.getRequest();
			 
			 String unitId = request.getParameter("unitId");
			 
			 String key=request.getParameter("key");
			 
			 String startTimeStr=request.getParameter("startTime");
			 
			 String endTimeStr=request.getParameter("endTime");
			 
			 
			 if(null!=unitId){
				 List<Object> files=null; 
				if((null!=startTimeStr&&!"".equals(startTimeStr))||(endTimeStr!=null&&!"".equals(endTimeStr))){
					
					SimpleDateFormat sdf=new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
					
					Date startTime=null;
					
					Date endTime=null;
					
					if(null!=startTimeStr){
						startTimeStr+=" 00:00:01";
						startTime=sdf.parse(startTimeStr);
					}
					if(null!=endTimeStr){
						
						endTime=sdf.parse(endTimeStr+" 23:59:59");
					}
					
					files = this.taskManager.getUnitFileByKey(unitId,startTime,endTime);
				}else{
					files = this.taskManager.getUnitFileByKey(unitId);
				}
				
				JSONArray ja=null;
				
				ja=new JSONArray();
				for(Object o:files){
					
					Object[] os=(Object[])o;
					
					JSONArray temps = JSONArray.fromObject(os[0]);
						
					for(int i=0;i<temps.size();i++){
						
						JSONObject temp=temps.getJSONObject(i);
						
						String tempStmp=temp.toString();
						
						if(null!=temp&&!"".equals(tempStmp)&&!"[null]".equals(tempStmp)&&!"null".equals(tempStmp)){
							
							temp.put("uploadTime", os[1]);
							
							String fileName = temp.getString("filename");
							if(null==key||"".equals(key.trim())){
								ja.add(temps.getJSONObject(i));
							}else{
								if(fileName.contains(key)){
									ja.add(temps.getJSONObject(i));
								}
							}
							
						}
					}
				}
				pw.print(ja.toString());
			 }
		 
		}catch (Exception e) {
			log.error("搜索文件出错",e);
		}
	}
	
	//更新分数
	public void updateScore()
	{
		HttpServletResponse response = ServletActionContext.getResponse();
		response.setCharacterEncoding("UTF-8");
		PrintWriter pw = null;
		try{
			pw=response.getWriter();
			
			taskProcess = taskManager.getTaskProcessByid(taskProcess.getId());
			taskProcess.setScore(score);
			taskProcess.setScoreRemark(scoreRemark);
			taskProcess.setProcessState(TaskProcess.STATE_PROCESSSCORE);
			
			taskManager.modifyTaskProcess(taskProcess);
			pw.print("success");
		}catch(Exception e)
		{
			pw.print("error");
			log.error(e.toString());
		}
	}

}
