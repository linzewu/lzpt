package com.kteam.lzpt.manager;

import java.util.List;

import com.kteam.lzpt.entity.KeyWordsConfig;

public interface IKeyWordsConfigManager {
	
	/**
	 * 添加关键字
	 * @param kw
	 */
	public void addKeyWord(KeyWordsConfig kw);
	
	/**
	 * 修改关键字
	 * @param kw
	 */
	public void updateKeyWord(KeyWordsConfig kw);
	
	/**
	 * 删除关键字
	 * @param id
	 */
	public void deleteKeyWord(String id);
	
	/**
	 * 分页查询关键字
	 * @param kw
	 * @param pageSize
	 * @param pageNumber
	 * @return List<KeyWordsConfig>
	 */
	public List<KeyWordsConfig> queryKeyWordsConfig(final KeyWordsConfig kw,final int pageSize,
			final int pageNumber) ;
	
	/**
	 * 查询关键字总记录
	 * @param kw
	 * @return int
	 */
	public int getKeyWordsConfigTotal(KeyWordsConfig kw);
	
	/**
	 * 根据id查询关键字
	 * @param id
	 * @return
	 */
	public KeyWordsConfig getKeyWordById(String id) ;

}
