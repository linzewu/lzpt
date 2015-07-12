package com.kteam.lzpt.web.action;

import java.io.PrintWriter;

import javax.servlet.http.HttpServletResponse;

import net.sf.ezmorph.object.DateMorpher;
import net.sf.json.JSONObject;
import net.sf.json.util.JSONUtils;

import org.apache.struts2.ServletActionContext;

import com.kteam.lzpt.entity.Criticism;

public class CriticismAction extends BaseManagerAction{
	
	public void saveBaseEntity() {
		if (this.getBe() != null) {
			HttpServletResponse response = ServletActionContext.getResponse();
			response.setCharacterEncoding("UTF-8");
			PrintWriter pw = null;
			JSONObject respondData = new JSONObject();
			try {
				pw = response.getWriter();
				changeBeFormater();
				Object baseEntity = toBean(this.getBe());
				String id = null;
				// 如果Id为空则执行新增
				if (baseEntity != null) {
					if (this.getBe().get("id") == null
							|| "".equals(this.getBe().getString("id").trim())) {
						id = this.getBaseManager()
								.addBaseEntity(baseEntity);
					} else {
						this.getBaseManager()
								.updateBaseEntity(baseEntity);
						id = this.getBe().getString("id");
					}
					respondData.put("state", 200);
					respondData.put("sid", id);
					pw.print(respondData.toString());
				} else {
					respondData.put("state", 400);
					pw.print(respondData.toString());
				}
				log.debug("数据保存成功"+this.getBe());
				
			} catch (Exception e) {
				if (pw != null) {
					respondData.put("state", 500);
					pw.print(respondData.toString());
				}
				log.error("数据保存错误",e);
			} finally {
				if (pw != null) {
					pw.close();
				}
			}
		}
	}
	
	private Object toBean(JSONObject be) throws ClassNotFoundException {
		Object o = null;
		JSONUtils.getMorpherRegistry().registerMorpher(
				new DateMorpher(new String[] { "yyyy-MM-dd hh:mm:ss" }));
		if (be != null) {
			String actionType = (String) be.get("actionType");
			Class c = this.getClass().getClassLoader().loadClass(PACK+"."+formaterActionType(actionType));
			log.info(PACK+"."+formaterActionType(actionType));
			log.info(be);
			 o = JSONObject.toBean(be, c);
		}
		return o;
	}

}
