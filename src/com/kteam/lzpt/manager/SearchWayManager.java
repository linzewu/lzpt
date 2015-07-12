package com.kteam.lzpt.manager;

import java.util.List;


import com.kteam.lzpt.entity.SearchWay;

public interface SearchWayManager {
	public List<SearchWay> querySearchWay(final SearchWay sw,final int pageSize,
			final int pageNumber) ;
	
	/**
	 * 查找搜索方式总记录
	 * @param sw
	 * @return int
	 */
	public int getSearchWayTotal(SearchWay sw);
	
	/**
	 * 分页查询搜索方式
	 * @param searchWay
	 */
	public void addSearchWay(SearchWay searchWay) ;
	
	/**
	 * 更新搜索方式
	 * @param searchWay
	 */
	public void updateSearchWay(SearchWay searchWay);
	
	/**
	 * 查询所有搜索方式
	 * @return List<SearchWay>
	 */
	public List<SearchWay> querySearchWays();
	
	/**
	 * 根据id查询所有搜索方式
	 * @param id
	 * @return
	 */
	public List<SearchWay> querySearchWaysById(String[] id);

}
