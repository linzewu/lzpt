package com.kteam.lzpt.entity;

import java.util.Date;

/**
 * 年度经费
 * @author Administrator
 *
 */
public class YearOutlay extends BaseEntity{
	
	private String id;
	
	//年度
	private int yoyear;
	
	//单位 
	private WorkArchive wa;
	
	//公布时间
	private Date publicTime;
	
	//剩余经费
	private double surplusMon;

	public String getId() {
		return id;
	}

	public void setId(String id) {
		this.id = id;
	}

	public int getYoyear() {
		return yoyear;
	}

	public void setYoyear(int yoyear) {
		this.yoyear = yoyear;
	}

	public WorkArchive getWa() {
		return wa;
	}

	public void setWa(WorkArchive wa) {
		this.wa = wa;
	}

	public Date getPublicTime() {
		return publicTime;
	}

	public void setPublicTime(Date publicTime) {
		this.publicTime = publicTime;
	}

	public double getSurplusMon() {
		return surplusMon;
	}

	public void setSurplusMon(double surplusMon) {
		this.surplusMon = surplusMon;
	}

	
	
	
	
	
	
	
	

}
