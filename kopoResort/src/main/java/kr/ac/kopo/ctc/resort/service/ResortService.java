package kr.ac.kopo.ctc.resort.service;

import java.util.List;

import org.springframework.data.domain.Page;
import org.springframework.data.domain.Pageable;

import kr.ac.kopo.ctc.resort.domain.ResortDomain;

public interface ResortService {
	public void create(ResortDomain content) throws Exception;
	
	public ResortDomain read(Long num) throws Exception;
	
	public List<ResortDomain> list() throws Exception;
	
	public void update(ResortDomain up) throws Exception;
	
	public void delete(Long del) throws Exception;
	
	public void viewCnt(ResortDomain post) throws Exception;
	
	public Page<ResortDomain> pageList(Pageable page);
	
	public Page<ResortDomain> pageList(int page);
}
