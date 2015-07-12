package com.kteam.lzpt.manager;

import java.util.List;


import com.kteam.lzpt.entity.PunishAppeal;

public interface IPunishAppealManager {
	
	public void addPunishAppeal(PunishAppeal pa);
	
    public void modifyPunishAppeal(PunishAppeal pa);
	
	public void deletePunishAppeal(String id);
	
	/**
	 * 分页查询惩罚诉求
	 * @param kw
	 * @param pageSize
	 * @param pageNumber
	 * @return List<KeyWordsConfig>
	 */
	public List<PunishAppeal> queryPunishAppeal(final PunishAppeal pa,final int pageSize,
			final int pageNumber) ;
	
	/**
	 * 查询惩罚诉求总记录
	 * @param kw
	 * @return int
	 */
	public int getPunishAppealTotal(PunishAppeal pa);
	
	/**
	 * 根据id查询惩罚诉求
	 * @param id
	 * @return
	 */
	public PunishAppeal getPunishAppealById(String id) ;

}
