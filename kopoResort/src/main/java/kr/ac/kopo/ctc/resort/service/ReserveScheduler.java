package kr.ac.kopo.ctc.resort.service;

import org.springframework.stereotype.Service;

import jakarta.transaction.Transactional;
import kr.ac.kopo.ctc.resort.domain.ReserveItem;
import kr.ac.kopo.ctc.resort.repository.ReserveRepository;

import org.springframework.beans.factory.annotation.Autowired;

import java.text.ParseException;
import java.util.Calendar;
import java.util.Date;

@Service
public class ReserveScheduler {

    @Autowired
    private ReserveRepository resvRepo;
    
    @Transactional
    public void processAndCleanupData() throws ParseException {
    	Calendar calendar = Calendar.getInstance();
        Date currentDate = calendar.getTime();
        calendar.setTime(currentDate);
        calendar.add(Calendar.DAY_OF_MONTH, -1);
        Date BefTime = calendar.getTime();
        resvRepo.deleteByResvDateBefore(BefTime);
        // 마지막 날짜 구하기
        Date lastDate = resvRepo.findLastDate();
        
        calendar.setTime(currentDate);
        calendar.add(Calendar.DAY_OF_MONTH, 28);
        Date thirtyDaysLater = calendar.getTime();
        // 마지막 날짜의 다음 날 데이터를 추가
        if (!resvRepo.existsByResvDateAfter(thirtyDaysLater)) {
            calendar.setTime(lastDate);
            calendar.add(Calendar.DAY_OF_MONTH, 1);
            Date nextDate = calendar.getTime();

            ReserveItem newData1 = new ReserveItem();
            newData1.setResvDate(nextDate);
            newData1.setRoom(1);
            resvRepo.save(newData1);

            ReserveItem newData2 = new ReserveItem();
            newData2.setResvDate(nextDate);
            newData2.setRoom(2);
            resvRepo.save(newData2);

            ReserveItem newData3 = new ReserveItem();
            newData3.setResvDate(nextDate);
            newData3.setRoom(3);
            resvRepo.save(newData3);
        }
    }
}
