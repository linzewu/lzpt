package com.kteam.lzpt.entity;

public class LeaderLZCP {
	
	private String id;
	
	private String name;
	
	private String zc;
	
	private TaskLZCPResult tlr;
	
	//满意数
	private Integer satisfiedCount;
	
	//基本满意数
	private Integer ordinaryCount;
	
	//不满意
	private Integer unsatisfiedCount;

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

	public String getZc() {
		return zc;
	}

	public void setZc(String zc) {
		this.zc = zc;
	}

	public Integer getSatisfiedCount() {
		return satisfiedCount;
	}

	public void setSatisfiedCount(Integer satisfiedCount) {
		this.satisfiedCount = satisfiedCount;
	}

	public Integer getOrdinaryCount() {
		return ordinaryCount;
	}

	public void setOrdinaryCount(Integer ordinaryCount) {
		this.ordinaryCount = ordinaryCount;
	}

	public Integer getUnsatisfiedCount() {
		return unsatisfiedCount;
	}

	public void setUnsatisfiedCount(Integer unsatisfiedCount) {
		this.unsatisfiedCount = unsatisfiedCount;
	}

	public TaskLZCPResult getTlr() {
		return tlr;
	}

	public void setTlr(TaskLZCPResult tlr) {
		this.tlr = tlr;
	}
	
}
