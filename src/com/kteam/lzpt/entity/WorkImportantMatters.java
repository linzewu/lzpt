package com.kteam.lzpt.entity;


/**
 * 单位重大事项
 * @author Administrator
 *
 */
public class WorkImportantMatters {
	
	//id
	private String id;
	
	//年度
    private int years;
	
	//单位档案id
	private String cid;
	
	//受奖励情况
	private String wencourage;
		
	//受奖处罚情况
	private String wpunish;
		
	//年度考核情况
	private String wyearOfCheck;

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

	public String getWencourage() {
		return wencourage;
	}

	public void setWencourage(String wencourage) {
		this.wencourage = wencourage;
	}

	public String getWpunish() {
		return wpunish;
	}

	public void setWpunish(String wpunish) {
		this.wpunish = wpunish;
	}

	public String getWyearOfCheck() {
		return wyearOfCheck;
	}

	public void setWyearOfCheck(String wyearOfCheck) {
		this.wyearOfCheck = wyearOfCheck;
	}

	public int getYears() {
		return years;
	}

	public void setYears(int years) {
		this.years = years;
	}
	

	
	

}
