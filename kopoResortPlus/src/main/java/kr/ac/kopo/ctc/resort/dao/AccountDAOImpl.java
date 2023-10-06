package kr.ac.kopo.ctc.resort.dao;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import kr.ac.kopo.ctc.resort.domain.AccountDomain;
import kr.ac.kopo.ctc.resort.repository.AccountRepository;

@Repository
public class AccountDAOImpl implements AccountDAO {
	@Autowired
	AccountRepository accRepo;
	
	@Override
	public AccountDomain AccCheck(String id, String passwd) {
		AccountDomain ad = accRepo.findByAdminIdAndPasswd(id, passwd);
		return ad;
	}
}
