package kr.ac.kopo.ctc.resort.dao;

import java.util.List;

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
		AccountDomain ad = accRepo.findByIdAndPasswd(id, passwd);
		return ad;
	}

	@Override
	public List<AccountDomain> AccList() {
		return accRepo.findAll();
	}

	@Override
	public void saveAcc(AccountDomain acc) {
		accRepo.save(acc);
	}

	@Override
	public void delAcc(Long idx) {
		accRepo.deleteByIdx(idx);
	}
	
}
