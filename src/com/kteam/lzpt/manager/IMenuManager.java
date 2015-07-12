package com.kteam.lzpt.manager;

import java.util.List;

import com.kteam.lzpt.entity.Menu;

public interface IMenuManager {
	
	//查询系统所有菜单
	public List<Menu> getMenus();
	
	public List<Menu> getMenusByid(String Id);
	
	public List<Menu> getRootMenus();
	
}
