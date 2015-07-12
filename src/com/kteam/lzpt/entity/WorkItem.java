package com.kteam.lzpt.entity;

import java.util.List;

public class WorkItem  {
	
	private String id;
	
	private String name;
	
	private WorkItem parent;
	
	private List<WorkItem> items;

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

	public WorkItem getParent() {
		return parent;
	}

	public void setParent(WorkItem parent) {
		this.parent = parent;
	}

	public List<WorkItem> getItems() {
		return items;
	}

	public void setItems(List<WorkItem> items) {
		this.items = items;
	}
	
	
}
