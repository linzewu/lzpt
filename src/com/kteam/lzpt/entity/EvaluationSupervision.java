package com.kteam.lzpt.entity;

import java.util.Date;


public class EvaluationSupervision {
	
	//主键
	private String id;
	
	//年度
	private String year;
	
	//月度
	private Integer month;
	
	//单位
	private Integer unit;
	
	//得分
	private Integer score;
	
	//评价说明
	private String evaluateExplain;
	
	//评价人
	private String evaluateName;
	
	//评价日期
	private Date evaluateDate;
	
	private String evaluateAccount;

	public String getId() {
		return id;
	}

	public void setId(String id) {
		this.id = id;
	}

	public String getYear() {
		return year;
	}

	public void setYear(String year) {
		this.year = year;
	}

	public Integer getMonth() {
		return month;
	}

	public void setMonth(Integer month) {
		this.month = month;
	}

	public Integer getUnit() {
		return unit;
	}

	public void setUnit(Integer unit) {
		this.unit = unit;
	}

	public Integer getScore() {
		return score;
	}

	public void setScore(Integer score) {
		this.score = score;
	}

	public String getEvaluateExplain() {
		return evaluateExplain;
	}

	public void setEvaluateExplain(String evaluateExplain) {
		this.evaluateExplain = evaluateExplain;
	}

	public String getEvaluateName() {
		return evaluateName;
	}

	public void setEvaluateName(String evaluateName) {
		this.evaluateName = evaluateName;
	}

	public Date getEvaluateDate() {
		return evaluateDate;
	}

	public void setEvaluateDate(Date evaluateDate) {
		this.evaluateDate = evaluateDate;
	}

	public String getEvaluateAccount() {
		return evaluateAccount;
	}

	public void setEvaluateAccount(String evaluateAccount) {
		this.evaluateAccount = evaluateAccount;
	}
}
