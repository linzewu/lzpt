package com.kteam.lzpt.entity;

public class ProjectConsole {
	
	public static final Integer STATE_OPEN=0;
	
	public static final Integer STATE_CLOSE=1;
	
	
	private String year;
	
	private Integer state;


	public String getYear() {
		return year;
	}

	public Integer getState() {
		return state;
	}

	public void setYear(String year) {
		this.year = year;
	}

	public void setState(Integer state) {
		this.state = state;
	}
	

}
