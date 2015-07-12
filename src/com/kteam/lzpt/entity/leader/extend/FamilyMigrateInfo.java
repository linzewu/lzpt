package com.kteam.lzpt.entity.leader.extend;

import java.util.Date;


public class FamilyMigrateInfo {
	
	private String id;
	
	private String leaderInfoId;
	
	//称谓
	private String appellation;
	
	//姓名
	private String name;
	
	//移居国家（地区）
	private String migrateCountry;
	
	//移居类别
	private Integer migrateType; 
	
	//移居时间
	private Date migrateInfoDate;
	
	//移居城市
	private String migrateCity;

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

	public String getMigrateCountry() {
		return migrateCountry;
	}

	public void setMigrateCountry(String migrateCountry) {
		this.migrateCountry = migrateCountry;
	}

	public Integer getMigrateType() {
		return migrateType;
	}

	public void setMigrateType(Integer migrateType) {
		this.migrateType = migrateType;
	}

	public Date getMigrateInfoDate() {
		return migrateInfoDate;
	}

	public void setMigrateInfoDate(Date migrateInfoDate) {
		this.migrateInfoDate = migrateInfoDate;
	}

	public String getMigrateCity() {
		return migrateCity;
	}

	public void setMigrateCity(String migrateCity) {
		this.migrateCity = migrateCity;
	}
	
}
