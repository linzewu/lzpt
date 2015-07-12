package com.kteam.lzpt.entity;

public class UnitYearBudget {
	
	private String id;
	
	private String unitId;
	
	private Double gwjdys;
	
	private Double ygcgys;
	
	private Double gwycys;
	
	private Double money;
	
	private String year;
	
	private Integer state;
	
	private String remarks;

	public String getId() {
		return id;
	}

	public void setId(String id) {
		this.id = id;
	}

	public String getUnitId() {
		return unitId;
	}

	public void setUnitId(String unitId) {
		this.unitId = unitId;
	}

	public Double getMoney() {
		return money;
	}

	public void setMoney(Double money) {
		this.money = money;
	}

	public String getYear() {
		return year;
	}

	public void setYear(String year) {
		this.year = year;
	}

	public Integer getState() {
		return state;
	}

	public void setState(Integer state) {
		this.state = state;
	}

	public String getRemarks() {
		return remarks;
	}

	public void setRemarks(String remarks) {
		this.remarks = remarks;
	}

	public Double getGwjdys() {
		return gwjdys;
	}

	public void setGwjdys(Double gwjdys) {
		this.gwjdys = gwjdys;
	}

	
	public Double getYgcgys() {
		return ygcgys;
	}

	public void setYgcgys(Double ygcgys) {
		this.ygcgys = ygcgys;
	}

	public Double getGwycys() {
		return gwycys;
	}

	public void setGwycys(Double gwycys) {
		this.gwycys = gwycys;
	}
	

}
