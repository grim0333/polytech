package kr.ac.kopo.ctc.resort.domain;

import java.io.Serializable;
import java.util.Date;
import java.util.Objects;

public class ReserveItemId implements Serializable {

	/**
	 * 
	 */
	private static final long serialVersionUID = 1L;

	private Date resvDate;
	
    private int room;
    
    @Override
    public boolean equals(Object o) {
        if (this == o) return true;
        if (o == null || getClass() != o.getClass()) return false;
        ReserveItemId that = (ReserveItemId) o;
        return room == that.room && Objects.equals(resvDate, that.resvDate);
    }

    @Override
    public int hashCode() {
        return Objects.hash(resvDate, room);
    }
    
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
