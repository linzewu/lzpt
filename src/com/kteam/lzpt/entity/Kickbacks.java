package com.kteam.lzpt.entity;

import java.util.Date;

public class Kickbacks {
	
	private String id;
	
	private String specialManageId;
	
	private Date checkedDate;
	
	private Date  acceptDate;
	
	private Double acceptMoney;
	
	private String acceptAddr;
	
	private Date handInDate;
	
	private Double handInMoney;
	
	private Integer isExist;
	

	public Integer getIsExist() {
		return isExist;
	}

	public void setIsExist(Integer isExist) {
		this.isExist = isExist;
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

	public Date getAcceptDate() {
		return acceptDate;
	}

	public void setAcceptDate(Date acceptDate) {
		this.acceptDate = acceptDate;
	}

	public Double getAcceptMoney() {
		return acceptMoney;
	}

	public void setAcceptMoney(Double acceptMoney) {
		this.acceptMoney = acceptMoney;
	}

	public String getAcceptAddr() {
		return acceptAddr;
	}

	public void setAcceptAddr(String acceptAddr) {
		this.acceptAddr = acceptAddr;
	}

	public Date getHandInDate() {
		return handInDate;
	}

	public void setHandInDate(Date handInDate) {
		this.handInDate = handInDate;
	}

	public Double getHandInMoney() {
		return handInMoney;
	}

	public void setHandInMoney(Double handInMoney) {
		this.handInMoney = handInMoney;
	}
	
	

}
