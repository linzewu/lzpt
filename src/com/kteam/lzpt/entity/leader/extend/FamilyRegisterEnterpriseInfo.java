package com.kteam.lzpt.entity.leader.extend;


public class FamilyRegisterEnterpriseInfo {

	private String id;

	private String leaderInfoId;

	// 称谓
	private String appellation;

	// 姓名
	private String name;

	//企业名称
	private String enterpriseName;
	
	//经营范围
	private String scope;
	
	//企业类型
	private Integer enterpriseType;
	
	//注册资金
	private Double registerCapital;

	//出资金额
	private Double capital;
	
	//出资比例
	private Double capitalScale;

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

	public String getAppellation() {
		return appellation;
	}

	public void setAppellation(String appellation) {
		this.appellation = appellation;
	}

	public String getName() {
		return name;
	}

	public void setName(String name) {
		this.name = name;
	}

	public String getScope() {
		return scope;
	}

	public void setScope(String scope) {
		this.scope = scope;
	}

	public Double getRegisterCapital() {
		return registerCapital;
	}
	
	

	public String getEnterpriseName() {
		return enterpriseName;
	}

	public void setEnterpriseName(String enterpriseName) {
		this.enterpriseName = enterpriseName;
	}

	public Integer getEnterpriseType() {
		return enterpriseType;
	}

	public void setEnterpriseType(Integer enterpriseType) {
		this.enterpriseType = enterpriseType;
	}

	public void setRegisterCapital(Double registerCapital) {
		this.registerCapital = registerCapital;
	}

	public Double getCapital() {
		return capital;
	}

	public void setCapital(Double capital) {
		this.capital = capital;
	}

	public Double getCapitalScale() {
		return capitalScale;
	}

	public void setCapitalScale(Double capitalScale) {
		this.capitalScale = capitalScale;
	}

}
