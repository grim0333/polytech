package kr.ac.kopo.ctc.resort;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.boot.ApplicationArguments;
import org.springframework.boot.ApplicationRunner;
import org.springframework.stereotype.Component;

import kr.ac.kopo.ctc.resort.repository.ReserveRepository;
import kr.ac.kopo.ctc.resort.service.AccountService;
import kr.ac.kopo.ctc.resort.service.DataGenerateService;
import kr.ac.kopo.ctc.resort.service.ReserveScheduler;

@Component
public class ResortApplicationRunner implements ApplicationRunner {
	@Autowired
	ReserveScheduler resvSch;
	
	@Autowired
	DataGenerateService dateGen;
	
	@Autowired
	ReserveRepository resRepo;
	
	@Autowired
	AccountService accServ;
	
	@Override
	public void run(ApplicationArguments args) throws Exception {
		if(resRepo.existsAny() == false) {
			dateGen.genDataThirty();
		}else {
			resvSch.processAndCleanupData();
		}
		boolean check = accServ.adminCheck();
		if(check == false) {
			accServ.genAcc();
		}
	}

}
