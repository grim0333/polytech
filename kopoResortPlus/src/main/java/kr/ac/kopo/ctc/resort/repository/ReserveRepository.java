package kr.ac.kopo.ctc.resort.repository;

import java.util.Date;
import java.util.List;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;
import org.springframework.stereotype.Repository;

import kr.ac.kopo.ctc.resort.domain.ReserveItem;

@Repository
public interface ReserveRepository extends JpaRepository<ReserveItem, Long> {
	
	List<ReserveItem> findAll();
	
	@Query("SELECT r.resvDate, " +
			"MAX(CASE WHEN r.room = 1 THEN r.name END) AS name_1, " +
			"MAX(CASE WHEN r.room = 2 THEN r.name END) AS name_2, " +
			"MAX(CASE WHEN r.room = 3 THEN r.name END) AS name_3, " +
			"MAX(CASE WHEN r.room = 1 THEN r.processing END) AS processing_1," +
			"MAX(CASE WHEN r.room = 2 THEN r.processing END) AS processing_2," +
			"MAX(CASE WHEN r.room = 3 THEN r.processing END) AS processing_3 " +
			"FROM ReserveItem r " +
			"GROUP BY r.resvDate " +
			"ORDER BY r.resvDate")
	List<Object[]> findAllWithPivot();
	
	ReserveItem findByResvDate(Date nextDate);
	
	void deleteByResvDateBefore(Date currentDate);
	
	@Query("SELECT MAX(d.resvDate) FROM ReserveItem d")
    Date findLastDate();
	
	void deleteByResvDateAfter(Date thirtyDaysLater);
	
	boolean existsByResvDateAfter(Date thirtyDaysLater);
	
	ReserveItem findByResvDateAndRoom(Date resvDate, int room);

	@Query("SELECT CASE WHEN COUNT(*) > 0 THEN true ELSE false END FROM ReserveItem")
	boolean existsAny();
}
