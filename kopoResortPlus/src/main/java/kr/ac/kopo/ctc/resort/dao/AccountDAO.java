package kr.ac.kopo.ctc.resort.dao;

import kr.ac.kopo.ctc.resort.domain.AccountDomain;

public interface AccountDAO {
	public AccountDomain AccCheck (String id , String passwd);
	
}
