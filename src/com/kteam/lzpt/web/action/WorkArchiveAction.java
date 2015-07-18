package com.kteam.lzpt.web.action;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.ArrayList;
import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.apache.struts2.ServletActionContext;

import com.kteam.lzpt.common.DateJsonValueProcessor;
import com.kteam.lzpt.common.UnitUtil;
import com.kteam.lzpt.entity.Role;
import com.kteam.lzpt.entity.User;
import com.kteam.lzpt.entity.WorkArchive;
import com.kteam.lzpt.entity.WorkImportantMatters;
import com.kteam.lzpt.entity.WorkSummary;
import com.kteam.lzpt.manager.IWorkArchiveManager;

import net.sf.ezmorph.object.DateMorpher;
import net.sf.json.JSONArray;
import net.sf.json.JSONObject;
import net.sf.json.JsonConfig;
import net.sf.json.util.JSONUtils;
import net.sf.json.util.PropertyFilter;

public class WorkArchiveAction extends BaseAction {
	
	private WorkArchive wa;
	
	private WorkImportantMatters wim;
	
	private WorkSummary ws;
	
	private IWorkArchiveManager workArchiveManager;
	
	private String wimS;
	
	private String wss;
	
	private String caStr;

	public WorkArchive getWa() {
		return wa;
	}

	public void setWa(WorkArchive wa) {
		this.wa = wa;
	}

	public IWorkArchiveManager getWorkArchiveManager() {
		return workArchiveManager;
	}

	public void setWorkArchiveManager(IWorkArchiveManager workArchiveManager) {
		this.workArchiveManager = workArchiveManager;
	}

	public WorkImportantMatters getWim() {
		return wim;
	}

	public void setWim(WorkImportantMatters wim) {
		this.wim = wim;
	}

	public WorkSummary getWs() {
		return ws;
	}

	public void setWs(WorkSummary ws) {
		this.ws = ws;
	}	
	
	public String getWimS() {
		return wimS;
	}

	public void setWimS(String wimS) {
		this.wimS = wimS;
	}

	public String getWss() {
		return wss;
	}

	public void setWss(String wss) {
		this.wss = wss;
	}
	

	public String getCaStr() {
		return caStr;
	}

	public void setCaStr(String caStr) {
		this.caStr = caStr;
	}

	/**
	 * 添加单位档案
	 */
	public String addWorkArchive(){
		JSONUtils.getMorpherRegistry().registerMorpher( new DateMorpher(new String[] { "yyyy-MM-dd" }));
		HttpServletResponse response = ServletActionContext.getResponse();
		response.setCharacterEncoding("UTF-8");
		PrintWriter pw=null;
			
		try {
			pw = response.getWriter();
			
            JSONArray ja1 = JSONArray.fromObject(wimS);
			
			List<WorkImportantMatters> wimL = JSONArray.toList(ja1,new WorkImportantMatters(),new JsonConfig());
			JSONArray ja2 = JSONArray.fromObject(wss);
			List<WorkSummary> wsL = JSONArray.toList(ja2,new WorkSummary(),new JsonConfig());
			wa.setWimList(wimL);
			wa.setWsList(wsL);
			
			
			this.getWorkArchiveManager().addWorkArchive(wa);
			//pw.print("success");
			
		}catch (Exception e) {
			log.error("添加用户出错",e);
			if(pw!=null){
				pw.print("error");
			}
		}
		return "list";
	}
	
	/**
	 * 查询单位档案
	 */
	public void queryWorkArchive()
	{
		try {
			HttpServletResponse response = ServletActionContext.getResponse();
			response.setCharacterEncoding("UTF-8");
			PrintWriter pw;
			pw = response.getWriter();
			
			HttpServletRequest request = ServletActionContext.getRequest();

			HttpSession session = request.getSession();

			User user = (User) session.getAttribute("user");
			
			Role role = user.getDefaultRole();
			
			
			
			if(!role.getRoleName().equals("纪委")){
				
				String units = ServletActionContext.getServletContext().getAttribute("units").toString();
				
//				System.out.println(units);
				 
			 	JSONArray unitsJa=JSONArray.fromObject(units);
			 	
			 	String unit = UnitUtil.getUnitNameById(unitsJa, user.getUnitId());
				
			 	if(wa==null){
			 		wa=new WorkArchive();
			 	}
				wa.setWname(unit);
				
				
			}

			List<WorkArchive> workArchives= workArchiveManager.queryWorkArchive(wa, rows,page);
			
			Map<String,Object> jsonMap = new HashMap<String,Object>();
			
			JsonConfig config = new JsonConfig();
			//转换日期格式
			config.registerJsonValueProcessor(Date.class, new DateJsonValueProcessor());
			
			//过滤掉用户中的roles,powers属性
			config.setJsonPropertyFilter(new PropertyFilter() {			
				@Override
				public boolean apply(Object arg0, String arg1, Object arg2) {
					if (arg1.equals("caList") || arg1.equals("wsList")
							|| arg1.equals("wimList") || arg1.equals("subWorkArchives")) {
						return true;
					} else {
						return false;
					}			
				}
			});
			
			jsonMap.put("total", workArchiveManager.getWorkArchivesTotal(wa));
			jsonMap.put("rows", workArchives);
			
			
			JSONObject jo = JSONObject.fromObject(jsonMap,config);
			
			pw.print(jo.toString());
		} catch (IOException e) {
			e.printStackTrace();
		}catch (Exception e) {
			e.printStackTrace();
		}
	}
	
	/**
	 * 删除单位档案
	 */
	public void deleteWorkArchive()
	{
		PrintWriter pw = null;
		try {
			HttpServletResponse response = ServletActionContext.getResponse();
			response.setCharacterEncoding("UTF-8");
			pw = response.getWriter();
			workArchiveManager.deleteWorkArchives(wa.getId());
			
			pw.print("success");
		} catch (IOException e) {
			pw.print("false");
			e.printStackTrace();
		}catch (Exception e) {
			e.printStackTrace();
			pw.print("false");
		}
	}
	
	/**
	 * 查询单位档案详细
	 */
	public String getWorkArchiveById()
	{
		wa  = workArchiveManager.getWorkArchiveById(wa.getId());
		
		List<WorkImportantMatters> wimList1=  wa.getWimList();
		JSONArray ja = JSONArray.fromObject(wimList1);
		wimS = ja.toString();
		List<WorkSummary> wsList1 = wa.getWsList();
		JSONArray ja1 = JSONArray.fromObject(wsList1);
		wss = ja1.toString();
		
		return "unitInfo";
	}
	
	/**
	 * 修改单位档案前查询详细信息
	 */
	public String beforeUpdateWorkArchiveById()
	{
		wa  = workArchiveManager.getWorkArchiveById(wa.getId());
		
		List<WorkImportantMatters> wimList1=  wa.getWimList();
		JSONArray ja = JSONArray.fromObject(wimList1);
		wimS = ja.toString();
		List<WorkSummary> wsList1 = wa.getWsList();
		JSONArray ja1 = JSONArray.fromObject(wsList1);
		wss = ja1.toString();
		return "updateUnit";
	}
	
	/**
	 * 修改单位档案
	 */
	public String updateWorkArchive(){
		JSONUtils.getMorpherRegistry().registerMorpher( new DateMorpher(new String[] { "yyyy-MM-dd" }));
		HttpServletResponse response = ServletActionContext.getResponse();
		response.setCharacterEncoding("UTF-8");
		PrintWriter pw=null;
		try {
			pw = response.getWriter();
			
			JSONArray ja1 = JSONArray.fromObject(wimS);
			
			List<WorkImportantMatters> wimL = JSONArray.toList(ja1,new WorkImportantMatters(),new JsonConfig());
			JSONArray ja2 = JSONArray.fromObject(wss);
			List<WorkSummary> wsL = JSONArray.toList(ja2,new WorkSummary(),new JsonConfig());
			wa.setWimList(wimL);
			wa.setWsList(wsL);
			
			this.getWorkArchiveManager().updateWorkArchive(wa);
			//pw.print("success");
			
		}catch (Exception e) {
			log.error("修改用户出错",e);
			if(pw!=null){
				pw.print("error");
			}
		}
		return "list";
	}
	
	/**
	 * 查询单位
	 */
	public void queryWorkArchives() {
		try {
			HttpServletResponse response = ServletActionContext.getResponse();
			response.setCharacterEncoding("UTF-8");
			PrintWriter pw;

			pw = response.getWriter();

			List<WorkArchive> workArchive = this.getWorkArchiveManager().getWorkArchives();
			JsonConfig config = new JsonConfig();
			//转换日期格式
			config.registerJsonValueProcessor(Date.class, new DateJsonValueProcessor());
			
			//过滤掉用户中的roles,powers属性
			config.setJsonPropertyFilter(new PropertyFilter() {			
				@Override
				public boolean apply(Object arg0, String arg1, Object arg2) {
					if (arg1.equals("caList") || arg1.equals("wsList")
							|| arg1.equals("wimList") || arg1.equals("subWorkArchives")) {
						return true;
					} else {
						return false;
					}			
				}
			});
			JSONArray jsonArray = JSONArray.fromObject(workArchive,config);

			pw.print(jsonArray.toString());
		} catch (IOException e) {
			
			log.error("查询单位列表异常",e);
		}
	}
	
	
	public void querySimpleUnits() {
		try {
			HttpServletResponse response = ServletActionContext.getResponse();
			response.setCharacterEncoding("UTF-8");
			PrintWriter pw;

			pw = response.getWriter();

			List<WorkArchive> workArchive = this.getWorkArchiveManager().getSimpleUnits();
			
			
			HttpSession session=ServletActionContext.getRequest().getSession();
			
			User user =(User) session.getAttribute("user");
			
			Role role = user.getDefaultRole();
			
			if("乡镇单位管理员".equals(role.getRoleName())){
				
				for(WorkArchive w:workArchive)
				{
					if(w.getId().equals(user.getUnitId())){
						workArchive=new ArrayList<WorkArchive>();
						workArchive.add(w);
						break;
					}
				}
			}
			
			JsonConfig config = new JsonConfig();
			//转换日期格式
			config.registerJsonValueProcessor(Date.class, new DateJsonValueProcessor());
			
			JSONArray jsonArray = JSONArray.fromObject(workArchive,config);

			pw.print(jsonArray.toString());
		} catch (IOException e) {
			
			log.error("查询单位列表异常",e);
		}
	}
	

}
