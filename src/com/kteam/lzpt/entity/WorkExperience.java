package com.kteam.lzpt.entity;

import java.util.Date;

/**
 * 干部廉政档案 ---工作经历
 * @author Administrator
 *
 */
public class WorkExperience {
	
	//id
	private String id;
	
	//干部档案id
//	private String cid;
	
    //开始时间
	private Date bdate;
	
	//结束时间
	private Date edate;
	
	//担任职务
	private String wexperise;
	
	private String leaderInfoId;

	public String getLeaderInfoId() {
		return leaderInfoId;
	}

	public void setLeaderInfoId(String leaderInfoId) {
		this.leaderInfoId = leaderInfoId;
	}

	public String getId() {
		return id;
	}

	public void setId(String id) {
		this.id = id;
	}


	public Date getBdate() {
		return bdate;
	}

	public void setBdate(Date bdate) {
		this.bdate = bdate;
	}

	public Date getEdate() {
		return edate;
	}

	public void setEdate(Date edate) {
		this.edate = edate;
	}

	public String getWexperise() {
		return wexperise;
	}

	public void setWexperise(String wexperise) {
		this.wexperise = wexperise;
	}
	
	

}
