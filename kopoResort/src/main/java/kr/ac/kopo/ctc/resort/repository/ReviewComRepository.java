package kr.ac.kopo.ctc.resort.repository;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.JpaSpecificationExecutor;
import org.springframework.stereotype.Repository;

import kr.ac.kopo.ctc.resort.domain.ReviewComment;

@Repository
public interface ReviewComRepository extends JpaRepository<ReviewComment, Long>, JpaSpecificationExecutor<ReviewComment>{
	
}
