package com.kteam.lzpt.entity;

import java.util.Date;

/**
 * 干部廉政档案 --- 奖惩情况
 * @author Administrator
 *
 */
public class RewardAndPunishment {
	
	//id
	private String id;
	
	//干部档案id
	private String cid;
	
	//类型（1:奖励/ 0:惩罚）
	private int rtype;
	
	//标题
	private String subject;
	
	//时间
	private Date rdate;
	
	//详细信息
	private String detail;

	public String getId() {
		return id;
	}

	public void setId(String id) {
		this.id = id;
	}

	public String getCid() {
		return cid;
	}

	public void setCid(String cid) {
		this.cid = cid;
	}

	public int getRtype() {
		return rtype;
	}

	public void setRtype(int rtype) {
		this.rtype = rtype;
	}

	public String getSubject() {
		return subject;
	}

	public void setSubject(String subject) {
		this.subject = subject;
	}

	public Date getRdate() {
		return rdate;
	}

	public void setRdate(Date rdate) {
		this.rdate = rdate;
	}

	public String getDetail() {
		return detail;
	}

	public void setDetail(String detail) {
		this.detail = detail;
	}
	
	

}
