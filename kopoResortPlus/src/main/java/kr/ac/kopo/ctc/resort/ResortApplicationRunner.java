package kr.ac.kopo.ctc.resort;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.boot.ApplicationArguments;
import org.springframework.boot.ApplicationRunner;
import org.springframework.stereotype.Component;

import kr.ac.kopo.ctc.resort.service.ReserveScheduler;

@Component
public class ResortApplicationRunner implements ApplicationRunner {
	@Autowired
	ReserveScheduler resvSch;
	
	@Override
	public void run(ApplicationArguments args) throws Exception {
		resvSch.processAndCleanupData();
	}

}
