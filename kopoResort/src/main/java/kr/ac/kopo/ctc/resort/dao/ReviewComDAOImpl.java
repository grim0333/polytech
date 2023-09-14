package kr.ac.kopo.ctc.resort.dao;


import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import kr.ac.kopo.ctc.resort.domain.ReviewComment;
import kr.ac.kopo.ctc.resort.repository.ReviewComRepository;

@Repository
public class ReviewComDAOImpl implements ReviewComDAO {
	
	@Autowired
	private ReviewComRepository reviewComRepo;

	@Override
	public void comCreate(ReviewComment content) {
		reviewComRepo.save(content);
	}
	
	@Override
	public ReviewComment comRead(Long num) {
		return reviewComRepo.findById(num).get();
	}

	@Override
	public void comUpdate(ReviewComment item) {
		reviewComRepo.save(item);
	}

	@Override
	public void comDelete(Long num) {
		reviewComRepo.deleteById(num);
	}
}
