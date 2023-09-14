package kr.ac.kopo.ctc.resort.domain;

import jakarta.persistence.Column;
import jakarta.persistence.Entity;
import jakarta.persistence.GeneratedValue;
import jakarta.persistence.GenerationType;
import jakarta.persistence.Id;
import jakarta.persistence.ManyToOne;
import jakarta.persistence.JoinColumn;

@Entity
public class ReviewComment {
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    @Column
    private Long comId;

    @Column 
    private String comTitle;

	@Column
    private String comContent;

    @Column
    private String comDate;

    @Column
    private int comViewCnt;
    
    @ManyToOne
    @JoinColumn(name = "review_item_id", referencedColumnName = "id") // 조인 컬럼명 지정 (원본 게시글의 id를 외래키로 사용)
    private ReviewItem reviewItem; // 댓글이 어떤 원본 게시글에 연결되는지를 나타내기 위한 연관관계 설정

	public Long getComId() {
		return comId;
	}

	public void setComId(Long comId) {
		this.comId = comId;
	}

	public String getComTitle() {
		return comTitle;
	}

	public void setComTitle(String comTitle) {
		this.comTitle = comTitle;
	}
	
	public String getComContent() {
		return comContent;
	}

	public void setComContent(String comContent) {
		this.comContent = comContent;
	}

	public String getComDate() {
		return comDate;
	}

	public void setComDate(String comDate) {
		this.comDate = comDate;
	}

	public int getComViewCnt() {
		return comViewCnt;
	}

	public void setComViewCnt(int comViewCnt) {
		this.comViewCnt = comViewCnt;
	}

	public ReviewItem getReviewItem() {
		return reviewItem;
	}

	public void setReviewItem(ReviewItem reviewItem) {
		this.reviewItem = reviewItem;
	}

    
}