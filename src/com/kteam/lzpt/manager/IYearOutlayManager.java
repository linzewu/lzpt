package com.kteam.lzpt.manager;

import java.util.List;

import com.kteam.lzpt.entity.YearOutlay;

public interface IYearOutlayManager {
	
	/**
	 * 添加年度经费
	 * @param yo
	 */
	public void addYearOutlay(YearOutlay yo);
	
	/**
	 * 删除年度经费
	 * @param id
	 */
	public void deleteYearOutlay(String id);
	
	/**
	 * 修改年度经费
	 * @param yo
	 */
	public void modifyYearOutlay(YearOutlay yo);
	
	/**
	 * 根据id查询年度经费
	 * @param id
	 * @return
	 */
	public YearOutlay getYearOutlayById(String id);
	
	/**
	 * 查询年度经费列表
	 * @param yo
	 * @param pageSize
	 * @param pageNumber
	 * @return
	 */
	public List<YearOutlay> getYearOutlays(YearOutlay yo,final int pageSize, final int pageNumber,final String uname);
	
	/**
	 * 查询年度经费记录数
	 * @param yo
	 * @return
	 */
	public int getYearOutlayCount(YearOutlay yo,final String uname);
	
	/**
	 * 年度经费对比
	 * @param year1
	 * @param year2
	 * @param waid
	 * @param uname
	 * @return
	 */
	public List getYearOutlayCompare(int year1,int year2,String waid,String uname);

}
