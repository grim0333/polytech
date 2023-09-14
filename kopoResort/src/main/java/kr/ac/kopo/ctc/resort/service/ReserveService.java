package kr.ac.kopo.ctc.resort.service;

import java.util.Date;
import java.util.List;


import kr.ac.kopo.ctc.resort.domain.ReserveItem;

public interface ReserveService {
	public ReserveItem read(Date date , Long room) throws Exception;
	
	public List<ReserveItem> list() throws Exception;
	
	public List<Object[]> listObj() throws Exception;
	
	public void update(ReserveItem up) throws Exception;
	
	public void delete(Date date , Long room) throws Exception;
	
}
