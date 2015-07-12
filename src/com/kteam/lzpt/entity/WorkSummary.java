package com.kteam.lzpt.entity;

/**
 * 单位廉政档案 --- 工作总结
 * @author Administrator
 *
 */
public class WorkSummary {
	
	//id
	private String id;
	
	//干部档案id
	private String leaderInfoId;
	
	//年度
	private int years;
	
	//年度总结
	private String yearSummary;
	
	//述职述廉报告
	private String report;
	
	//具体工作
	private String jobs;

	public String getId() {
		return id;
	}

	public void setId(String id) {
		this.id = id;
	}


	public String getLeaderInfoId() {
		return leaderInfoId;
	}

	public void setLeaderInfoId(String leaderInfoId) {
		this.leaderInfoId = leaderInfoId;
	}

	public int getYears() {
		return years;
	}

	public void setYears(int years) {
		this.years = years;
	}

	public String getYearSummary() {
		return yearSummary;
	}

	public void setYearSummary(String yearSummary) {
		this.yearSummary = yearSummary;
	}

	public String getReport() {
		return report;
	}

	public void setReport(String report) {
		this.report = report;
	}

	public String getJobs() {
		return jobs;
	}

	public void setJobs(String jobs) {
		this.jobs = jobs;
	}

}
