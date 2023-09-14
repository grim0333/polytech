package kr.ac.kopo.ctc.resort.service;

import java.util.Date;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import kr.ac.kopo.ctc.resort.dao.ReserveDAO;
import kr.ac.kopo.ctc.resort.domain.ReserveItem;
import kr.ac.kopo.ctc.resort.repository.ReserveRepository;

@Service
public class ReserveServiceImpl implements ReserveService {
	
	@Autowired
	ReserveDAO dao;
	
	@Autowired
	ReserveRepository resvRepo;

	@Override
	public ReserveItem read(Date date, Long room) throws Exception {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public List<ReserveItem> list() throws Exception {
		return dao.list();
	}

	@Override
	public List<Object[]> listObj() throws Exception {
		return dao.listObj();
	}

	@Override
	public void update(ReserveItem up) throws Exception {
		// TODO Auto-generated method stub
		
	}

	@Override
	public void delete(Date date, Long room) throws Exception {
		// TODO Auto-generated method stub
		
	}
}
