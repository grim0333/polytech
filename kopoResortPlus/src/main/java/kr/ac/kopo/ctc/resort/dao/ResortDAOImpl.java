package kr.ac.kopo.ctc.resort.dao;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import kr.ac.kopo.ctc.resort.domain.ResortDomain;
import kr.ac.kopo.ctc.resort.repository.ResortRepository;

@Repository
public class ResortDAOImpl implements ResortDAO {
	@Autowired
	private ResortRepository resortRepo;
	
	
	@Override
	public void create(ResortDomain content) throws Exception {
		resortRepo.save(content);
		
	}

	@Override
	public ResortDomain read(Long num) throws Exception {
		return resortRepo.findById(num).get();
	}

	@Override
	public List<ResortDomain> list() throws Exception {
		return resortRepo.findAll();
	}

	@Override
	public void update(ResortDomain up) throws Exception {
		resortRepo.save(up);
	}

	@Override
	public void delete(Long del) throws Exception {
		resortRepo.deleteById(del);
	}

}
