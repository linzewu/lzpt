package com.kteam.lzpt.entity.leader.extend;

import java.util.Date;

public class GoAbroadSituation {

	private String id;
	
	private String leaderInfoId;
	
	private Date startDate;
	
	private Date endDate;
	
	private String toCountry;
	
	private String reason;
	
	private String approveOrganization;
	
	private String entrustOrganization;

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

	public String getToCountry() {
		return toCountry;
	}

	public void setToCountry(String toCountry) {
		this.toCountry = toCountry;
	}

	public String getReason() {
		return reason;
	}

	public void setReason(String reason) {
		this.reason = reason;
	}

	public String getApproveOrganization() {
		return approveOrganization;
	}

	public void setApproveOrganization(String approveOrganization) {
		this.approveOrganization = approveOrganization;
	}

	public String getEntrustOrganization() {
		return entrustOrganization;
	}

	public void setEntrustOrganization(String entrustOrganization) {
		this.entrustOrganization = entrustOrganization;
	}
	
	
}
