package com.kteam.lzpt.manager;

import java.util.List;

import com.kteam.lzpt.entity.LeaderLZCP;
import com.kteam.lzpt.entity.TaskLZCP;
import com.kteam.lzpt.entity.TaskLZCPResult;

public interface ITaskLZCPManager {
	
	public void addTaskLZCP(TaskLZCP tasklzcp);
	
	public void deleteTaskLZCP(String id);
	
	public void modify(TaskLZCP tasklzcp);
	
	public List<TaskLZCP> getTaskLZCP(TaskLZCP taskLZCP,int pageSize,int pageNo);
	
	public int getTaskLZCPTotal(TaskLZCP taskLZCP);
	
	public TaskLZCP getTaskLZCPById(String id);
	
	public void addTaskLZCPResult(TaskLZCPResult tlr);
	
	public List<TaskLZCPResult> getTaskLZCPResultsByUnit(String unitId,int state);
	
	public TaskLZCPResult getTaskLZCPResultById(String id);
	
	public void modifyTaskLZCPResult(TaskLZCPResult tlr);
	
	public void addLeaderLZCP(LeaderLZCP leaderLZCP);
	
	public void modifyLeaderLZCP(LeaderLZCP leaderLZCP);
	
	public List<LeaderLZCP> getLeaderLZCPByYear(String year);
	

}
