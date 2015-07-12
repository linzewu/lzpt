package com.kteam.lzpt.manager;

import java.util.List;

import com.kteam.lzpt.entity.CadreArchive;

public interface ICadreArchiveManager {
	
	public String addCadreArchive(CadreArchive ca);
	
	public void updateCadreArchive(CadreArchive ca);
	
	public void deleteCadreArchive(String id);
	
	public List<CadreArchive> queryCadreArchive(final CadreArchive ca,final int pageSize,final int pageNumber);
	
	public int getCadreArchiveTotal(CadreArchive ca);
	
	public CadreArchive getCadreArchiveById(String id);
	
	public List<CadreArchive> getCadreArchiveByWCID(String wcid);
	
	public String addLeaderExtend(Object o);
	
	public void updateLeaderExtend(Object o);
	
	public List<Object> getLeaderExtendInfo(String sql);
	
	public void deleteLeaderExtend(Object o);
	
	
	
	

}
