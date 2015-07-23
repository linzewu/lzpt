package com.kteam.lzpt.entity;

public class ProjectType  {
	
	private static final long serialVersionUID = 1L;
	
	public static final Integer MINUS_FALSE=0;
	public static final Integer MINUS_TRUE=1;
	
	private int id;
	
	private String name;
	
	private int group;
	
	private Float defaultScore;
	
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
	


	public Float getDefaultScore() {
		return defaultScore;
	}

	public void setDefaultScore(Float defaultScore) {
		this.defaultScore = defaultScore;
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
