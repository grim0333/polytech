package kr.ac.kopo.ctc.resort.dao;

import java.util.List;

import kr.ac.kopo.ctc.resort.domain.ReviewItem;


public interface ReviewDAO {
	public void create(ReviewItem content) throws Exception;
	
	public ReviewItem read(Long num) throws Exception;
	
	public List<ReviewItem> list() throws Exception;
	
	public void update(ReviewItem up) throws Exception;
	
	public void delete(Long del) throws Exception;
}
