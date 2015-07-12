package com.kteam.lzpt.web.action;

import java.io.PrintWriter;
import java.util.List;

import javax.servlet.http.HttpServletResponse;

import net.sf.json.JSONObject;

import org.apache.struts2.ServletActionContext;

import com.kteam.lzpt.entity.Criticism;
import com.kteam.lzpt.entity.Notice;
import com.kteam.lzpt.entity.criterions.CriticismCriterion;
import com.kteam.lzpt.entity.criterions.NoticeCriterion;
import com.kteam.lzpt.manager.IBaseManager;

public class DPMessageAction extends BaseAction {
	
	private IBaseManager baseManager;
	
	public IBaseManager getBaseManager() {
		return baseManager;
	}

	public void setBaseManager(IBaseManager baseManager) {
		this.baseManager = baseManager;
	}



	public void getMessage(){
		HttpServletResponse response = ServletActionContext.getResponse();
		response.setCharacterEncoding("UTF-8");
		PrintWriter pw = null;
		JSONObject respondData = new JSONObject();
		
		try {
			pw = response.getWriter();
			CriticismCriterion cc=new CriticismCriterion();
			NoticeCriterion nc=new NoticeCriterion();
			List  criticismList = this.getBaseManager().getBaseEntityList(Criticism.class, cc.getCriterions(null), null, null);
			List noticeList = this.getBaseManager().getBaseEntityList(Notice.class, nc.getCriterions(null), null, null);
			respondData.put("ccMessage", criticismList);
			respondData.put("ncMessage", noticeList);
			respondData.put("state", 200);
			pw.print(respondData);
		} catch (Exception e) {
			log.error("查询消息错误",e);
			respondData.put("state", 500);
			pw.print(respondData);
		}finally{
			if(pw!=null){
				pw.close();
			}
		}
	}

}
