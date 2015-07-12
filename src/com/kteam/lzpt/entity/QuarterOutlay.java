package com.kteam.lzpt.entity;

import java.util.Date;

/**
 * 季度经费
 * @author Administrator
 *
 */
public class QuarterOutlay extends BaseEntity{
	
	private String id;
	
	//年份
	private int qoyear;
	
	//季度
	private int qoquarter;
	
	//单位
	private WorkArchive wa;
	
	private String waid;
	
	//公布时间
	private Date publicTime;
	
	/**         公务接待费                           **/
	
	//交通费
	private double trafficMon;
	
	//住宿费
	private double stayMon;
	
	//用餐费
	private double foodMon;
	
	//其他
	private double otherBusiness;
	
	//接待费用
	private Double totalReceptionCosts;
	
	
	/**        因公出国（境）经费		 **/
	//境外培训及业务考察	
	private double trainMon;
	
	//国际招商引资活动	
	private double bidMon;
	
	//其他	
	private double otherAbroadMon;
	
	//因公出国（境）经费 
	private Double totalEmigrateCosts;
	
	/**      公务用车购置及运行维护费	**/
	
	//车辆购置费	
	private double buyCarMon;
	
	//车辆运行维护费		
	private double fixCarMon;

	public String getId() {
		return id;
	}

	public void setId(String id) {
		this.id = id;
	}

	public int getQoyear() {
		return qoyear;
	}

	public void setQoyear(int qoyear) {
		this.qoyear = qoyear;
	}

	public int getQoquarter() {
		return qoquarter;
	}

	public void setQoquarter(int qoquarter) {
		this.qoquarter = qoquarter;
	}

	public WorkArchive getWa() {
		return wa;
	}

	public void setWa(WorkArchive wa) {
		this.wa = wa;
	}

	public Date getPublicTime() {
		return publicTime;
	}

	public void setPublicTime(Date publicTime) {
		this.publicTime = publicTime;
	}

	public double getTrafficMon() {
		return trafficMon;
	}

	public void setTrafficMon(double trafficMon) {
		this.trafficMon = trafficMon;
	}

	public double getStayMon() {
		return stayMon;
	}

	public void setStayMon(double stayMon) {
		this.stayMon = stayMon;
	}

	public double getFoodMon() {
		return foodMon;
	}

	public void setFoodMon(double foodMon) {
		this.foodMon = foodMon;
	}

	public double getOtherBusiness() {
		return otherBusiness;
	}

	public void setOtherBusiness(double otherBusiness) {
		this.otherBusiness = otherBusiness;
	}

	public Double getTotalReceptionCosts() {
		return totalReceptionCosts;
	}

	public void setTotalReceptionCosts(Double totalReceptionCosts) {
		this.totalReceptionCosts = totalReceptionCosts;
	}

	public double getTrainMon() {
		return trainMon;
	}

	public void setTrainMon(double trainMon) {
		this.trainMon = trainMon;
	}

	public double getBidMon() {
		return bidMon;
	}

	public void setBidMon(double bidMon) {
		this.bidMon = bidMon;
	}

	public double getOtherAbroadMon() {
		return otherAbroadMon;
	}

	public void setOtherAbroadMon(double otherAbroadMon) {
		this.otherAbroadMon = otherAbroadMon;
	}

	public Double getTotalEmigrateCosts() {
		return totalEmigrateCosts;
	}

	public void setTotalEmigrateCosts(Double totalEmigrateCosts) {
		this.totalEmigrateCosts = totalEmigrateCosts;
	}

	public double getBuyCarMon() {
		return buyCarMon;
	}

	public void setBuyCarMon(double buyCarMon) {
		this.buyCarMon = buyCarMon;
	}

	public double getFixCarMon() {
		return fixCarMon;
	}

	public void setFixCarMon(double fixCarMon) {
		this.fixCarMon = fixCarMon;
	}

	public String getWaid() {
		return waid;
	}

	public void setWaid(String waid) {
		this.waid = waid;
	}
}
