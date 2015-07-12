package com.kteam.lzpt.manager;

import java.util.List;

import com.kteam.lzpt.entity.EncourageAppeal;



public interface IEncourageAppealManager {
	
	public void addEncourageAppeal(EncourageAppeal ea);
	
    public void modifyEncourageAppeal(EncourageAppeal ea);
	
	public void deleteEncourageAppeal(String id);
	
	/**
	 * 分页查询奖励诉求
	 * @param kw
	 * @param pageSize
	 * @param pageNumber
	 * @return List<KeyWordsConfig>
	 */
	public List<EncourageAppeal> queryEncourageAppeal(final EncourageAppeal ea,final int pageSize,
			final int pageNumber) ;
	
	/**
	 * 查询奖励诉求总记录
	 * @param kw
	 * @return int
	 */
	public int getEncourageAppealTotal(EncourageAppeal ea);
	
	/**
	 * 根据id查询奖励诉求
	 * @param id
	 * @return
	 */
	public EncourageAppeal getEncourageAppealById(String id) ;

}
