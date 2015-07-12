package com.kteam.lzpt.entity;

import java.util.Date;

/**
 * 干部廉政档案
 * @author Administrator
 *
 */
public class CadreArchive {
	
	private String id;
	
	//身份证
	private String idCard;
	
	//政治面貌
	private String politicalStatus;
	
	//现任职位
	private String job;
	
	//0 在职  1已退出现职尚未办理退休手续
	private Integer workState;
	
	//婚姻情况  0结婚 1再婚 2离婚 3丧偶
	private Integer marriageState;
	
	//姓名
	private String cname;
	
	//性别
	private int csex;
	
	//出生日期
	private Date cbirthday;
	
	//户籍地
	private String nativeplace;
	
	//职称
	private String major; 
	
	//民族
	private String nation;
	
	//学历
	private String education;
	
	//入党时间
	private Date joinparty;
	
	//参加工作时间
	private Date worktime;
	
	//电话
	private String phone;
	
	//所属单位
	private WorkArchive wa;
	
	//所属单位id
	private String waid;
	
	//头像
	private String filesToJson;

	public String getId() {
		return id;
	}

	public void setId(String id) {
		this.id = id;
	}

	public String getCname() {
		return cname;
	}

	public void setCname(String cname) {
		this.cname = cname;
	}

	public int getCsex() {
		return csex;
	}

	public void setCsex(int csex) {
		this.csex = csex;
	}

	public Date getCbirthday() {
		return cbirthday;
	}

	public void setCbirthday(Date cbirthday) {
		this.cbirthday = cbirthday;
	}

	public String getNativeplace() {
		return nativeplace;
	}

	public void setNativeplace(String nativeplace) {
		this.nativeplace = nativeplace;
	}

	public String getMajor() {
		return major;
	}

	public void setMajor(String major) {
		this.major = major;
	}

	public String getNation() {
		return nation;
	}

	public void setNation(String nation) {
		this.nation = nation;
	}

	public String getEducation() {
		return education;
	}

	public void setEducation(String education) {
		this.education = education;
	}

	public Date getJoinparty() {
		return joinparty;
	}

	public void setJoinparty(Date joinparty) {
		this.joinparty = joinparty;
	}

	public Date getWorktime() {
		return worktime;
	}

	public void setWorktime(Date worktime) {
		this.worktime = worktime;
	}

	public String getPhone() {
		return phone;
	}

	public void setPhone(String phone) {
		this.phone = phone;
	}

	

	public WorkArchive getWa() {
		return wa;
	}

	public void setWa(WorkArchive wa) {
		this.wa = wa;
	}

	public String getWaid() {
		return waid;
	}

	public void setWaid(String waid) {
		this.waid = waid;
	}

	public String getFilesToJson() {
		return filesToJson;
	}

	public void setFilesToJson(String filesToJson) {
		this.filesToJson = filesToJson;
	}
	public String getIdCard() {
		return idCard;
	}

	public void setIdCard(String idCard) {
		this.idCard = idCard;
	}

	public String getPoliticalStatus() {
		return politicalStatus;
	}

	public void setPoliticalStatus(String politicalStatus) {
		this.politicalStatus = politicalStatus;
	}

	public String getJob() {
		return job;
	}

	public void setJob(String job) {
		this.job = job;
	}

	public Integer getWorkState() {
		return workState;
	}

	public void setWorkState(Integer workState) {
		this.workState = workState;
	}
	
	public Integer getMarriageState() {
		return marriageState;
	}

	public void setMarriageState(Integer marriageState) {
		this.marriageState = marriageState;
	}
	
	
	
	

}
