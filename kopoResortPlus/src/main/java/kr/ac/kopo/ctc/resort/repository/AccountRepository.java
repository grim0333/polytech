package kr.ac.kopo.ctc.resort.repository;

import java.util.List;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;
import org.springframework.stereotype.Repository;

import kr.ac.kopo.ctc.resort.domain.AccountDomain;

@Repository
public interface AccountRepository extends JpaRepository<AccountDomain, Long> {
	
	List<AccountDomain> findAll();
	
	AccountDomain findByAdminIdAndPasswd(String adminId, String passwd);
	
	void deleteByIdx(Long idx);

	@Query("SELECT COUNT(a) > 0 WHERE adminAuth = 1 FROM AccountDomain a")
    boolean existsAny();
	
	
}
