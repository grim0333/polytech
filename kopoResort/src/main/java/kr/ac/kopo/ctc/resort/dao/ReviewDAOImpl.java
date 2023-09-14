package kr.ac.kopo.ctc.resort.dao;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import kr.ac.kopo.ctc.resort.domain.ReviewItem;
import kr.ac.kopo.ctc.resort.repository.ReviewRepository;

@Repository
public class ReviewDAOImpl implements ReviewDAO {
	@Autowired
	private ReviewRepository reviewRepo;
		
	@Override
	public void create(ReviewItem content) throws Exception {
		reviewRepo.save(content);
	}

	@Override
	public ReviewItem read(Long num) throws Exception {
		return reviewRepo.findById(num).get();
	}

	@Override
	public List<ReviewItem> list() throws Exception {
		return reviewRepo.findAll();
	}

	@Override
	public void update(ReviewItem up) throws Exception {
		reviewRepo.save(up);
	}

	@Override
	public void delete(Long del) throws Exception {
		reviewRepo.deleteById(del);
	}

	
}
