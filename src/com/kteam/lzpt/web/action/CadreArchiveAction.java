package com.kteam.lzpt.web.action;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import java.util.Set;

import javax.servlet.http.HttpServletResponse;

import net.sf.ezmorph.object.DateMorpher;
import net.sf.json.JSONArray;
import net.sf.json.JSONObject;
import net.sf.json.JsonConfig;
import net.sf.json.util.JSONUtils;
import net.sf.json.util.PropertyFilter;

import org.apache.struts2.ServletActionContext;

import com.kteam.lzpt.common.DateJsonValueProcessor;
import com.kteam.lzpt.entity.CadreArchive;
import com.kteam.lzpt.entity.CadreWorkSummary;
import com.kteam.lzpt.entity.TrainExperience;
import com.kteam.lzpt.entity.WorkExperience;
import com.kteam.lzpt.entity.leader.extend.ChildrenMarryForeigner;
import com.kteam.lzpt.entity.leader.extend.ChildrenMarryHongkong;
import com.kteam.lzpt.entity.leader.extend.FamilyCompanyInfo;
import com.kteam.lzpt.entity.leader.extend.FamilyCriminalResponsibilityInfo;
import com.kteam.lzpt.entity.leader.extend.FamilyHousePropertyInfo;
import com.kteam.lzpt.entity.leader.extend.FamilyJobInfo;
import com.kteam.lzpt.entity.leader.extend.FamilyMigrateInfo;
import com.kteam.lzpt.entity.leader.extend.FamilyRegisterEnterpriseInfo;
import com.kteam.lzpt.entity.leader.extend.Foundation;
import com.kteam.lzpt.entity.leader.extend.Futures;
import com.kteam.lzpt.entity.leader.extend.GoAbroadCredentials;
import com.kteam.lzpt.entity.leader.extend.GoAbroadSituation;
import com.kteam.lzpt.entity.leader.extend.LabourIncomeInfo;
import com.kteam.lzpt.entity.leader.extend.MarriageChangeInfo;
import com.kteam.lzpt.entity.leader.extend.SalaryAndBonusInfo;
import com.kteam.lzpt.entity.leader.extend.Shares;
import com.kteam.lzpt.manager.ICadreArchiveManager;

public class CadreArchiveAction extends BaseAction {

	private CadreArchive ca;

	private JSONObject lex;

	private ICadreArchiveManager cadreArchiveManager;

	// 单位id
	private String wcid;

	// 问题
	// private String pStr;

	public CadreArchive getCa() {
		return ca;
	}

	public void setCa(CadreArchive ca) {
		this.ca = ca;
	}

	public ICadreArchiveManager getCadreArchiveManager() {
		return cadreArchiveManager;
	}

	public void setCadreArchiveManager(ICadreArchiveManager cadreArchiveManager) {
		this.cadreArchiveManager = cadreArchiveManager;
	}


	public String getWcid() {
		return wcid;
	}

	public void setWcid(String wcid) {
		this.wcid = wcid;
	}

	public JSONObject getLex() {
		return lex;
	}

	public void setLex(JSONObject lex) {
		this.lex = lex;
	}

	/**
	 * 查询干部档案
	 */
	public void queryWorkArchive() {
		try {
			HttpServletResponse response = ServletActionContext.getResponse();
			response.setCharacterEncoding("UTF-8");
			PrintWriter pw;
			pw = response.getWriter();
			List<CadreArchive> cadreArchive = cadreArchiveManager
					.queryCadreArchive(ca, rows, page);

			Map<String, Object> jsonMap = new HashMap<String, Object>();

			JsonConfig config = new JsonConfig();
			// 转换日期格式
			config.registerJsonValueProcessor(Date.class,
					new DateJsonValueProcessor());

			// 过滤掉用户中的roles,powers属性
			config.setJsonPropertyFilter(new PropertyFilter() {
				@Override
				public boolean apply(Object arg0, String arg1, Object arg2) {
					if (arg1.equals("cwsList") || arg1.equals("weList")
							|| arg1.equals("teList") || arg1.equals("rpList")
							|| arg1.equals("cimList") || arg1.equals("wa")) {
						return true;
					} else {
						return false;
					}
				}
			});

			jsonMap.put("total", cadreArchiveManager.getCadreArchiveTotal(ca));
			jsonMap.put("rows", cadreArchive);

			JSONObject jo = JSONObject.fromObject(jsonMap, config);
			pw.print(jo.toString());
		} catch (IOException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} catch (Exception e) {
			// TODO: handle exception
			e.printStackTrace();
		}
	}

	/**
	 * 添加干部信息
	 * 
	 * @return
	 */
	public void addCadreArchive() {
		PrintWriter pw = null;
		try {
			HttpServletResponse response = ServletActionContext.getResponse();
			response.setCharacterEncoding("UTF-8");
			pw = response.getWriter();
			if (cadreArchiveManager != null && ca != null) {
				String id = cadreArchiveManager.addCadreArchive(ca);
				JSONObject jo = new JSONObject();
				if (id != null) {
					jo.put("state", "200");
					jo.put("id", id);
				} else {
					jo.put("state", "500");
				}
				pw.print(jo.toString());
			}
		} catch (Exception e) {
			e.printStackTrace();
		}
	}

	/**
	 * 删除干部档案
	 */
	public void deleteCadreArchive() {
		PrintWriter pw = null;
		try {
			HttpServletResponse response = ServletActionContext.getResponse();
			response.setCharacterEncoding("UTF-8");
			pw = response.getWriter();
			cadreArchiveManager.deleteCadreArchive(ca.getId());

			pw.print("success");
		} catch (IOException e) {
			e.printStackTrace();
			pw.print("false");
		} catch (Exception e) {
			e.printStackTrace();
			pw.print("false");
		}
	}

	public String getCadreArchive() {
		JsonConfig config = new JsonConfig();
		// 转换日期格式
		config.registerJsonValueProcessor(Date.class,
				new DateJsonValueProcessor("yyyy-MM-dd"));
		ca = this.cadreArchiveManager.getCadreArchiveById(ca.getId());

		return "leaderInfo";
	}

	/**
	 * 修改干部信息前查询详细信息
	 * 
	 * @return
	 */
	public String beforeUpdateCadreArchive() {
		JsonConfig config = new JsonConfig();
		// 转换日期格式
		config.registerJsonValueProcessor(Date.class,
				new DateJsonValueProcessor());

		ca = this.cadreArchiveManager.getCadreArchiveById(ca.getId());
		return "updateleader";
	}

	/**
	 * 修改干部信息
	 * 
	 * @return
	 */
	public void updateCadreArchive() {
		JSONUtils.getMorpherRegistry().registerMorpher(
				new DateMorpher(new String[] { "yyyy-MM-dd" }));
		JsonConfig config = new JsonConfig();
		// 转换日期格式
		config.registerJsonValueProcessor(Date.class,
				new DateJsonValueProcessor());
		HttpServletResponse response = ServletActionContext.getResponse();
		response.setCharacterEncoding("UTF-8");
		JSONObject jo = new JSONObject();
		PrintWriter pw = null;
		try{
			pw = response.getWriter();
			cadreArchiveManager.updateCadreArchive(ca);
			log.info("保存基本信息成功");
			jo.put("state", 200);
			pw.print(jo);
		}catch(Exception e){
			jo.put("state", 500);
			pw.print(jo);
			log.error("保存基本信息失败",e );
		}finally{
			if(pw!=null){
				pw.close();
			}
		}
	}

	public void getCadreArchiveByWCID() {
		List<CadreArchive> li = this.cadreArchiveManager
				.getCadreArchiveByWCID(wcid);
		HttpServletResponse response = ServletActionContext.getResponse();
		response.setCharacterEncoding("UTF-8");
		PrintWriter pw = null;
		try {
			pw = response.getWriter();
			JsonConfig config = new JsonConfig();
			// 转换日期格式
			config.registerJsonValueProcessor(Date.class,
					new DateJsonValueProcessor());

			// 过滤掉用户中的roles,powers属性
			config.setJsonPropertyFilter(new PropertyFilter() {
				@Override
				public boolean apply(Object arg0, String arg1, Object arg2) {
					if (arg1.equals("cwsList") || arg1.equals("weList")
							|| arg1.equals("teList") || arg1.equals("rpList")
							|| arg1.equals("cimList") || arg1.equals("wa")) {
						return true;
					} else {
						return false;
					}
				}
			});
			JSONArray ja = JSONArray.fromObject(li, config);

			pw.print(ja.toString());
		} catch (IOException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} finally {
			pw.close();
		}
	}

	public void saveLeaderExtend() {
		
		if (lex != null) {
			HttpServletResponse response = ServletActionContext.getResponse();
			response.setCharacterEncoding("UTF-8");
			PrintWriter pw = null;
			JSONObject respondData = new JSONObject();
			try {
				pw = response.getWriter();
				changeLeaderExtendDataFormater();
				Object leaderExtend = toLeaderExtendBean();
				String id = null;
				// 如果Id为空则执行新增
				if (leaderExtend != null) {
					if (lex.get("id") == null || "".equals(lex.getString("id").trim())) {
						id = this.cadreArchiveManager
								.addLeaderExtend(leaderExtend);
					} else {
						this.cadreArchiveManager
								.updateLeaderExtend(leaderExtend);
						id = lex.getString("id");
					}

					respondData.put("state", 200);
					respondData.put("sid", id);
					pw.print(respondData.toString());
				} else {
					respondData.put("state", 400);
					pw.print(respondData.toString());
				}

			} catch (Exception e) {
				if (pw != null) {
					respondData.put("state", 400);
					pw.print(respondData.toString());
				}
				e.printStackTrace();
			} finally {
				if (pw != null) {
					pw.close();
				}
			}
		}
	}

	public void getLeaderInfoExtend() {
		changeLeaderExtendDataFormater();
		if (lex.get("actionType") != null) {
			HttpServletResponse response = ServletActionContext.getResponse();
			response.setCharacterEncoding("UTF-8");
			PrintWriter pw = null;
			try {
				pw = response.getWriter();
				String sql = getLeaderExtendQueySql();
				if(sql!=null){
					List list = this.getCadreArchiveManager().getLeaderExtendInfo(sql);
					JsonConfig config = new JsonConfig();
					// 转换日期格式
					config.registerJsonValueProcessor(Date.class,
							new DateJsonValueProcessor("yyyy-MM-dd"));
					JSONObject json =new JSONObject();
				    JSONArray jsonData = addPrefix(JSONArray.fromObject(list,config));
					json.put("rows", jsonData );
					pw.print(json);
				}
				
			} catch (Exception e) {
			} finally {
				if (pw != null) {
					pw.close();
				}
			}

		}
	}
	
	public void deleteLeaderExtend(){
		changeLeaderExtendDataFormater();
		Object bean = toLeaderExtendBean();
		HttpServletResponse response = ServletActionContext.getResponse();
		response.setCharacterEncoding("UTF-8");
		PrintWriter pw = null;
		JSONObject respondData = new JSONObject();
		try{
			pw = response.getWriter();
			if(bean!=null){
				this.getCadreArchiveManager().deleteLeaderExtend(bean);
				respondData.put("state", 200);
				pw.print(respondData);
			}else{
				respondData.put("state", 500);
				respondData.put("errorInfo", "输入id为空，或anctionType无法识别");
				pw.print(respondData);
			}
		}catch(Exception e){
			if(pw!=null){
				respondData.put("state", 500);
				respondData.put("errorInfo", "系统异常");
				pw.print(respondData);
			}
			e.printStackTrace();
		}finally{
			if(pw!=null){
				pw.close();
			}
		}
		
	}

	private void changeLeaderExtendDataFormater() {
		if (lex != null) {
			Set<String> keySet = lex.keySet();
			for (String key : keySet) {
				lex.put(key, lex.getJSONArray(key).get(0));
			}
		}
	}
	
	private JSONArray addPrefix(JSONArray jsonArray){
		JSONArray  newJson=new JSONArray();
		for(Object object:jsonArray){
			JSONObject jo=(JSONObject)object;
			Set<String> keySet = jo.keySet();
			JSONObject newj0=new JSONObject();
			for(String key:keySet){
				newj0.put("lex."+key, jo.get(key));
			}
			newJson.add(newj0);
		}
		return newJson;
		
	}

	private Object toLeaderExtendBean() {
		Object o = null;
		JSONUtils.getMorpherRegistry().registerMorpher(
				new DateMorpher(new String[] { "yyyy-MM-dd" }));
		if (lex != null) {
			// 装换数据格式。。原来的格式不对
			String actionType = (String) lex.get("actionType");
			log.debug("actionType:"+actionType);
			if ("MarriageChangeInfo".equalsIgnoreCase(actionType)) {
				o = JSONObject.toBean(lex, MarriageChangeInfo.class);
			}
			if("goAbroadSituation".equalsIgnoreCase(actionType)){
				o = JSONObject.toBean(lex, GoAbroadSituation.class);
			}
			if("goAbroadCredentials".equalsIgnoreCase(actionType)){
				o = JSONObject.toBean(lex, GoAbroadCredentials.class);
			}
			if("FamilyMigrateInfo".equalsIgnoreCase(actionType)){
				o = JSONObject.toBean(lex, FamilyMigrateInfo.class);
			}
			if("FamilyJobInfo".equalsIgnoreCase(actionType)){
				o = JSONObject.toBean(lex, FamilyJobInfo.class);
			}
			if ("childrenMarryForeigner".equalsIgnoreCase(actionType)){
				o = JSONObject.toBean(lex, ChildrenMarryForeigner.class);
			}
			if ("FamilyCriminalResponsibilityInfo".equalsIgnoreCase(actionType)){
				o = JSONObject.toBean(lex, FamilyCriminalResponsibilityInfo.class);
			}
			if ("childrenMarryHongkong".equalsIgnoreCase(actionType)){
				o = JSONObject.toBean(lex, ChildrenMarryHongkong.class);
			}
			if ("workexprience".equalsIgnoreCase(actionType)){
				o = JSONObject.toBean(lex, WorkExperience.class);
			}
			if ("trainexperien".equalsIgnoreCase(actionType)){
				o = JSONObject.toBean(lex, TrainExperience.class);
			}
			if ("salaryAndBonusInfo".equalsIgnoreCase(actionType)){
				o = JSONObject.toBean(lex, SalaryAndBonusInfo.class);
			}
			if ("labourIncomeInfo".equalsIgnoreCase(actionType)){
				o = JSONObject.toBean(lex, LabourIncomeInfo.class);
			}
			if ("familyCompanyInfo".equalsIgnoreCase(actionType)){
				o = JSONObject.toBean(lex, FamilyCompanyInfo.class);
			}
			if ("familyRegisterEnterpriseInfo".equalsIgnoreCase(actionType)){
				o = JSONObject.toBean(lex, FamilyRegisterEnterpriseInfo.class);
			}
			if ("familyHousePropertyInfo".equalsIgnoreCase(actionType)){
				o = JSONObject.toBean(lex, FamilyHousePropertyInfo.class);
			}
			if ("shares".equalsIgnoreCase(actionType)){
				o = JSONObject.toBean(lex, Shares.class);
			}
			if ("foundation".equalsIgnoreCase(actionType)){
				o = JSONObject.toBean(lex, Foundation.class);
			}
			if ("futures".equalsIgnoreCase(actionType)){
				o = JSONObject.toBean(lex, Futures.class);
			}
			if ("cadreWorkSummary".equalsIgnoreCase(actionType)){
				o = JSONObject.toBean(lex, CadreWorkSummary.class);
			}
			
		}
		return o;
	}

	public String getLeaderExtendQueySql() {

		String querySql = null;
		if (lex != null) {
			String actionType = (String) lex.get("actionType");
			String leaderInfoId = (String) lex.get("leaderInfoId");
			
			if (actionType != null && leaderInfoId != null) {
				
				if ("MarriageChangeInfo".equalsIgnoreCase(actionType)) {
					querySql = "From MarriageChangeInfo where leaderInfoId='"
							+ leaderInfoId+"'";
				}
				
				if ("goAbroadSituation".equalsIgnoreCase(actionType)){
					querySql = "From GoAbroadSituation where leaderInfoId='"
							+ leaderInfoId+"'";
				}
				
				if ("goAbroadCredentials".equalsIgnoreCase(actionType)){
					querySql = "From GoAbroadCredentials where leaderInfoId='"
							+ leaderInfoId+"'";
				}
				if ("FamilyMigrateInfo".equalsIgnoreCase(actionType)){
					querySql = "From FamilyMigrateInfo where leaderInfoId='"
							+ leaderInfoId+"'";
				}
				if ("FamilyJobInfo".equalsIgnoreCase(actionType)){
					querySql = "From FamilyJobInfo where leaderInfoId='"
							+ leaderInfoId+"'";
				}
				if ("childrenMarryForeigner".equalsIgnoreCase(actionType)){
					querySql = "From ChildrenMarryForeigner where leaderInfoId='"
							+ leaderInfoId+"'";
				}
				if ("FamilyCriminalResponsibilityInfo".equalsIgnoreCase(actionType)){
					querySql = "From FamilyCriminalResponsibilityInfo where leaderInfoId='"
							+ leaderInfoId+"'";
				}
				if ("childrenMarryHongkong".equalsIgnoreCase(actionType)){
					querySql = "From ChildrenMarryHongkong where leaderInfoId='"
							+ leaderInfoId+"'";
				}
				if ("workexprience".equalsIgnoreCase(actionType)){
					querySql = "From WorkExperience where leaderInfoId='"
							+ leaderInfoId+"'";
				}
				if ("trainexperien".equalsIgnoreCase(actionType)){
					querySql = "From TrainExperience where leaderInfoId='"
							+ leaderInfoId+"'";
				}
				if ("salaryAndBonusInfo".equalsIgnoreCase(actionType)){
					querySql = "From SalaryAndBonusInfo where leaderInfoId='"
							+ leaderInfoId+"'";
				}
				if ("labourIncomeInfo".equalsIgnoreCase(actionType)){
					querySql = "From LabourIncomeInfo where leaderInfoId='"
							+ leaderInfoId+"'";
				}
				if ("familyCompanyInfo".equalsIgnoreCase(actionType)){
					querySql = "From FamilyCompanyInfo where leaderInfoId='"
							+ leaderInfoId+"'";
				}
				if ("familyRegisterEnterpriseInfo".equalsIgnoreCase(actionType)){
					querySql = "From FamilyRegisterEnterpriseInfo where leaderInfoId='"
							+ leaderInfoId+"'";
				}
				if ("familyHousePropertyInfo".equalsIgnoreCase(actionType)){
					querySql = "From FamilyHousePropertyInfo where leaderInfoId='"
							+ leaderInfoId+"'";
				}
				if ("shares".equalsIgnoreCase(actionType)){
					querySql = "From Shares where leaderInfoId='"
							+ leaderInfoId+"'";
				}
				if ("foundation".equalsIgnoreCase(actionType)){
					querySql = "From Foundation where leaderInfoId='"
							+ leaderInfoId+"'";
				}
				if ("futures".equalsIgnoreCase(actionType)){
					querySql = "From Futures where leaderInfoId='"
							+ leaderInfoId+"'";
				}
				if ("cadreWorkSummary".equalsIgnoreCase(actionType)){
					String year = (String)lex.get("year");
					querySql = "From CadreWorkSummary where leaderInfoId='"
							+ leaderInfoId+"'";
					if(year!=null){
						querySql+=" and years="+year;
					}
				}
			}
		}
		return querySql;
	}
}
