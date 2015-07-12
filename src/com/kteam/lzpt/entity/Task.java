package com.kteam.lzpt.entity;

import java.util.Date;
import java.util.List;

/**
 * 任务
 * @author Administrator
 *
 */
public class Task extends BaseEntity {
	
	public final static int STATUS_PUT=1;
	
	public final static int STATUS_NOT_PUT=0;
	
	public final static int STATUS_OVER=2;
	
	public final static int CYCLE_ONE=0;
	
	public final static int CYCLE_WEEK=1;
	
	public final static int CYCLE_MONTH=2;
	
	public final static int CYCLE_QUARTER=3;
	
	public final static int CYCLE_YEAR=4;
	
	public final static int SYSTEMSCORE=100;
	
	private String id;
	
	private String title;
	
	private String context;
	
	private String remark;
	
	private String filesToJson;
	
	private Date startDate;
	
	private Date endDate;
	
	private Date lastDate;
	
	private int status;
	
	//任务周期
	private int cycle;
	
	//没有按时完成
	private int delayFraction;
	
	private int type;
	
	//过期得分百分比
	private int percentage;
	
	private WorkItem workItem;
	
	private List<WorkArchive> units;
	
	private List<TaskProcess> tasksProcess;
	
	////////////////////非持久化数据/////////////////////////
	//是否查找归档任务
	private boolean isOver;
	
	
	public int getPercentage() {
		return percentage;
	}

	public void setPercentage(int percentage) {
		this.percentage = percentage;
	}

	public WorkItem getWorkItem() {
		return workItem;
	}

	public void setWorkItem(WorkItem workItem) {
		this.workItem = workItem;
	}

	public List<TaskProcess> getTasksProcess() {
		return tasksProcess;
	}

	public void setTasksProcess(List<TaskProcess> tasksProcess) {
		this.tasksProcess = tasksProcess;
	}

	public String getFilesToJson() {
		return filesToJson;
	}

	public void setFilesToJson(String filesToJson) {
		this.filesToJson = filesToJson;
	}

	
	public Date getLastDate() {
		return lastDate;
	}

	public void setLastDate(Date lastDate) {
		this.lastDate = lastDate;
	}

	

	public int getType() {
		return type;
	}

	public void setType(int type) {
		this.type = type;
	}

	public int getCycle() {
		return cycle;
	}
	
	

	public void setCycle(int cycle) {
		this.cycle = cycle;
	}

	public int getStatus() {
		return status;
	}

	public void setStatus(int status) {
		this.status = status;
	}

	public int getDelayFraction() {
		return delayFraction;
	}

	public void setDelayFraction(int delayFraction) {
		this.delayFraction = delayFraction;
	}

	public String getId() {
		return id;
	}

	public void setId(String id) {
		this.id = id;
	}

	public String getTitle() {
		return title;
	}

	public void setTitle(String title) {
		this.title = title;
	}

	public String getContext() {
		return context;
	}

	public void setContext(String context) {
		this.context = context;
	}

	public String getRemark() {
		return remark;
	}

	public void setRemark(String remark) {
		this.remark = remark;
	}


	public Date getStartDate() {
		return startDate;
	}

	public void setStartDate(Date startDate) {
		this.startDate = startDate;
	}

	public Date getEndDate() {
		return endDate;
	}

	public void setEndDate(Date endDate) {
		this.endDate = endDate;
	}

	public List<WorkArchive> getUnits() {
		return units;
	}

	public void setUnits(List<WorkArchive> units) {
		this.units = units;
	}

	public boolean isOver() {
		return isOver;
	}

	public void setOver(boolean isOver) {
		this.isOver = isOver;
	}
	
}
