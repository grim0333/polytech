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

import kr.ac.kopo.ctc.resort.dao.ReviewDAO;
import kr.ac.kopo.ctc.resort.domain.ReviewItem;
import kr.ac.kopo.ctc.resort.repository.ReviewRepository;

@Service
public class ReviewServiceImpl implements ReviewService {

	@Autowired
	ReviewDAO dao;
	
	@Autowired
	ReviewRepository reviewRepo;
	
	@Override
	public void create(ReviewItem content) throws Exception {
		LocalDateTime now = LocalDateTime.now();
	    DateTimeFormatter formatter = DateTimeFormatter.ofPattern("yyyy-MM-dd");
	    String date = now.format(formatter);
	    content.setDate(date);
	    content.setViewcnt(0);
	    reviewRepo.save(content);
	}
	
	@Override
	public ReviewItem read(Long num) throws Exception {
		return reviewRepo.findById(num).get();
	}

	@Override
	public List<ReviewItem> list() throws Exception {
		return dao.list();
	}

	@Override
	public void update(ReviewItem up) throws Exception {
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
	public void viewCnt(ReviewItem post) throws Exception {
		 post.setViewcnt(post.getViewcnt() + 1);
         reviewRepo.save(post);
	}

	@Override
	public Page<ReviewItem> pageList(Pageable page) {
		return reviewRepo.findAll(page);
	}

	@Override
	public Page<ReviewItem> pageList(int page) {
		return reviewRepo.findAll(PageRequest.of(page, 10, Sort.by(Sort.Direction.DESC, "id")));
	}

	
}
