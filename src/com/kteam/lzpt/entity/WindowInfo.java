package com.kteam.lzpt.entity;

public class WindowInfo extends BaseEntity {
	
	public final static int ACTIVITY=0;
	
	public final static int NOTACTIVITY=1;
	
	private String id;
	
	private String name;

	public String getId() {
		return id;
	}

	public void setId(String id) {
		this.id = id;
	}

	public String getName() {
		return name;
	}

	public void setName(String name) {
		this.name = name;
	}
	
	
}
