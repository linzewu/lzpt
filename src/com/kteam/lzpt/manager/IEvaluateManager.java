package com.kteam.lzpt.manager;

import java.util.List;

import com.kteam.lzpt.entity.Evaluate;

public interface IEvaluateManager {
	
	public void addEvaluates(List<Evaluate> es);
	
	public void deleteEvaluate(List<Evaluate> es);
	
	public List<Evaluate> getEvaluates(String year,String unit);
	
	public List<Evaluate> getEvaluatesByYear(String year);

}
