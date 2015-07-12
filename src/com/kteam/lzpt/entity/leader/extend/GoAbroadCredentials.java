package com.kteam.lzpt.entity.leader.extend;

import java.util.Date;

public class GoAbroadCredentials {
	private String id;

	private String leaderInfoId;
	
	//0 护照 1 港澳证 2台湾通行证 3 其他
	private Integer credentialsName;
	
	//编码
	private String credentialsCard;
	
	//签发机关
	private String organizationName;
	
	//发证时间
	private Date  startDate;
	
	//有效时间
	private Date endDate;
	
	//保管机构
	private String custodian;

	public String getCustodian() {
		return custodian;
	}

	public void setCustodian(String custodian) {
		this.custodian = custodian;
	}

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

	public Integer getCredentialsName() {
		return credentialsName;
	}

	public void setCredentialsName(Integer credentialsName) {
		this.credentialsName = credentialsName;
	}

	public String getCredentialsCard() {
		return credentialsCard;
	}

	public void setCredentialsCard(String credentialsCard) {
		this.credentialsCard = credentialsCard;
	}

	public String getOrganizationName() {
		return organizationName;
	}

	public void setOrganizationName(String organizationName) {
		this.organizationName = organizationName;
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

	
}
