package com.kteam.lzpt.entity;

/**
 * 惩罚诉求
 * @author Administrator
 *
 */
public class PunishAppeal extends BaseEntity{
	
	private String id;
	
	//标题
	private String ptitle;
	
	//内容
	private String pcontext;
	
	//单位
	private WorkArchive pwa;
	
	//备注
	private String premark;

	public String getId() {
		return id;
	}

	public void setId(String id) {
		this.id = id;
	}

	public String getPtitle() {
		return ptitle;
	}

	public void setPtitle(String ptitle) {
		this.ptitle = ptitle;
	}

	public String getPcontext() {
		return pcontext;
	}

	public void setPcontext(String pcontext) {
		this.pcontext = pcontext;
	}

	public WorkArchive getPwa() {
		return pwa;
	}

	public void setPwa(WorkArchive pwa) {
		this.pwa = pwa;
	}

	public String getPremark() {
		return premark;
	}

	public void setPremark(String premark) {
		this.premark = premark;
	}
	
	

}
