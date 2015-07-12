package com.kteam.lzpt.entity;

/**
 * 奖励诉求
 * @author Administrator
 *
 */
public class EncourageAppeal extends BaseEntity{
	
	private String id;
	
	//标题
	private String etitle;
	
	//内容
	private String econtext;
	
	//单位
	private WorkArchive ewa;
	
	//备注
	private String eremark;
	
	//评分
	private int escores;
	
	//类型(0:奖励      1：惩罚)
	private int etype;

	public String getId() {
		return id;
	}

	public void setId(String id) {
		this.id = id;
	}

	public String getEtitle() {
		return etitle;
	}

	public void setEtitle(String etitle) {
		this.etitle = etitle;
	}

	public String getEcontext() {
		return econtext;
	}

	public void setEcontext(String econtext) {
		this.econtext = econtext;
	}

	public WorkArchive getEwa() {
		return ewa;
	}

	public void setEwa(WorkArchive ewa) {
		this.ewa = ewa;
	}

	public String getEremark() {
		return eremark;
	}

	public void setEremark(String eremark) {
		this.eremark = eremark;
	}

	public int getEscores() {
		return escores;
	}

	public void setEscores(int escores) {
		this.escores = escores;
	}

	public int getEtype() {
		return etype;
	}

	public void setEtype(int etype) {
		this.etype = etype;
	}
	
	
	
	
	

}
