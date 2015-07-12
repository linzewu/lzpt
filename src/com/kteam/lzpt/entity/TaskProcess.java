package com.kteam.lzpt.entity;

import java.util.Date;

public class TaskProcess extends BaseEntity {
	
	public final static int STATE_PROCESS=1;
	
	public final static int STATE_NOT_PROCESS=0;
	
	public final static int STATE_PROCESSSCORE=2;
	
	private String id;
	
	private WorkArchive unit;
	
	private int processState;
	
	private String processTitle;
	
	private String processContext;
	
	private String processRemark;
	
	private String processfilesJson;
	
	private Date processDate;
	//所属任务
	private Task task;
	
	//系统分数 根据上报任务的时间来
	private int systemScore;
	
	//人工分数
	private int score;
	
	private String scoreRemark;
	

	public String getScoreRemark() {
		return scoreRemark;
	}

	public void setScoreRemark(String scoreRemark) {
		this.scoreRemark = scoreRemark;
	}

	public int getSystemScore() {
		return systemScore;
	}

	public void setSystemScore(int systemScore) {
		this.systemScore = systemScore;
	}

	public int getScore() {
		return score;
	}

	public void setScore(int score) {
		this.score = score;
	}

	public String getId() {
		return id;
	}

	public void setId(String id) {
		this.id = id;
	}

	public Date getProcessDate() {
		return processDate;
	}

	public void setProcessDate(Date processDate) {
		this.processDate = processDate;
	}

	public WorkArchive getUnit() {
		return unit;
	}

	public void setUnit(WorkArchive unit) {
		this.unit = unit;
	}

	public int getProcessState() {
		return processState;
	}

	public void setProcessState(int processState) {
		this.processState = processState;
	}

	

	public String getProcessTitle() {
		return processTitle;
	}

	public void setProcessTitle(String processTitle) {
		this.processTitle = processTitle;
	}

	
	
	public String getProcessContext() {
		return processContext;
	}

	public void setProcessContext(String processContext) {
		this.processContext = processContext;
	}

	public String getProcessRemark() {
		return processRemark;
	}

	public void setProcessRemark(String processRemark) {
		this.processRemark = processRemark;
	}


	public String getProcessfilesJson() {
		return processfilesJson;
	}

	public void setProcessfilesJson(String processfilesJson) {
		this.processfilesJson = processfilesJson;
	}

	public Task getTask() {
		return task;
	}

	public void setTask(Task task) {
		this.task = task;
	}
	
}
