package kr.ac.kopo.ctc.resort.dao;

import java.util.Date;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import kr.ac.kopo.ctc.resort.domain.ReserveItem;
import kr.ac.kopo.ctc.resort.repository.ReserveRepository;

@Repository
public class ReserveDAOImpl implements ReserveDAO {

	@Autowired
	private ReserveRepository resvRepo;
	
	@Override
	public ReserveItem read(Date date, int room) throws Exception {
		return resvRepo.findByResvDateAndRoom(date, room);
	}

	@Override
	public List<ReserveItem> list() throws Exception {
		return resvRepo.findAll();
	}

	@Override
	public List<Object[]> listObj() throws Exception {
		return resvRepo.findAllWithPivot();
	}

	@Override
	public void update(ReserveItem up) throws Exception {
		resvRepo.save(up);
	}
}
