package com.kteam.lzpt.manager;

import java.util.List;

import com.kteam.lzpt.entity.QuarterOutlay;

public interface IQuarterOutlayManager {
	
	/**
	 * 添加季度经费
	 * @param qo
	 */
	public void addQuarterOutlay(QuarterOutlay qo);
	
	/**
	 * 删除季度经费
	 * @param id
	 */
	public void deleteQuarterOutlay(String id);
	
	/**
	 * 修改季度经费
	 * @param qo
	 */
	public void modifyQuarterOutlay(QuarterOutlay qo);
	
	/**
	 * 根据id查询季度经费
	 * @param id
	 * @return
	 */
	public QuarterOutlay getQuarterOutlayById(String id);
	
	/**
	 * 查询季度经费列表
	 * @param qo
	 * @param pageSize
	 * @param pageNumber
	 * @return
	 */
	public List<QuarterOutlay> getQuarterOutlays(QuarterOutlay qo,final int pageSize, final int pageNumber,final String uname);
	
	/**
	 * 查询季度经费记录数
	 * @param qo
	 * @return
	 */
	public int getQuarterOutlayCount(QuarterOutlay qo,final String uname);
	
	/**
	 * 查询季度经费  三公经费支出监察
	 * @param qo
	 * @return
	 */
	public List getQuarterOutlaysCheck(QuarterOutlay qo,String uname);
	
	/**
	 * 判断季度经费是否存在
	 * @param qo
	 * @param uname
	 * @return
	 */
	public int isQuarterExist(QuarterOutlay qo,String uname);

}
