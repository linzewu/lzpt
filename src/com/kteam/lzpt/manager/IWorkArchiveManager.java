package com.kteam.lzpt.manager;

import java.util.List;
import java.util.Map;

import com.kteam.lzpt.entity.WorkArchive;

public interface IWorkArchiveManager {
	
	public void addWorkArchive(WorkArchive wa);
	
	public List<WorkArchive> queryWorkArchive(final WorkArchive wa,final int pageSize,final int pageNumber);
	
	public int getWorkArchivesTotal(WorkArchive wa);
	
	public void deleteWorkArchives(String id); 
	
	public WorkArchive getWorkArchiveById(String id); 
	
	public void updateWorkArchive(WorkArchive wa);
	
	public Map<String,Object> getWimAndWs(String id);
	
	public List<WorkArchive> getWorkArchives();
	
	public List<WorkArchive> getSimpleUnits();
}
