package kr.ac.kopo.ctc.resort.dao;

import java.util.List;

import kr.ac.kopo.ctc.resort.domain.AccountDomain;

public interface AccountDAO {
	public AccountDomain AccCheck (String id , String passwd);
	
	public List<AccountDomain> AccList ();
	
	public void saveAcc(AccountDomain acc);
	
	public void delAcc(Long idx);
}
