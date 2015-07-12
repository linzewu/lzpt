package com.kteam.lzpt.entity;

import java.util.Date;

public class IllegalProject {
	
	private String id;
	
	private String specialManageId;
	
	private Date checkedDate;
	
	private Date handInDate;
	
	private Double handInMoney;
	
	private String projectName;
	
	private String checkInfo;
	
	private String correctionInfo;
	
	private String relatedCheckInfo;
	
	private String relatedCorrectionInfo;
	
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

	public String getSpecialManageId() {
		return specialManageId;
	}

	public void setSpecialManageId(String specialManageId) {
		this.specialManageId = specialManageId;
	}

	public String getProjectName() {
		return projectName;
	}

	public void setProjectName(String projectName) {
		this.projectName = projectName;
	}

	public String getCheckInfo() {
		return checkInfo;
	}

	public void setCheckInfo(String checkInfo) {
		this.checkInfo = checkInfo;
	}

	public String getCorrectionInfo() {
		return correctionInfo;
	}

	public void setCorrectionInfo(String correctionInfo) {
		this.correctionInfo = correctionInfo;
	}

	public String getRelatedCheckInfo() {
		return relatedCheckInfo;
	}

	public void setRelatedCheckInfo(String relatedCheckInfo) {
		this.relatedCheckInfo = relatedCheckInfo;
	}

	public String getRelatedCorrectionInfo() {
		return relatedCorrectionInfo;
	}

	public void setRelatedCorrectionInfo(String relatedCorrectionInfo) {
		this.relatedCorrectionInfo = relatedCorrectionInfo;
	}

	public String getId() {
		return id;
	}

	public void setId(String id) {
		this.id = id;
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
