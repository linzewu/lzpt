package com.kteam.lzpt.entity;

import java.util.List;

/** 
 * <p>Title: Menu</p> 
 * <p>Description: </p> 
 * <p>version:1.0</p> 
 * <p>Company: dcss</p> 
 * @author    林泽武 
 * @date       2012-7-5 
 * <p>
 * 修改时间：<br/>
 * 修改人：<br/>
 * 修改原因：<br/>
 * </p>
 */
public class Menu extends BaseEntity {
	
	//菜单显示
	public static final int  DISPLAY_SHOW=0;
	
	//菜单不显示
	public static final int  DISPLAY_NO=1;
	
	//菜单Id 序列化 
	private String id;
	
	//菜单标题
	private String title;
	
	//菜单连接地址
	private String url;
	
	//父节点
	private Menu parent;
	
	//子菜单集合
	private List<Menu> subMenus;

	//显示顺序
	private int index;
	
	//是否显示
	private int display;
	
	//菜单包含的Action
	private List<Action> actions;
	
	//菜单级别
	private int level;
	
	/**主键Id
	 * @return the id
	 */
	public String getId() {
	
		return id;
	}

	/**主键Id
	 * @param id the id to set
	 */
	public void setId(String id) {
	
		this.id = id;
	}

	/**
	 * 标题
	 * @return the title
	 */
	public String getTitle() {
	
		return title;
	}

	/**
	 * 标题
	 * @param title the title to set
	 */
	public void setTitle(String title) {
	
		this.title = title;
	}

	/**
	 * 菜单连接路径
	 * @return the url
	 */
	public String getUrl() {
	
		return url;
	}

	/**
	 * 菜单连接路径
	 * @param url the url to set
	 */
	public void setUrl(String url) {
	
		this.url = url;
	}

	/**
	 * 父菜单
	 * @return the parent
	 */
	public Menu getParent() {
	
		return parent;
	}

	/**
	 * 父菜单
	 * @param parent the parent to set
	 */
	public void setParent(Menu parent) {
	
		this.parent = parent;
	}

	/**
	 * @return the subMenu
	 */
	public List<Menu> getSubMenus() {
	
		return subMenus;
	}

	/**
	 * @param subMenu the subMenu to set
	 */
	public void setSubMenus(List<Menu> subMenus) {
	
		this.subMenus = subMenus;
	}

	/**
	 * 显示的优先级
	 * @return the index
	 */
	public int getIndex() {
	
		return index;
	}

	/**
	 * 显示的优先级
	 * @param index the index to set
	 */
	public void setIndex(int index) {
	
		this.index = index;
	}

	/**
	 * 是否显示
	 * @return the display
	 */
	public int getDisplay() {
	
		return display;
	}

	/**
	 * 是否显示
	 * @param display the display to set
	 */
	public void setDisplay(int display) {
	
		this.display = display;
	}

	/**
	 * 菜单包含的Action
	 * @return the actions
	 */
	public List<Action> getActions() {
	
		return actions;
	}

	/**
	 * 菜单包含的Action
	 * @param actions the actions to set
	 */
	public void setActions(List<Action> actions) {
	
		this.actions = actions;
	}

	/**
	 *	菜单级数
	 * @return the level
	 */
	public int getLevel() {
	
		return level;
	}

	/**
	 * 菜单级数
	 * @param level the level to set
	 */
	public void setLevel(int level) {
	
		this.level = level;
	}

}
