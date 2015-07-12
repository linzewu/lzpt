package com.kteam.lzpt.entity;

import java.util.Date;

public class GambleChecked {
	
	private String id;
	
	private String specialManageId;
	
	private Date checkedDate;
	
	private Date  gambleDate;
	
	private String address;
	
	private String personnel;
	
	private Double money;
	
	private Integer isExist;
	

	public Integer getIsExist() {
		return isExist;
	}

	public void setIsExist(Integer isExist) {
		this.isExist = isExist;
	}

	public Date getGambleDate() {
		return gambleDate;
	}

	public void setGambleDate(Date gambleDate) {
		this.gambleDate = gambleDate;
	}

	public String getAddress() {
		return address;
	}

	public void setAddress(String address) {
		this.address = address;
	}

	public String getPersonnel() {
		return personnel;
	}

	public void setPersonnel(String personnel) {
		this.personnel = personnel;
	}

	public Double getMoney() {
		return money;
	}

	public void setMoney(Double money) {
		this.money = money;
	}

	public Date getCheckedDate() {
		return checkedDate;
	}

	public void setCheckedDate(Date checkedDate) {
		this.checkedDate = checkedDate;
	}

	public String getId() {
		return id;
	}

	public void setId(String id) {
		this.id = id;
	}

	public String getSpecialManageId() {
		return specialManageId;
	}

	public void setSpecialManageId(String specialManageId) {
		this.specialManageId = specialManageId;
	}

}
