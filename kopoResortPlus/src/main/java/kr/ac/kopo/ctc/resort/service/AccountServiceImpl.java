package kr.ac.kopo.ctc.resort.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import kr.ac.kopo.ctc.resort.dao.AccountDAO;
import kr.ac.kopo.ctc.resort.domain.AccountDomain;
import kr.ac.kopo.ctc.resort.repository.AccountRepository;

@Service
public class AccountServiceImpl implements AccountService {
	@Autowired
	AccountDAO dao;
	
	@Autowired
	AccountRepository accRepo;

	@Override
	public AccountDomain accCheck(String id , String passwd) {
		AccountDomain acc = dao.AccCheck(id, passwd);
		return acc;
	}

	@Override
	public boolean adminCheck() {
		boolean check = accRepo.existsAny();
		return check;
	}

	@Override
	public void genAcc() {
		AccountDomain acc = new AccountDomain();
		acc.setId("admin");
		acc.setName("관리자");
		acc.setPasswd("admin");
		acc.setAdminAuth(1);
		accRepo.save(acc);
	}
	
	
}
