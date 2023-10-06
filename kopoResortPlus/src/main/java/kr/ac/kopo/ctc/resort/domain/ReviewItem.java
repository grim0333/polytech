package kr.ac.kopo.ctc.resort.domain;

import java.util.List;

import jakarta.persistence.CascadeType;
import jakarta.persistence.Column;
import jakarta.persistence.Entity;
import jakarta.persistence.GeneratedValue;
import jakarta.persistence.GenerationType;
import jakarta.persistence.Id;
import jakarta.persistence.OneToMany;

@Entity
public class ReviewItem {
	@Id
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	@Column
	private Long id;
	@Column
	private String title;
	@Column
	private String content;
	@Column
	private String user;
	@Column
	private String date;
	@Column
	private Integer viewcnt;
	
	@OneToMany(mappedBy = "reviewItem", cascade = CascadeType.REMOVE) // 댓글과의 연관관계 설정, 'boardItem'은 Comment 엔티티의 boardItem 속성과 동일하게 매핑되어야 함
    private List<ReviewComment> comments;
	
	public Long getId() {
		return id;
	}
	public void setId(Long id) {
		this.id = id;
	}
	public String getTitle() {
		return title;
	}
	public void setTitle(String title) {
		this.title = title;
	}
	public String getContent() {
		return content;
	}
	public void setContent(String content) {
		this.content = content;
	}
	public String getUser() {
		return user;
	}
	public void setUser(String user) {
		this.user = user;
	}
	public String getDate() {
		return date;
	}
	public void setDate(String date) {
		this.date = date;
	}
	public Integer getViewcnt() {
		return viewcnt;
	}
	public void setViewcnt(Integer viewcnt) {
		this.viewcnt = viewcnt;
	}
	
	public List<ReviewComment> getComments() {
		return comments;
	}
	public void setComments(List<ReviewComment> comments) {
		this.comments = comments;
	}
}
