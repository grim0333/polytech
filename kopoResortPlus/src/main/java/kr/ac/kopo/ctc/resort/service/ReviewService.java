package kr.ac.kopo.ctc.resort.service;

import java.util.List;

import org.springframework.data.domain.Page;
import org.springframework.data.domain.Pageable;

import kr.ac.kopo.ctc.resort.domain.ReviewItem;

public interface ReviewService {
	public void create(ReviewItem content) throws Exception;
	
	public ReviewItem read(Long num) throws Exception;
	
	public List<ReviewItem> list() throws Exception;
	
	public void update(ReviewItem up) throws Exception;
	
	public void delete(Long del) throws Exception;
	
	public void viewCnt(ReviewItem post) throws Exception;
	
	public Page<ReviewItem> pageList(Pageable page);
	
	public Page<ReviewItem> pageList(int page);

}
