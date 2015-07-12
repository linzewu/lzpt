package com.kteam.lzpt.entity.leader.extend;

import java.util.Date;


public class FamilyCriminalResponsibilityInfo {
	
	private String id;
	
	private String leaderInfoId;
	
	//称谓
	private String appellation;
	
	//姓名
	private String name;
	
	//被追究时间
	private Date startDate; 
	
	//被追究的原因
	private String cause;
	
	//处理阶段
	private Integer processPhase;
	
	//处理结果
	private String processFruit;

	public String getId() {
		return id;
	}

	public void setId(String id) {
		this.id = id;
	}

	public String getLeaderInfoId() {
		return leaderInfoId;
	}

	public void setLeaderInfoId(String leaderInfoId) {
		this.leaderInfoId = leaderInfoId;
	}

	public String getAppellation() {
		return appellation;
	}

	public void setAppellation(String appellation) {
		this.appellation = appellation;
	}

	public String getName() {
		return name;
	}

	public void setName(String name) {
		this.name = name;
	}

	public Date getStartDate() {
		return startDate;
	}

	public void setStartDate(Date startDate) {
		this.startDate = startDate;
	}

	public String getCause() {
		return cause;
	}

	public void setCause(String cause) {
		this.cause = cause;
	}

	public Integer getProcessPhase() {
		return processPhase;
	}

	public void setProcessPhase(Integer processPhase) {
		this.processPhase = processPhase;
	}

	public String getProcessFruit() {
		return processFruit;
	}

	public void setProcessFruit(String processFruit) {
		this.processFruit = processFruit;
	}

	
	
}
