package kr.ac.kopo.ctc.resort.repository;

import org.springframework.data.domain.Page;
import org.springframework.data.domain.Pageable;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;

import kr.ac.kopo.ctc.resort.domain.ResortDomain;

@Repository
public interface ResortRepository extends JpaRepository<ResortDomain, Long> {
	Page<ResortDomain> findAll(Pageable pageable);
	
	Page<ResortDomain> findById(Long id, Pageable pageable);
	
	Page<ResortDomain> findByTitleContaining(String title, Pageable pageable);
	
	Page<ResortDomain> findByContentContaining(String content, Pageable pageable);

}
