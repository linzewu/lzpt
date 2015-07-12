package com.kteam.lzpt.web.action;

import java.io.PrintWriter;
import java.util.ArrayList;
import java.util.List;

import javax.servlet.http.HttpServletResponse;

import net.sf.json.JSONArray;
import net.sf.json.JSONObject;

import org.apache.struts2.ServletActionContext;

import com.kteam.lzpt.entity.Evaluate;
import com.kteam.lzpt.entity.User;
import com.kteam.lzpt.entity.WindowInfo;
import com.kteam.lzpt.entity.WorkArchive;
import com.kteam.lzpt.manager.IEvaluateManager;
import com.kteam.lzpt.manager.IWindowInfoManager;

public class EvaluateAction extends BaseAction {
	
	private IEvaluateManager em;
	
	private String strEvaluates;
	
	private Evaluate evaluate;
	
	private String year;
	
	private IWindowInfoManager wm;
	
	
	public IWindowInfoManager getWm() {
		return wm;
	}


	public void setWm(IWindowInfoManager wm) {
		this.wm = wm;
	}


	public String getYear() {
		return year;
	}


	public void setYear(String year) {
		this.year = year;
	}


	public IEvaluateManager getEm() {
		return em;
	}


	public void setEm(IEvaluateManager em) {
		this.em = em;
	}
	
	


	public String getStrEvaluates() {
		return strEvaluates;
	}


	public void setStrEvaluates(String strEvaluates) {
		this.strEvaluates = strEvaluates;
	}


	public Evaluate getEvaluate() {
		return evaluate;
	}




	public void setEvaluate(Evaluate evaluate) {
		this.evaluate = evaluate;
	}


	public void add(){
		
		HttpServletResponse response = ServletActionContext.getResponse();
		response.setCharacterEncoding("UTF-8");
		PrintWriter pw = null;
		
		try {
			User user = (User)ServletActionContext.getRequest().getSession().getAttribute("user");
			
			
			@SuppressWarnings("unchecked")
			List<WorkArchive> units = (List<WorkArchive>)ServletActionContext.getServletContext().getAttribute("units_list");
			
			String unit="";
			
			for(WorkArchive wa:units){
				if(wa.getId().equals(user.getUnitId())){
					unit = wa.getWname();
					break;
				}
			}
			
			pw = response.getWriter();
			
			JSONArray ja=JSONArray.fromObject(strEvaluates);
			
			List<Evaluate> evaluates=new ArrayList<Evaluate>(); 
			
			for(int i=0;i<ja.size();i++){
				
				JSONObject jo = ja.getJSONObject(i);
				Evaluate e = (Evaluate) JSONObject.toBean(jo,Evaluate.class);
				
				e.setUnit(unit);
				
				evaluates.add(e);
			}
			
			
			List<Evaluate> list = em.getEvaluates(evaluates.get(0).getYear(),unit);
			
			em.deleteEvaluate(list);
			
			em.addEvaluates(evaluates);
			
			pw.print("success");
		} catch (Exception e) {
			if (pw != null) {
				pw.print("error");
			}
			log.error("添加任务出错", e);
		}
	}
	
	
	public void getListByYearAndUnit(){
		HttpServletResponse response = ServletActionContext.getResponse();
		response.setCharacterEncoding("UTF-8");
		PrintWriter pw = null;
		try {
			User user = (User)ServletActionContext.getRequest().getSession().getAttribute("user");
			@SuppressWarnings("unchecked")
			List<WorkArchive> units = (List<WorkArchive>)ServletActionContext.getServletContext().getAttribute("units_list");
			String unit="";
			
			for(WorkArchive wa:units){
				if(wa.getId().equals(user.getUnitId())){
					unit = wa.getWname();
					break;
				}
			}
			
			pw = response.getWriter();
			
			
			List<Evaluate> list = em.getEvaluates(year,unit);
			
			if(list==null||list.size()==0){
				list=new ArrayList<Evaluate>();
				List<WindowInfo> ws = wm.getWindowInfos();
				for(WindowInfo w:ws){
					Evaluate e=new Evaluate();
					e.setWin(w.getName());
					list.add(e);
				}
			}
			JSONArray ja=JSONArray.fromObject(list);
			
			pw.print(ja.toString());
			
			
		} catch (Exception e) {
			if (pw != null) {
				pw.print("error");
			}
			log.error("查询出错", e);
		}
	}
	
	
	public void getListByYear(){
		HttpServletResponse response = ServletActionContext.getResponse();
		response.setCharacterEncoding("UTF-8");
		PrintWriter pw = null;
		try {
			
			
			pw = response.getWriter();
			
			
			List<Evaluate> list = em.getEvaluatesByYear(year);
			
			JSONArray ja=JSONArray.fromObject(list);
			
			pw.print(ja.toString());
			
			
		} catch (Exception e) {
			if (pw != null) {
				pw.print("error");
			}
			log.error("查询出错", e);
		}
	}

}
