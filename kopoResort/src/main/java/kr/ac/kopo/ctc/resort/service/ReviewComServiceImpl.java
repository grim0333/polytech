package kr.ac.kopo.ctc.resort.service;

import java.time.LocalDateTime;
import java.time.format.DateTimeFormatter;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import kr.ac.kopo.ctc.resort.dao.ReviewComDAO;
import kr.ac.kopo.ctc.resort.domain.ReviewComment;
import kr.ac.kopo.ctc.resort.repository.ReviewComRepository;

@Service
public class ReviewComServiceImpl implements ReviewComService {

	@Autowired
	ReviewComDAO dao;

	@Autowired
	ReviewComRepository reviewComRepo; 
	
	@Override
	public void comCreate(ReviewComment content) throws Exception {
		LocalDateTime now = LocalDateTime.now();
	    DateTimeFormatter formatter = DateTimeFormatter.ofPattern("yyyy-MM-dd");
	    String date = now.format(formatter);
	    content.setComDate(date);
	    content.setComViewCnt(0);
		dao.comCreate(content);		
	}

	@Override
	public ReviewComment comRead(Long num) throws Exception {
		return dao.comRead(num);
	}

	@Override
	public void comUpdate(ReviewComment up) throws Exception {
		LocalDateTime now = LocalDateTime.now();
	    DateTimeFormatter formatter = DateTimeFormatter.ofPattern("yyyy-MM-dd");
	    String date = now.format(formatter);
	    up.setComDate(date);
		dao.comUpdate(up);
	}

	@Override
	public void comDelete(Long del) throws Exception {
		dao.comDelete(del);
	}

	@Override
	public void comViewCnt(ReviewComment post) throws Exception {
		 post.setComViewCnt(post.getComViewCnt() + 1);
		 reviewComRepo.save(post);
	}
}
