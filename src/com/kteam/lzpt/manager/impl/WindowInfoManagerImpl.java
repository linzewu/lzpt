package com.kteam.lzpt.manager.impl;

import java.util.List;

import org.springframework.orm.hibernate3.support.HibernateDaoSupport;

import com.kteam.lzpt.entity.WindowInfo;
import com.kteam.lzpt.manager.IWindowInfoManager;

public class WindowInfoManagerImpl extends HibernateDaoSupport implements IWindowInfoManager  {

	@Override
	public void addWindowInfo(WindowInfo wi) {
		
		this.getHibernateTemplate().save(wi);

	}

	@Override
	public void modifyWindowInfo(WindowInfo wi) {
		
		this.getHibernateTemplate().update(wi);

	}

	@Override
	public WindowInfo getWindowInfoById(String id) {
		
		WindowInfo wi = this.getHibernateTemplate().get(WindowInfo.class, id);
		
		return wi;
	}

	@Override
	public List<WindowInfo> getWindowInfos() {
		
		@SuppressWarnings({"unchecked" })
		List<WindowInfo> wis = this.getHibernateTemplate().find("From WindowInfo");
		
		return wis;
	}

}
