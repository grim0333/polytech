package kr.ac.kopo.ctc.resort.repository;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;
import org.springframework.stereotype.Repository;

import kr.ac.kopo.ctc.resort.domain.AccountDomain;

@Repository
public interface AccountRepository extends JpaRepository<AccountDomain, Long> {
	AccountDomain findByAdminIdAndPasswd(String adminId, String passwd);

	@Query("SELECT COUNT(a) > 0 FROM AccountDomain a")
    boolean existsAny();
	
}
