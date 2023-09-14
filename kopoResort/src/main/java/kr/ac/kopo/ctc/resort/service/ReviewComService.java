package kr.ac.kopo.ctc.resort.service;

import kr.ac.kopo.ctc.resort.domain.ReviewComment;

public interface ReviewComService {
	public void comCreate(ReviewComment content) throws Exception;
	
	public ReviewComment comRead(Long num) throws Exception;
	
	public void comUpdate(ReviewComment up) throws Exception;
	
	public void comDelete(Long del) throws Exception;
	
	public void comViewCnt(ReviewComment post) throws Exception;

}