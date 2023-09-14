package kr.ac.kopo.ctc.resort.dao;

import java.util.List;

import kr.ac.kopo.ctc.resort.domain.ResortDomain;

public interface ResortDAO {
	public void create(ResortDomain content) throws Exception;
	
	public ResortDomain read(Long num) throws Exception;
	
	public List<ResortDomain> list() throws Exception;
	
	public void update(ResortDomain up) throws Exception;
	
	public void delete(Long del) throws Exception;
}
