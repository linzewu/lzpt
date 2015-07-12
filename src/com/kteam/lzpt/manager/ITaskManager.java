package com.kteam.lzpt.manager;

import java.util.Date;
import java.util.List;

import com.kteam.lzpt.entity.Task;
import com.kteam.lzpt.entity.TaskProcess;

public interface ITaskManager {
	
	public final static int ENDDATE_TYPE=0;
	
	public final static int LASTDATE_TYPE=1;
	
	public void addTask(Task task);
	
	public void modifyTask(Task task);
	
	public void deleteTask(String id);
	
	public Task getTaskById(String taskId);
	
	public List<Task> getTaskByTemplate(Task task,int pageSize,int pageNumber);
	
	public Integer getTaskTotal(Task task);
	
	public List<Task> getTaskProcessByUnitId(String unitId,int processState);
	
	public void modifyTaskProcess(TaskProcess taskProcess);
	
	public TaskProcess getUnitTaskProcessByTaskId(String unitId,String taskId);
	
	public TaskProcess getTaskProcessByid(String id);
	
	public List<TaskProcess> getTaskProcessByWorkItem(String workItemId,int processState);
	
	public List<Object> getUnitFileByKey(String unitId);
	
	//通过时间和单位搜索文件
	public List<Object> getUnitFileByKey(String unitId,Date startTime,Date endTime);
	
	public List<Task> getOverdueTaskByTime(int day,int type) throws Exception;
	
	
	public List<TaskProcess> getTaskProcess(int processState,int pageSize,
			 int pageNumber);
	
	public List<TaskProcess> getTaskProcessByState(int processState);
	
	public List getYearCheck(int year);
	
	public List getYearOfWorkItemAvg(int year);
	

}
