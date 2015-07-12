package com.kteam.lzpt.web.action;

import java.io.PrintWriter;
import java.util.Date;
import java.util.List;

import javax.servlet.ServletContext;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import net.sf.json.JSONArray;
import net.sf.json.JSONObject;
import net.sf.json.JsonConfig;
import net.sf.json.util.PropertyFilter;

import org.apache.struts2.ServletActionContext;

import com.kteam.lzpt.entity.CadreArchive;
import com.kteam.lzpt.entity.LeaderLZCP;
import com.kteam.lzpt.entity.TaskLZCP;
import com.kteam.lzpt.entity.TaskLZCPResult;
import com.kteam.lzpt.entity.User;
import com.kteam.lzpt.entity.WorkArchive;
import com.kteam.lzpt.manager.ICadreArchiveManager;
import com.kteam.lzpt.manager.ITaskLZCPManager;

public class TaskLZCPAction extends BaseAction {
	
	private ITaskLZCPManager taskLZCPManager;
	
	private ICadreArchiveManager cadreArchiveManager;
	
	private TaskLZCP taskLZCP;
	
	private TaskLZCPResult tlr;
	
	
	
	public ICadreArchiveManager getCadreArchiveManager() {
		return cadreArchiveManager;
	}

	public void setCadreArchiveManager(ICadreArchiveManager cadreArchiveManager) {
		this.cadreArchiveManager = cadreArchiveManager;
	}

	public ITaskLZCPManager getTaskLZCPManager() {
		return taskLZCPManager;
	}

	public void setTaskLZCPManager(ITaskLZCPManager taskLZCPManager) {
		this.taskLZCPManager = taskLZCPManager;
	}

	public TaskLZCP getTaskLZCP() {
		return taskLZCP;
	}

	public void setTaskLZCP(TaskLZCP taskLZCP) {
		this.taskLZCP = taskLZCP;
	}
	
	
	public TaskLZCPResult getTlr() {
		return tlr;
	}

	public void setTlr(TaskLZCPResult tlr) {
		this.tlr = tlr;
	}

	public void addTaskLZCP(){
		
		HttpServletResponse response = ServletActionContext.getResponse();
		response.setCharacterEncoding("UTF-8");
		PrintWriter pw = null;
		
		try{
			pw=response.getWriter();
			this.getTaskLZCPManager().addTaskLZCP(taskLZCP);
			
			pw.print("success");
			
		}catch (Exception e) {
			if(pw!=null){
				pw.print("error");
			}
			log.error("添加廉政测评任务失败",e);
			
		}
	}
	
	
	public void deleteTaskLZCP(){
		
		HttpServletResponse response = ServletActionContext.getResponse();
		response.setCharacterEncoding("UTF-8");
		PrintWriter pw = null;
		
		try{
			pw=response.getWriter();
			this.getTaskLZCPManager().deleteTaskLZCP(taskLZCP.getId());
			
			pw.print("success");
			
		}catch (Exception e) {
			if(pw!=null){
				pw.print("error");
			}
			log.error("删除廉政测评任务失败",e);
			
		}
	}
	
	public void modifyTaskLZCP(){
		
		HttpServletResponse response = ServletActionContext.getResponse();
		response.setCharacterEncoding("UTF-8");
		PrintWriter pw = null;
		
		try{
			pw=response.getWriter();
			this.getTaskLZCPManager().modify(taskLZCP);
			
			pw.print("success");
			
		}catch (Exception e) {
			if(pw!=null){
				pw.print("error");
			}
			log.error("修改廉政测评失败",e);
			
		}
		
	}
	
	
	public void pushTaskLZCP(){
		HttpServletResponse response = ServletActionContext.getResponse();
		
		response.setCharacterEncoding("UTF-8");
		PrintWriter pw = null;
		
		try{
			
			pw=response.getWriter();
			
			taskLZCP=this.getTaskLZCPManager().getTaskLZCPById(taskLZCP.getId());
			
			taskLZCP.setState(1);
			
			this.getTaskLZCPManager().modify(taskLZCP);
			
			ServletContext servletContext = ServletActionContext.getServletContext();
			
			List<WorkArchive> units = (List<WorkArchive>)servletContext.getAttribute("units_list");
			
			for(WorkArchive unit:units){
				
				TaskLZCPResult tlr=new TaskLZCPResult();
				
				tlr.setTaskLZCP(taskLZCP);
				
				tlr.setUnit(unit);
				
				this.getTaskLZCPManager().addTaskLZCPResult(tlr);
				
				
				List<CadreArchive> cas = this.getCadreArchiveManager().getCadreArchiveByWCID(unit.getId());
				
				
				for(CadreArchive ca:cas){
					
					LeaderLZCP leaderLZCP=new LeaderLZCP();
					leaderLZCP.setName(	ca.getCname());
					leaderLZCP.setZc(ca.getMajor());
					leaderLZCP.setTlr(tlr);
					System.out.println(tlr.getId());
					this.getTaskLZCPManager().addLeaderLZCP(leaderLZCP);
					
					
				}
				
				
			}
			
			pw.print("success");
			
		}catch (Exception e) {
			if(pw!=null){
				pw.print("error");
			}
			log.error("发布任务失败", e);
		}
		
	}
	
	public void getAllTaskLZCP(){
		
		HttpServletResponse response = ServletActionContext.getResponse();
		response.setCharacterEncoding("UTF-8");
		PrintWriter pw = null;
		
		try{
			pw=response.getWriter();
			
			List<TaskLZCP> ts= this.getTaskLZCPManager().getTaskLZCP(taskLZCP, this.getRows(),this.getPage());
			
			int res=this.getTaskLZCPManager().getTaskLZCPTotal(taskLZCP);
			
			JSONArray ja=JSONArray.fromObject(ts);
			
			JSONObject jo=new JSONObject();
			
			
			jo.put("total", res);
			
			jo.put("rows", ja);
			
			pw.print(jo);
			
		}catch (Exception e) {
			if(pw!=null){
				pw.print("error");
			}
			log.error("查询廉政测评任务失败",e);
		}
		
	}
	
	
	public void getTaskLZCPResults(){
		HttpSession session = ServletActionContext.getRequest().getSession();
		HttpServletResponse response = ServletActionContext.getResponse();
		response.setCharacterEncoding("UTF-8");
		PrintWriter pw = null;
		
		try{
			pw=response.getWriter();
			
			User user =(User)session.getAttribute("user");
			
			
			
			List<TaskLZCPResult> tlrs = this.getTaskLZCPManager().getTaskLZCPResultsByUnit(user.getUnitId(), 0);
			
			
			JsonConfig config = new JsonConfig();
			config.setJsonPropertyFilter(new PropertyFilter() {			
				@Override
				public boolean apply(Object arg0, String arg1, Object arg2) {
					if (arg1.equals("id")||arg1.equals("title")
							||arg1.equals("date")||arg1.equals("lastDate")
							||arg1.equals("remark")||arg1.equals("lastDate")
							||arg1.equals("satisfiedCount")||arg1.equals("ordinaryCount")
							||arg1.equals("unsatisfiedCount")||arg1.equals("resultDate")
							||arg1.equals("wname")||arg1.equals("unit")||arg1.equals("taskLZCP")
							||arg0 instanceof Date||arg1.equals("state")||arg1.equals("leaders")
							||arg1.equals("name")||arg1.equals("zc")) {
						return false;
					} else {
						return true;
					}
				}
			});
			JSONArray ja=JSONArray.fromObject(tlrs,config);
			pw.print(ja);
		}catch (Exception e) {
			if(pw!=null){
				pw.print("error");
			}
			log.error("查询廉政测评反馈单出错",e);
		}
	}
	
	
	public void updateTaskLZCPResult(){
		HttpServletResponse response = ServletActionContext.getResponse();
		HttpServletRequest request=ServletActionContext.getRequest();
		response.setCharacterEncoding("UTF-8");
		PrintWriter pw = null;
		
		try{
			
			pw=response.getWriter();
			
			String id=tlr.getId();
			tlr = this.getTaskLZCPManager().getTaskLZCPResultById(id);
			List<LeaderLZCP> leaderList = tlr.getLeaders();
			
			String strLeader = request.getParameter("leader");
			
			JSONArray jsonLeader = JSONArray.fromObject(strLeader);
			
			for(int i=0;i<jsonLeader.size();i++){
				
				for(LeaderLZCP leader: leaderList){
					
					JSONObject jo=jsonLeader.getJSONObject(i);
					
					if(jo.getString("id").equals(leader.getId())){
						leader.setSatisfiedCount(jo.getInt("satisfiedCount"));
						leader.setOrdinaryCount(jo.getInt("ordinaryCount"));
						leader.setUnsatisfiedCount(jo.getInt("unsatisfiedCount"));
						this.getTaskLZCPManager().modifyLeaderLZCP(leader);
					}
				}
			}
			pw.print("success");
		}catch (Exception e) {
			
			if(pw!=null){
				pw.print("error");
			}
			
			log.error("上报测评反馈错误",e);
		}
	}
	
	
	
	public void getLeaderByYea(){
		HttpServletResponse response = ServletActionContext.getResponse();
		HttpServletRequest request=ServletActionContext.getRequest();
		response.setCharacterEncoding("UTF-8");
		PrintWriter pw = null;
		try{
			
			pw=response.getWriter();
			
			String year = request.getParameter("year");
			if(year!=null&&!"".equals(year)){
				List<LeaderLZCP> list = this.getTaskLZCPManager().getLeaderLZCPByYear(year);
				
				JsonConfig config = new JsonConfig();
				config.setJsonPropertyFilter(new PropertyFilter() {			
					@Override
					public boolean apply(Object arg0, String arg1, Object arg2) {
						if (arg1.equals("id")||arg1.equals("satisfiedCount")||arg1.equals("ordinaryCount")
								||arg1.equals("unsatisfiedCount")||arg1.equals("wname")||arg1.equals("unit")
								||arg1.equals("tlr")||arg1.equals("name")||arg1.equals("zc")) {
							return false;
						} else {
							return true;
						}
					}
				});
				JSONArray ja=JSONArray.fromObject(list,config);
				
				pw.print(ja);
				
			}
			
		}catch (Exception e) {
			
			if(pw!=null){
				pw.print("error");
			}
			log.error("查询年度领导班子测评失败！",e);
		}
		
	}

	
}
