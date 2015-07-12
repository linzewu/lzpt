package com.kteam.lzpt.manager;

import java.util.List;

import com.kteam.lzpt.entity.WindowInfo;

public interface IWindowInfoManager {
	
	public void addWindowInfo(WindowInfo wi);
	
	public void modifyWindowInfo(WindowInfo wi);
	
	public WindowInfo getWindowInfoById(String id);
	
	public List<WindowInfo> getWindowInfos();

}
