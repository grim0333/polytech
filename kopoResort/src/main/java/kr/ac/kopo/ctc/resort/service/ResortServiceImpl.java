package kr.ac.kopo.ctc.resort.service;

import java.time.LocalDateTime;
import java.time.format.DateTimeFormatter;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.PageRequest;
import org.springframework.data.domain.Pageable;
import org.springframework.data.domain.Sort;
import org.springframework.stereotype.Service;

import kr.ac.kopo.ctc.resort.dao.ResortDAO;
import kr.ac.kopo.ctc.resort.domain.ResortDomain;
import kr.ac.kopo.ctc.resort.repository.ResortRepository;

@Service
public class ResortServiceImpl implements ResortService {

	@Autowired
	ResortDAO dao;
	
	@Autowired
	ResortRepository resortRepo;
	
	@Override
	public void create(ResortDomain content) throws Exception {
		LocalDateTime now = LocalDateTime.now();
	    DateTimeFormatter formatter = DateTimeFormatter.ofPattern("yyyy-MM-dd");
	    String date = now.format(formatter);
	    content.setDate(date);
	    content.setViewcnt(0);
	    resortRepo.save(content);
	}

	@Override
	public ResortDomain read(Long num) throws Exception {
		return resortRepo.findById(num).get();
	}

	@Override
	public List<ResortDomain> list() throws Exception {
		return dao.list();
	}

	@Override
	public void update(ResortDomain up) throws Exception {
		LocalDateTime now = LocalDateTime.now();
	    DateTimeFormatter formatter = DateTimeFormatter.ofPattern("yyyy-MM-dd");
	    String date = now.format(formatter);
	    up.setDate(date);
		dao.update(up);
	}

	@Override
	public void delete(Long del) throws Exception {
		dao.delete(del);
	}

	@Override
	public boolean viewCnt(Long num) throws Exception {
		// TODO Auto-generated method stub
		return false;
	}

	@Override
	public Page<ResortDomain> pageList(Pageable page) {
		return resortRepo.findAll(page);
	}

	@Override
	public Page<ResortDomain> pageList(int page) {
		return resortRepo.findAll(PageRequest.of(page, 10, Sort.by(Sort.Direction.DESC, "id")));
	}

}
