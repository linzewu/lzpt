package com.kteam.lzpt.web.action;

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

import org.apache.struts2.ServletActionContext;
import org.hibernate.criterion.Criterion;
import org.hibernate.criterion.ProjectionList;

import com.kteam.lzpt.common.DateJsonValueProcessor;
import com.kteam.lzpt.entity.criterions.CriterionManager;
import com.kteam.lzpt.entity.sqls.SQLManager;
import com.kteam.lzpt.manager.IBaseManager;

public class BaseManagerAction extends BaseAction {

	protected final static String PACK = "com.kteam.lzpt.entity";

	private IBaseManager baseManager;

	private JSONObject be;

	public IBaseManager getBaseManager() {
		return baseManager;
	}

	protected String getDateFomatter() {

		if (be.get("df") == null) {
			return "yyyy-MM-dd";
		} else {
			String df = (String) be.get("df");
			if (df.equals("d2")) {
				return "yyyy-MM-dd hh:mm:ss";
			} else {
				return "yyyy-MM-dd";
			}
		}
	}

	public void setBaseManager(IBaseManager baseManager) {
		this.baseManager = baseManager;
	}

	public JSONObject getBe() {
		return be;
	}

	public void setBe(JSONObject be) {
		this.be = be;
	}

	protected void changeBeFormater() {
		if (be != null) {
			Set<String> keySet = be.keySet();
			for (String key : keySet) {
				be.put(key, be.getJSONArray(key).get(0));
			}
		}
	}

	protected String formaterActionType(String actionType) {
		if (actionType != null && !"".equals(actionType.trim())) {
			String first = actionType.substring(0, 1).toUpperCase();
			if (actionType.length() == 1) {
				actionType = first;
			} else {
				String last = actionType.substring(1, actionType.length());
				actionType = first + last;
			}
		}
		return actionType;
	}

	private Object toBean(JSONObject be) throws ClassNotFoundException {
		Object o = null;
		JSONUtils.getMorpherRegistry().registerMorpher(
				new DateMorpher(new String[] { "yyyy-MM-dd hh:mm:ss",
						"yyyy-MM-dd" }));
		if (be != null) {
			String actionType = (String) be.get("actionType");
			Class c = this.getClass().getClassLoader()
					.loadClass(PACK + "." + formaterActionType(actionType));
			log.info(PACK + "." + formaterActionType(actionType));
			log.info(be);
			o = JSONObject.toBean(be, c);
		}
		return o;
	}

	/**
	 * 保存数据的公共服务
	 */
	public void saveBaseEntity() {
		if (be != null) {
			HttpServletResponse response = ServletActionContext.getResponse();
			response.setCharacterEncoding("UTF-8");
			PrintWriter pw = null;
			JSONObject respondData = new JSONObject();
			try {
				pw = response.getWriter();
				changeBeFormater();
				Object baseEntity = toBean(be);
				String id = null;
				// 如果Id为空则执行新增
				if (baseEntity != null) {
					if (be.get("id") == null
							|| "".equals(be.getString("id").trim())) {
						id = this.baseManager.addBaseEntity(baseEntity);
					} else {
						this.baseManager.updateBaseEntity(baseEntity);
						id = be.getString("id");
					}
					respondData.put("state", 200);
					respondData.put("sid", id);
					pw.print(respondData.toString());
				} else {
					respondData.put("state", 400);
					pw.print(respondData.toString());
				}
				log.debug("数据保存成功" + be);

			} catch (Exception e) {
				if (pw != null) {
					respondData.put("state", 500);
					pw.print(respondData.toString());
				}
				log.error("数据保存错误", e);
			} finally {
				if (pw != null) {
					pw.close();
				}
			}
		}
	}

	public void getBaseEntity() {
		if (be != null) {
			HttpServletResponse response = ServletActionContext.getResponse();
			response.setCharacterEncoding("UTF-8");
			PrintWriter pw = null;
			JSONObject respondData = new JSONObject();
			changeBeFormater();
			String actionType = (String) be.get("actionType");
			String id = (String) be.get("id");
			try {
				pw = response.getWriter();
				if (actionType != null && id != null) {
					Class c = this
							.getClass()
							.getClassLoader()
							.loadClass(
									PACK + "." + formaterActionType(actionType));
					Object o = this.getBaseManager().getBaseEntity(c, id);
					JsonConfig config = new JsonConfig();
					// 转换日期格式
					config.registerJsonValueProcessor(Date.class,
							new DateJsonValueProcessor(getDateFomatter()));
					JSONObject jo = JSONObject.fromObject(o, config);
					respondData.put("state", 200);
					respondData.put("data", addPrefix(jo));
					pw.print(respondData);
				} else {
					respondData.put("state", 500);
					respondData.put("error", "actionType或者id为null");
				}
			} catch (Exception e) {
				respondData.put("state", 500);
				log.error("数据加载错误", e);
				pw.print(respondData);
			} finally {
				if (pw != null) {
					pw.close();
				}
			}
		}
	}

	public void getBaseEntityList() {
		if (be != null) {
			HttpServletResponse response = ServletActionContext.getResponse();
			response.setCharacterEncoding("UTF-8");
			PrintWriter pw = null;
			JSONObject respondData = new JSONObject();
			changeBeFormater();
			String actionType = (String) be.get("actionType");
			String queryType = (String) be.get("queryType");
			try {
				Class c = this.getClass().getClassLoader()
						.loadClass(PACK + "." + formaterActionType(actionType));
				List<Criterion> criterions = null;
				ProjectionList projections = null;
				Map pageMap = null;
				if (queryType != null) {
					criterions = CriterionManager.getInstance()
							.getCriterionsByActionType(queryType, be);
					projections = CriterionManager.getInstance()
							.getProjectionsByActionType(queryType, be);
				}
				if (this.getRows() != 0 && this.getPage() != 0) {
					pageMap = new HashMap();
					pageMap.put("pageSize", this.rows);
					pageMap.put("pageNumber", this.page);
				}

				List list = this.getBaseManager().getBaseEntityList(c,
						criterions, projections, pageMap);
				Integer count = this.getBaseManager().getBaseEntityCount(c,
						criterions, projections);
				JsonConfig config = new JsonConfig();
				// 转换日期格式
				config.registerJsonValueProcessor(Date.class,
						new DateJsonValueProcessor(getDateFomatter()));

				JSONArray array = JSONArray.fromObject(list, config);

				pw = response.getWriter();
				respondData.put("state", 200);
				respondData.put("total", count);
				respondData.put("rows", addPrefix(array));
				pw.print(respondData);
			} catch (Exception e) {
				log.error("查询列表错误", e);
				if (pw != null) {
					respondData.put("state", 500);
				}
			} finally {
				if (pw != null) {
					pw.close();
				}
			}
		}
	}

	public void getBaseEntityListNoPagination() {
		if (be != null) {
			HttpServletResponse response = ServletActionContext.getResponse();
			response.setCharacterEncoding("UTF-8");
			PrintWriter pw = null;
			JSONObject respondData = new JSONObject();
			changeBeFormater();
			String actionType = (String) be.get("actionType");
			String queryType = (String) be.get("queryType");
			try {
				Class c = this.getClass().getClassLoader()
						.loadClass(PACK + "." + formaterActionType(actionType));
				List<Criterion> criterions = null;
				ProjectionList projections = null;
				if (queryType != null) {
					criterions = CriterionManager.getInstance()
							.getCriterionsByActionType(queryType, be);
					projections = CriterionManager.getInstance()
							.getProjectionsByActionType(queryType, be);
				}

				List list = this.getBaseManager().getBaseMapList(c,
						criterions, projections, null);
				JsonConfig config = new JsonConfig();
				// 转换日期格式
				config.registerJsonValueProcessor(Date.class,
						new DateJsonValueProcessor(getDateFomatter()));

				JSONArray array = JSONArray.fromObject(list, config);

				pw = response.getWriter();
				respondData.put("state", 200);
				respondData.put("rows", array);
				pw.print(respondData);
			} catch (Exception e) {
				log.error("查询列表错误", e);
				if (pw != null) {
					respondData.put("state", 500);
				}
			} finally {
				if (pw != null) {
					pw.close();
				}
			}
		}
	}

	public void getBaseUniqueResult() {
		if (be != null) {
			HttpServletResponse response = ServletActionContext.getResponse();
			response.setCharacterEncoding("UTF-8");
			PrintWriter pw = null;
			JSONObject respondData = new JSONObject();
			changeBeFormater();
			String actionType = (String) be.get("actionType");
			String queryType = (String) be.get("queryType");
			try {
				Class c = this.getClass().getClassLoader()
						.loadClass(PACK + "." + formaterActionType(actionType));
				List<Criterion> criterions = null;
				ProjectionList projections = null;
				if (queryType != null) {
					criterions = CriterionManager.getInstance()
							.getCriterionsByActionType(queryType, be);
					projections = CriterionManager.getInstance()
							.getProjectionsByActionType(queryType, be);
				}

				Object o = this.getBaseManager().getBaseUniqueResult(c,
						criterions, projections);
				JsonConfig config = new JsonConfig();
				// 转换日期格式
				config.registerJsonValueProcessor(Date.class,
						new DateJsonValueProcessor(getDateFomatter()));
				pw = response.getWriter();
				respondData.put("state", 200);
				respondData.put("data", o);
				pw.print(respondData);
			} catch (Exception e) {
				log.error("查询列表错误", e);
				if (pw != null) {
					respondData.put("state", 500);
				}
			} finally {
				if (pw != null) {
					pw.close();
				}
			}
		}
	}

	public void deleteBaseEntity() {
		if (be != null) {
			HttpServletResponse response = ServletActionContext.getResponse();
			response.setCharacterEncoding("UTF-8");
			PrintWriter pw = null;
			JSONObject respondData = new JSONObject();
			changeBeFormater();
			String actionType = (String) be.get("actionType");
			try {
				pw = response.getWriter();
				Class c = this.getClass().getClassLoader()
						.loadClass(PACK + "." + formaterActionType(actionType));
				Object object = toBean(be);
				this.getBaseManager().deleteBaseEntity(object);
				respondData.put("state", 200);
				pw.print(respondData);
			} catch (Exception e) {
				log.error("数据删除失败", e);
				respondData.put("state", 500);
				pw.print(respondData);
			} finally {
				if (pw != null) {
					pw.close();
				}
			}

		}
	}

	public void getBaseList() {
		if(be!=null){
			HttpServletResponse response = ServletActionContext.getResponse();
			response.setCharacterEncoding("UTF-8");
			PrintWriter pw = null;
			JSONObject respondData = new JSONObject();
			try{
				changeBeFormater();
				pw=response.getWriter();
				String queryType=(String)be.get("queryType");
				
				if(queryType!=null){
					String sql = SQLManager.getInstance().getSQLByQueryType(queryType, be);
					Map pageMap=null;
					if (this.getRows() != 0 && this.getPage() != 0) {
						pageMap = new HashMap();
						pageMap.put("pageSize", this.rows);
						pageMap.put("pageNumber", this.page);
					}
					
					List<Object> list = this.getBaseManager().getBaseListOfSql(sql,be,pageMap);
					
					JSONArray ja= JSONArray.fromObject(list);
					
					respondData.put("rows", ja);
					
					String countSQL = SQLManager.getInstance().getSQLCountByQueryType(queryType, be);
					if(countSQL!=null){
						Integer count=(Integer)this.getBaseManager().getBaseCountOfSql(countSQL,be);
						respondData.put("total", count);
					}
					respondData.put("state", 200);
					pw.print(respondData);
				}
			}catch(Exception e){
				log.error("getBaseList 异常", e);
				respondData.put("state", 500);
				pw.print(respondData);
			}finally{
				if(pw!=null){
					pw.close();
				}
			}
		}
	}
	
	public void getUniqueQueryResult() {
		if(be!=null){
			HttpServletResponse response = ServletActionContext.getResponse();
			response.setCharacterEncoding("UTF-8");
			PrintWriter pw = null;
			try{
				changeBeFormater();
				pw=response.getWriter();
				String queryType=(String)be.get("queryType");
				if(queryType!=null){
					String sql = SQLManager.getInstance().getSQLByQueryType(queryType, be);
					
					Object object = this.getBaseManager().getUniqueQueryResult(sql,be);
					
					pw.print(object.toString());
				}
			}catch(Exception e){
				JSONObject respondData = new JSONObject();
				log.error("getBaseList 异常", e);
				respondData.put("state", 500);
				pw.print(respondData);
			}finally{
				if(pw!=null){
					pw.close();
				}
			}
		}
	}

	private JSONArray addPrefix(JSONArray jsonArray) {
		JSONArray newJson = new JSONArray();
		for (Object object : jsonArray) {
			JSONObject jo = (JSONObject) object;
			Set<String> keySet = jo.keySet();
			JSONObject newj0 = new JSONObject();
			for (String key : keySet) {
				newj0.put("be." + key, jo.get(key));
			}
			newJson.add(newj0);
		}
		return newJson;
	}

	private JSONObject addPrefix(JSONObject jo) {
		Set<String> keySet = jo.keySet();
		JSONObject newj0 = new JSONObject();

		for (String key : keySet) {
			newj0.put("be." + key, jo.get(key));
		}
		return newj0;
	}

	@Override
	public String toPage() {
		return "success";
	}

}
