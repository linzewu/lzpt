package com.kteam.lzpt.entity.leader.extend;

import java.util.Date;

public class MarriageChangeInfo {
	
	private String id;
	
	private String leaderInfoId;
	
	//变化情况 0结婚 1再婚 2离婚 3丧偶
	private Integer changeInfo;
	
	private Date  changeDate;
	
	private String changeCause;

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

	public Integer getChangeInfo() {
		return changeInfo;
	}

	public void setChangeInfo(Integer changeInfo) {
		this.changeInfo = changeInfo;
	}

	public Date getChangeDate() {
		return changeDate;
	}

	public void setChangeDate(Date changeDate) {
		this.changeDate = changeDate;
	}


	
	public String getChangeCause() {
		return changeCause;
	}

	public void setChangeCause(String changeCause) {
		this.changeCause = changeCause;
	}

	public String toString(){
		StringBuilder sb=new StringBuilder();
		sb.append("id: \t").append(id);
		sb.append("leaderInfoId: \t").append(leaderInfoId);
		sb.append("changeDate: \t").append(changeDate);
		sb.append("changeInfo: \t").append(changeInfo);
		sb.append("changecause: \t").append(changeCause);
		return sb.toString();
	}
}
