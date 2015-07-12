package com.kteam.lzpt.web.util;

import java.io.File;
import java.util.List;

import javax.servlet.ServletContext;
import javax.servlet.ServletContextEvent;
import javax.servlet.ServletContextListener;

import net.sf.json.JSONArray;
import net.sf.json.JSONObject;
import net.sf.json.JsonConfig;
import net.sf.json.util.PropertyFilter;

import org.apache.commons.logging.Log;
import org.apache.commons.logging.LogFactory;
import org.hibernate.Hibernate;
import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.springframework.web.context.WebApplicationContext;
import org.springframework.web.context.support.WebApplicationContextUtils;

import com.kteam.lzpt.entity.WorkArchive;
import com.kteam.lzpt.entity.WorkItem;
import com.kteam.lzpt.manager.IWorkArchiveManager;

/**
 * Application Lifecycle Listener implementation class InitListener
 * 
 */
public class InitListener implements ServletContextListener {
	
	protected static Log log = LogFactory.getLog(InitListener.class);
	
	private SessionFactory sessionFactory;
	
	private WebApplicationContext wac;

	/**
	 * Default constructor.
	 */
	public InitListener() {
	}

	/**
	 * @see ServletContextListener#contextInitialized(ServletContextEvent)
	 */
	public void contextInitialized(ServletContextEvent contextEvent) {
		
		wac =  WebApplicationContextUtils.getWebApplicationContext(contextEvent.getServletContext());
		
		sessionFactory = (SessionFactory)wac.getBean("sessionFactory");
		
		initTomcatPath();
		
		initItemInContext(contextEvent.getServletContext());
		
		initUnit(contextEvent.getServletContext());
		
		
		
	}

	private void initUnit(ServletContext servletContext) {
		
		IWorkArchiveManager wam =(IWorkArchiveManager)wac.getBean("workArchiveManager");
		
		List<WorkArchive> units = wam.getWorkArchives();
		
		JSONArray ja=new JSONArray();
		
		for(WorkArchive unit: units){
			JSONObject jo=new JSONObject();
			jo.put("id",unit.getId());
			jo.put("text",unit.getWname());
			ja.add(jo);
		}
		
		JSONObject jo=new JSONObject();
		
		jo.put("id","0");
		
		jo.put("text", "单位");
		jo.put("children", ja);
		
		servletContext.setAttribute("units", "["+jo.toString()+"]");
		
		servletContext.setAttribute("units_list", units);
		
		log.info(ja.toString());
		
		
	}

	public void contextDestroyed(ServletContextEvent arg0) {
	}

	private void initTomcatPath() {
		
		String tomcatPath = this.getClass().getClassLoader().getResource("/")
				.getPath();
		String uploadCadre = tomcatPath.substring(0,tomcatPath.indexOf("/WEB-INF"));
		tomcatPath = tomcatPath.substring(0, tomcatPath.indexOf("/webapps"));

		String uploadPath = tomcatPath + "/upload";

		File uploadFile = new File(uploadPath);

		if (!uploadFile.exists()) {
			uploadFile.mkdir();
		}
		
		File uploadCadreFile = new File(uploadCadre+"/uploadCadre");
    	if(!uploadCadreFile.exists()){
    		uploadCadreFile.mkdir();
    	}
		System.setProperty("tomcat.dir", tomcatPath);
		System.setProperty("uploadCadrePath",uploadCadre);
	}
	
	
	private void initItemInContext(ServletContext servletContext){
		
		Session session = sessionFactory.openSession();
		
		List<WorkItem> wis = session.createQuery("From WorkItem wi where wi.parent is null").list();
		
		JsonConfig config = new JsonConfig();
		config.setJsonPropertyFilter(new PropertyFilter() {			
			@Override
			public boolean apply(Object arg0, String arg1, Object arg2) {
				if (arg1.equals("parent")) {
					return true;
				} else {
					return false;
				}			
			}
		});
		
		JSONArray ja=cacheLazy(wis);
		
		log.info(ja.toString());
		servletContext.setAttribute("wis", ja.toString());
	}
	
	
	private JSONArray cacheLazy(List<WorkItem> wis){
		
		JSONArray ja=new JSONArray();
		
		for(WorkItem workItem:wis){
			JSONObject jo=new JSONObject();
			jo.put("id", workItem.getId());
			jo.put("text", workItem.getName());
			
			Hibernate.initialize(workItem.getItems());
			JSONArray subJa = cacheLazy(workItem.getItems());
			if(subJa.size()>0){
				jo.put("state","open");
				jo.put("children", subJa);
			}
			
			ja.add(jo);
		}
		
		return ja;
	}

}
