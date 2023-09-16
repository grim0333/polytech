package kr.ac.kopo.ctc.resort.service;

import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.Calendar;
import java.util.Date;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import kr.ac.kopo.ctc.resort.domain.ReserveItem;
import kr.ac.kopo.ctc.resort.repository.ReserveRepository;

@Service
public class DataGenerateService {

    @Autowired
    private ReserveRepository resvRepo;
    
    public void generateDataFor30Days() throws ParseException {
        Calendar calendar = Calendar.getInstance();

        // 현재 날짜를 기준으로 30일 분량의 데이터 생성
        for (int i = 0; i < 30; i++) {
        	Date date = calendar.getTime();
        	SimpleDateFormat dateForm = new SimpleDateFormat("yyyy-MM-dd");
        	String dateStr = dateForm.format(date);
        	Date curDate = dateForm.parse(dateStr);
            ReserveItem newData1 = new ReserveItem();
			newData1.setResvDate(curDate);
			newData1.setRoom(1); // 키 값을 제외하고 비어있는 데이터 저장
			resvRepo.save(newData1);
			ReserveItem newData2 = new ReserveItem();
			newData2.setResvDate(curDate);
			newData2.setRoom(2); // 키 값을 제외하고 비어있는 데이터 저장
			resvRepo.save(newData2);
			ReserveItem newData3 = new ReserveItem();
			newData3.setResvDate(curDate);
			newData3.setRoom(3); // 키 값을 제외하고 비어있는 데이터 저장
			resvRepo.save(newData3);

            // 다음 날짜로 이동
            calendar.add(Calendar.DAY_OF_MONTH, 1);
        }
    }
}