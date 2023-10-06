package kr.ac.kopo.ctc.resort.repository;

import org.springframework.data.domain.Page;
import org.springframework.data.domain.Pageable;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;

import kr.ac.kopo.ctc.resort.domain.ReviewItem;

@Repository
public interface ReviewRepository extends JpaRepository<ReviewItem, Long>{
	
	Page<ReviewItem> findAll(Pageable pageable);
	
	Page<ReviewItem> findById(Long id, Pageable pageable);
	
	Page<ReviewItem> findByTitleContaining(String title, Pageable pageable);
	
	Page<ReviewItem> findByContentContaining(String content, Pageable pageable);

}
