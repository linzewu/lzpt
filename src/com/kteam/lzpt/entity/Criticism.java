package com.kteam.lzpt.entity;

import java.util.Date;


public class Criticism {
	
	//主键
	private String id;
	
	private String unit;
	
	private String jobNumber;
	
	private String contents;
	
	private Date startTime;
	
	private Integer stays;
	
	// Y:是     N：不是
	private String isClose;

	public String getId() {
		return id;
	}

	public void setId(String id) {
		this.id = id;
	}


	public String getUnit() {
		return unit;
	}

	public void setUnit(String unit) {
		this.unit = unit;
	}


	public String getContents() {
		return contents;
	}

	public void setContents(String contents) {
		this.contents = contents;
	}

	public Integer getStays() {
		return stays;
	}

	public void setStays(Integer stays) {
		this.stays = stays;
	}

	public String getIsClose() {
		return isClose;
	}

	public void setIsClose(String isClose) {
		this.isClose = isClose;
	}

	public Date getStartTime() {
		return startTime;
	}

	public void setStartTime(Date startTime) {
		this.startTime = startTime;
	}

	public String getJobNumber() {
		return jobNumber;
	}

	public void setJobNumber(String jobNumber) {
		this.jobNumber = jobNumber;
	}


}
