package com.kteam.lzpt.entity;



/**
 * 干部重大事项
 * @author Administrator
 *
 */
public class CadreImportantMatters {
	
	   //id
	    private String id;
	    
	    //年度
	    private int years;
	
	   //干部档案id
	    private String cid;
	
	    //受奖励情况
		private String encourage;
		
		//受处罚情况
		private String punish;
		
		//年度考核情况
		private String yearOfCheck;
		
		//拒收或上交礼金礼品情况
		private String reject;
		
		//本人婚姻变化情况
		private String marriage;
		
		//本人从事或经营盈利性活动及简直持股情况:
		private String manage;
		
		//本人、配偶及共同生活的子女的住房情况
		private String housing;
		
		//参与操办本人及近亲属婚丧嫁娶情况
		private String joining;
		
		//本人、子女及配偶出国（境）情况
		private String goabroad;
		
		//配偶、子女及其配偶受到查处或涉嫌犯罪情况
		private String crime;
		
		//配偶、子女及其配偶从业及其变化情况
		private String jobs;
		
		//其他应当向组织报告的有关事项
		private String others;

		public String getId() {
			return id;
		}

		public void setId(String id) {
			this.id = id;
		}

		public String getCid() {
			return cid;
		}

		public void setCid(String cid) {
			this.cid = cid;
		}

		public String getEncourage() {
			return encourage;
		}

		public void setEncourage(String encourage) {
			this.encourage = encourage;
		}

		public String getPunish() {
			return punish;
		}

		public void setPunish(String punish) {
			this.punish = punish;
		}

		public String getYearOfCheck() {
			return yearOfCheck;
		}

		public void setYearOfCheck(String yearOfCheck) {
			this.yearOfCheck = yearOfCheck;
		}

		public String getReject() {
			return reject;
		}

		public void setReject(String reject) {
			this.reject = reject;
		}

		public String getMarriage() {
			return marriage;
		}

		public void setMarriage(String marriage) {
			this.marriage = marriage;
		}

		public String getManage() {
			return manage;
		}

		public void setManage(String manage) {
			this.manage = manage;
		}

		public String getHousing() {
			return housing;
		}

		public void setHousing(String housing) {
			this.housing = housing;
		}

		public String getJoining() {
			return joining;
		}

		public void setJoining(String joining) {
			this.joining = joining;
		}

		public String getGoabroad() {
			return goabroad;
		}

		public void setGoabroad(String goabroad) {
			this.goabroad = goabroad;
		}

		public String getCrime() {
			return crime;
		}

		public void setCrime(String crime) {
			this.crime = crime;
		}

		public String getJobs() {
			return jobs;
		}

		public void setJobs(String jobs) {
			this.jobs = jobs;
		}

		public String getOthers() {
			return others;
		}

		public void setOthers(String others) {
			this.others = others;
		}

		public int getYears() {
			return years;
		}

		public void setYears(int years) {
			this.years = years;
		}
		

		
		

}
