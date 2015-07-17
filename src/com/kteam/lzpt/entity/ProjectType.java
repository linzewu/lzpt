package com.kteam.lzpt.entity;

public class ProjectType  {
	
	private static final long serialVersionUID = 1L;
	
	private int id;
	
	private String name;
	
	private int group;
	
	private Float projectScore;
	
	private Float maxScore;
	
	private Integer minus;
	
	private String page;
	

	public int getId() {
		return id;
	}

	public String getPage() {
		return page;
	}

	public void setPage(String page) {
		this.page = page;
	}

	public void setId(int id) {
		this.id = id;
	}

	public String getName() {
		return name;
	}

	public void setName(String name) {
		this.name = name;
	}

	public int getGroup() {
		return group;
	}

	public void setGroup(int group) {
		this.group = group;
	}

	public Float getProjectScore() {
		return projectScore;
	}

	public void setProjectScore(Float projectScore) {
		this.projectScore = projectScore;
	}

	public Float getMaxScore() {
		return maxScore;
	}

	public void setMaxScore(Float maxScore) {
		this.maxScore = maxScore;
	}

	public Integer getMinus() {
		return minus;
	}

	public void setMinus(Integer minus) {
		this.minus = minus;
	}
	
	
	
}
