package com.kteam.lzpt.entity;

public class ProjectItem {
	
	private int id;
	
	private int projectId;
	
	private Float score;
	
	private String data;
	
	private String data1;
	
	private String data2;
	
	

	public String getData() {
		
		return data1+data2;
	}

	public int getId() {
		return id;
	}

	public void setId(int id) {
		this.id = id;
	}

	public int getProjectId() {
		return projectId;
	}

	public void setProjectId(int projectId) {
		this.projectId = projectId;
	}

	public Float getScore() {
		return score;
	}

	public void setScore(Float score) {
		this.score = score;
	}

	public String getData1() {
		return data1;
	}

	public void setData1(String data1) {
		this.data1 = data1;
	}

	public String getData2() {
		return data2;
	}

	public void setData2(String data2) {
		this.data2 = data2;
	}
	
}
