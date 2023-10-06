package kr.ac.kopo.ctc.resort.dao;

import kr.ac.kopo.ctc.resort.domain.ReviewComment;

public interface ReviewComDAO {
	
	public ReviewComment comRead(Long num);
	
	public void comUpdate(ReviewComment item);
	
	public void comCreate(ReviewComment content);
	
	public void comDelete(Long num);
}
