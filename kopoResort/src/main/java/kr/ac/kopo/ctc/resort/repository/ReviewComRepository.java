package kr.ac.kopo.ctc.resort.repository;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.JpaSpecificationExecutor;
import org.springframework.stereotype.Repository;

import kr.ac.kopo.ctc.resort.domain.ReviewComment;

@Repository
public interface ReviewComRepository extends JpaRepository<ReviewComment, Long>, JpaSpecificationExecutor<ReviewComment>{
//	@Query("insert into review_comment (com_title, com_content, com_date, com_view_cnt, review_item_id)"
//			+ "	values (content.comTitle, content.comContent, date_format(now(), '%Y-%m-%d'), 0, num)")
//	void save(@Param("content") ReviewComment content, @Param("num") Long num);
}
