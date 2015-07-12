package com.kteam.lzpt.entity;

import java.util.Date;

public class ConflictChecked {
	
	private String id;
	
	private String specialManageId;
	
	private Integer exist;
	
	private Date checkedDate;
	
	private Date conflictDate;
	
	private String address;
	
	private String object;
	
	private Integer isExist;
	

	public Integer getIsExist() {
		return isExist;
	}

	public void setIsExist(Integer isExist) {
		this.isExist = isExist;
	}
	

	public Integer getExist() {
		return exist;
	}

	public void setExist(Integer exist) {
		this.exist = exist;
	}

	public Date getConflictDate() {
		return conflictDate;
	}

	public void setConflictDate(Date conflictDate) {
		this.conflictDate = conflictDate;
	}

	public String getAddress() {
		return address;
	}

	public void setAddress(String address) {
		this.address = address;
	}

	public String getObject() {
		return object;
	}

	public void setObject(String object) {
		this.object = object;
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
