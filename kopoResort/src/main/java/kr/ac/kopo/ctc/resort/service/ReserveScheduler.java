package kr.ac.kopo.ctc.resort.service;
import org.springframework.scheduling.annotation.Scheduled;
import org.springframework.stereotype.Component;

import kr.ac.kopo.ctc.resort.domain.ReserveItem;
import kr.ac.kopo.ctc.resort.repository.ReserveRepository;

import org.springframework.beans.factory.annotation.Autowired;

import java.util.Calendar;
import java.util.Date;
@Component
public class ReserveScheduler {

    @Autowired
    private ReserveRepository resvRepo;

    @Scheduled(cron = "0 0 * * * *") // 매일 자정에 실행
    public void processAndCleanupData() {
        Calendar calendar = Calendar.getInstance();
        Date currentDate = calendar.getTime();
        calendar.setTime(currentDate);

        // 다음 날로 넘어가면 어제의 데이터 삭제하고 마지막 날짜 이후로 데이터 추가
        Date yesterday = calculateYesterday(currentDate);
        resvRepo.deleteByResvDate(yesterday);

        // 마지막 날짜 구하기
        Date lastDate = resvRepo.findLastDate();
        Date nextDate = calculateNextDate(lastDate);
        while (nextDate != null) {
        	ReserveItem newData1 = new ReserveItem();
			newData1.setResvDate(nextDate);
			newData1.setRoom(1); // 키 값을 제외하고 비어있는 데이터 저장
			resvRepo.save(newData1);
			ReserveItem newData2 = new ReserveItem();
			newData2.setResvDate(nextDate);
			newData2.setRoom(2); // 키 값을 제외하고 비어있는 데이터 저장
			resvRepo.save(newData2);
			ReserveItem newData3 = new ReserveItem();
			newData3.setResvDate(nextDate);
			newData3.setRoom(3); // 키 값을 제외하고 비어있는 데이터 저장
			resvRepo.save(newData3);
        }
    }

    private Date calculateYesterday(Date currentDate) {
        Calendar calendar = Calendar.getInstance();
        calendar.setTime(currentDate);
        calendar.add(Calendar.DAY_OF_MONTH, -1);
        return calendar.getTime();
    }

    private Date calculateNextDate(Date lastDate) {
        Calendar calendar = Calendar.getInstance();
        calendar.setTime(lastDate);
        calendar.add(Calendar.DAY_OF_MONTH, 1);
        return calendar.getTime();
    }
}
