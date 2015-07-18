package com.kteam.lzpt.entity;

import java.util.List;



/**
 * 单位机构廉政档案
 * @author Administrator
 *
 */
public class WorkArchive {
	
	//id
	private String id;
	
	//名称
	private String wname;
	
	//编码
	private String zipcode;
	
	//地址
	private String address;
	
    //负责人
	private String principal;
	
	//联系电话
	private String phone;
	
	//单位人数
	private int peoNum;	
	
	//单位成员
	private List<CadreArchive> caList;
	
	//廉政工作总结
	private List<WorkSummary> wsList;
	
	//单位重大事项
	private List<WorkImportantMatters> wimList;
	
	//干部集合
	private List<WorkArchive> subWorkArchives;
	
	public WorkArchive(){}
	
	public WorkArchive(String id,String wname){
		this.id=id;
		this.wname=wname;
	}
	

	public String getId() {
		return id;
	}

	public void setId(String id) {
		this.id = id;
	}

	public String getWname() {
		return wname;
	}

	public void setWname(String wname) {
		this.wname = wname;
	}

	public String getZipcode() {
		return zipcode;
	}

	public void setZipcode(String zipcode) {
		this.zipcode = zipcode;
	}

	public String getAddress() {
		return address;
	}

	public void setAddress(String address) {
		this.address = address;
	}

	public String getPrincipal() {
		return principal;
	}

	public void setPrincipal(String principal) {
		this.principal = principal;
	}

	public String getPhone() {
		return phone;
	}

	public void setPhone(String phone) {
		this.phone = phone;
	}

	public int getPeoNum() {
		return peoNum;
	}

	public void setPeoNum(int peoNum) {
		this.peoNum = peoNum;
	}

	public List<CadreArchive> getCaList() {
		return caList;
	}

	public void setCaList(List<CadreArchive> caList) {
		this.caList = caList;
	}

	public List<WorkSummary> getWsList() {
		return wsList;
	}

	public void setWsList(List<WorkSummary> wsList) {
		this.wsList = wsList;
	}

	public List<WorkImportantMatters> getWimList() {
		return wimList;
	}

	public void setWimList(List<WorkImportantMatters> wimList) {
		this.wimList = wimList;
	}

	public List<WorkArchive> getSubWorkArchives() {
		return subWorkArchives;
	}

	public void setSubWorkArchives(List<WorkArchive> subWorkArchives) {
		this.subWorkArchives = subWorkArchives;
	}
	
	
	

}
