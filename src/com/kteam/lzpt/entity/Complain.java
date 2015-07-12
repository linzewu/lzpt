package com.kteam.lzpt.entity;

import java.util.Date;

public class Complain {
	
	//主键
	private String id;
	
	//举报状态
	private Integer state;
	
	//举报人姓名
	private String createUserName;
	
	//举报账号
	private String createAccount;
	
	//举报时间
	private Date createDate;
	
	//单位
	private String unitName;
	
	//姓名
	private String name;
	
	//级别
	private Integer level;
	
	//职位
	private String duties;
	
	//举报类型
	private Integer complainType;
	
	//举报内容
	private String complainContext;
	
	//附件
	private String files;
	
	//法律
	private String law;
	
	//处理结结果
	private String processResults;
	
	//处理情况
	private String processInfo;
	
	
	public String getProcessResults() {
		return processResults;
	}

	public void setProcessResults(String processResults) {
		this.processResults = processResults;
	}

	public String getProcessInfo() {
		return processInfo;
	}

	public void setProcessInfo(String processInfo) {
		this.processInfo = processInfo;
	}

	public String getLaw() {
		return law;
	}

	public void setLaw(String law) {
		this.law = law;
	}

	public String getId() {
		return id;
	}

	public void setId(String id) {
		this.id = id;
	}

	public Integer getState() {
		return state;
	}

	public void setState(Integer state) {
		this.state = state;
	}

	public String getCreateUserName() {
		return createUserName;
	}

	public void setCreateUserName(String createUserName) {
		this.createUserName = createUserName;
	}

	public String getCreateAccount() {
		return createAccount;
	}

	public void setCreateAccount(String createAccount) {
		this.createAccount = createAccount;
	}

	public Date getCreateDate() {
		return createDate;
	}

	public void setCreateDate(Date createDate) {
		this.createDate = createDate;
	}

	public String getUnitName() {
		return unitName;
	}

	public void setUnitName(String unitName) {
		this.unitName = unitName;
	}

	public String getName() {
		return name;
	}

	public void setName(String name) {
		this.name = name;
	}

	public Integer getLevel() {
		return level;
	}

	public void setLevel(Integer level) {
		this.level = level;
	}

	public String getDuties() {
		return duties;
	}

	public void setDuties(String duties) {
		this.duties = duties;
	}

	public Integer getComplainType() {
		return complainType;
	}

	public void setComplainType(Integer complainType) {
		this.complainType = complainType;
	}

	public String getComplainContext() {
		return complainContext;
	}

	public void setComplainContext(String complainContext) {
		this.complainContext = complainContext;
	}

	public String getFiles() {
		return files;
	}

	public void setFiles(String files) {
		this.files = files;
	}

}
