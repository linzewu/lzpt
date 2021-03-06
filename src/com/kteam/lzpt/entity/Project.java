package com.kteam.lzpt.entity;

import java.util.Date;

public class Project {
	private static final long serialVersionUID = 1L;
	
	public static final Integer CHECKED=1;
	
	public static final Integer UNCHECK=0;
	
	private Integer id;
	
	private String year;
	
	private Date createTime;
	
	private String unit;
	
	private String createUser;
	
	private Integer isCheck;
	
	private Integer projectType;
	
	private Date checkDate;
	
	private Float score;
	
	private Integer state;
	
	private String scoreInfo;
	
	private String checkInfo;
	
	
	
	
	public String getCheckInfo() {
		return checkInfo;
	}

	public void setCheckInfo(String checkInfo) {
		this.checkInfo = checkInfo;
	}

	public Project(){}
	
	public Project(String year,String unit,Double score){
		this.year=year;
		this.unit=unit;
		this.score=score.floatValue();
	}
	
	
	
	public String getScoreInfo() {
		return scoreInfo;
	}

	public void setScoreInfo(String scoreInfo) {
		this.scoreInfo = scoreInfo;
	}

	public Integer getState() {
		return state;
	}

	public void setState(Integer state) {
		this.state = state;
	}

	public Float getScore() {
		return score;
	}

	public void setScore(Float score) {
		this.score = score;
	}

	public Date getCheckDate() {
		return checkDate;
	}

	public void setCheckDate(Date checkDate) {
		this.checkDate = checkDate;
	}

	public Integer getId() {
		return id;
	}

	public void setId(Integer id) {
		this.id = id;
	}

	public String getYear() {
		return year;
	}

	public void setYear(String year) {
		this.year = year;
	}

	public Date getCreateTime() {
		return createTime;
	}

	public void setCreateTime(Date createTime) {
		this.createTime = createTime;
	}

	public String getUnit() {
		return unit;
	}

	public void setUnit(String unit) {
		this.unit = unit;
	}

	public String getCreateUser() {
		return createUser;
	}

	public void setCreateUser(String createUser) {
		this.createUser = createUser;
	}

	public Integer getIsCheck() {
		return isCheck;
	}

	public void setIsCheck(Integer isCheck) {
		this.isCheck = isCheck;
	}

	public Integer getProjectType() {
		return projectType;
	}

	public void setProjectType(Integer projectType) {
		this.projectType = projectType;
	}

	
 
	
}
