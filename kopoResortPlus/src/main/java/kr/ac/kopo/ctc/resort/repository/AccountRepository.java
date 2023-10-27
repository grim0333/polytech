package kr.ac.kopo.ctc.resort.repository;

import java.util.List;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;

import kr.ac.kopo.ctc.resort.domain.AccountDomain;

@Repository
public interface AccountRepository extends JpaRepository<AccountDomain, Long> {
	
	List<AccountDomain> findAll();
	
	AccountDomain findByIdAndPasswd(String id, String passwd);
	
	void deleteByIdx(Long idx);

	boolean existsByAdminAuth(int adminAuth);
	
	
}
