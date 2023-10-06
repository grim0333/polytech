package kr.ac.kopo.ctc.resort.service;

import kr.ac.kopo.ctc.resort.domain.AccountDomain;

public interface AccountService {
	
	public AccountDomain accCheck(String id , String passwd);
	
	public boolean adminCheck();
	
	public void genAcc();
}
