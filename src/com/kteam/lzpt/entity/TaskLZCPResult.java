package com.kteam.lzpt.entity;

import java.util.Date;
import java.util.List;


public class TaskLZCPResult extends BaseEntity {
	
	private String id;
	
	private List<LeaderLZCP> leaders;
	
	//所属任务
	private TaskLZCP taskLZCP;
	
	//单位
	private WorkArchive unit;
	
	//备注
	private String remark;
	
	private Date resultDate;
	

	public String getRemark() {
		return remark;
	}

	public void setRemark(String remark) {
		this.remark = remark;
	}

	public String getId() {
		return id;
	}

	public void setId(String id) {
		this.id = id;
	}

	public TaskLZCP getTaskLZCP() {
		return taskLZCP;
	}

	public void setTaskLZCP(TaskLZCP taskLZCP) {
		this.taskLZCP = taskLZCP;
	}

	public WorkArchive getUnit() {
		return unit;
	}

	public void setUnit(WorkArchive unit) {
		this.unit = unit;
	}

	public Date getResultDate() {
		return resultDate;
	}

	public void setResultDate(Date resultDate) {
		this.resultDate = resultDate;
	}

	public List<LeaderLZCP> getLeaders() {
		return leaders;
	}

	public void setLeaders(List<LeaderLZCP> leaders) {
		this.leaders = leaders;
	}
	
}
