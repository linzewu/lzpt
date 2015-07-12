package com.kteam.lzpt.entity.leader.extend;


public class LabourIncomeInfo {
	
	private String id;
	
	private String leaderInfoId;
	
	private String year;
	
	//合计
	private Double total;
	
	//讲学
	private Double lectures;
	
	//写作
	private Double writing;
	
	//咨询
	private Double consult;
	
	//审稿
	private Double copyEdit;
	
	//书画
	private Double painting;
	
	//其他
	private Double other;

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

	public String getYear() {
		return year;
	}

	public void setYear(String year) {
		this.year = year;
	}

	public Double getTotal() {
		return total;
	}

	public void setTotal(Double total) {
		this.total = total;
	}

	public Double getLectures() {
		return lectures;
	}

	public void setLectures(Double lectures) {
		this.lectures = lectures;
	}

	public Double getWriting() {
		return writing;
	}

	public void setWriting(Double writing) {
		this.writing = writing;
	}

	public Double getConsult() {
		return consult;
	}

	public void setConsult(Double consult) {
		this.consult = consult;
	}

	public Double getCopyEdit() {
		return copyEdit;
	}

	public void setCopyEdit(Double copyEdit) {
		this.copyEdit = copyEdit;
	}

	public Double getPainting() {
		return painting;
	}

	public void setPainting(Double painting) {
		this.painting = painting;
	}

	public Double getOther() {
		return other;
	}

	public void setOther(Double other) {
		this.other = other;
	}
	
}
