package kr.ac.kopo.ctc.resort.domain;

import java.io.Serializable;
import java.util.Date;

public class ReserveItemId implements Serializable {

	private Date resvDate;
	
    private int room;
    
	public Date getResvDate() {
		return resvDate;
	}
	public void setResvDate(Date resvDate) {
		this.resvDate = resvDate;
	}
	public int getRoom() {
		return room;
	}
	public void setRoom(int room) {
		this.room = room;
	}
}
