package kr.ac.kopo.ctc.resort.web;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.PageRequest;
import org.springframework.data.domain.Pageable;
import org.springframework.data.domain.Sort;
import org.springframework.data.domain.Sort.Direction;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

import kr.ac.kopo.ctc.resort.domain.ReviewComment;
import kr.ac.kopo.ctc.resort.domain.ReviewItem;
import kr.ac.kopo.ctc.resort.repository.ReviewComRepository;
import kr.ac.kopo.ctc.resort.repository.ReviewRepository;
import kr.ac.kopo.ctc.resort.service.ReviewComService;
import kr.ac.kopo.ctc.resort.service.ReviewService;

@Controller
public class ReviewController {
	@Autowired
	ReviewRepository reviewRepo;
	
	@Autowired
	ReviewService reviewServ;
	
	@Autowired
	ReviewComRepository reviewComRepo;
	
	@Autowired
	ReviewComService reviewComServ;
	
	@RequestMapping(value = "revList")
	public String revList(Model model, @RequestParam(required = false, defaultValue="0", value = "page") int page,
									@RequestParam(required = false, defaultValue = "") String field,
									@RequestParam(required = false, defaultValue = "") String word) throws Exception {
		Pageable pageR = PageRequest.of(page, 20, Sort.by(Direction.DESC,"id"));
		Page<ReviewItem> pages = reviewServ.pageList(pageR);
		
		if(field.equals("title")){
			pages = reviewRepo.findByTitleContaining((String)word, pageR);
		}else if(field.equals("content")){
			pages = reviewRepo.findByContentContaining((String)word, pageR);
		}
		
		int pageNumber= pages.getPageable().getPageNumber();
		int totalPage = pages.getTotalPages();
		int pageBlock = 20; //블럭의 수 1, 2, 3, 4, 5	
		int startBlockPage = ((pageNumber)/pageBlock)*pageBlock+1; //현재 페이지가 7이라면 1*5+1=6
		int endBlockPage = startBlockPage+pageBlock-1; //6+5-1=10. 6,7,8,9,10해서 10.
		endBlockPage= totalPage<endBlockPage? totalPage:endBlockPage;
		long listCnt = reviewRepo.count();
		model.addAttribute("cnt", listCnt);
		model.addAttribute("list", pages);
		model.addAttribute("totalPage", totalPage);
		model.addAttribute("startBlockPage", startBlockPage);
		model.addAttribute("endBlockPage", endBlockPage);
		return "review/list";
	}
	
	@RequestMapping(value = "revRead")
	public String revRead(Model model, @RequestParam("key") Long num) throws Exception {
		ReviewItem read = reviewServ.read(num);
		reviewServ.viewCnt(read);
		model.addAttribute("read", read);
		return "review/read";
	}
	@RequestMapping(value = "revCreate")
	public String revCreate(ReviewItem content, Model model) throws Exception {
		return "review/create";
	}
	
	@RequestMapping(value = "revPost", method = RequestMethod.POST)
	public String createPost(ReviewItem content) throws Exception {
		reviewServ.create(content);
		return "redirect:revList";
	}
	
	@RequestMapping(value = "revModify")
	public String revUpdating(Model model, @RequestParam("key") Long num) throws Exception {
		ReviewItem read = reviewServ.read(num);
		model.addAttribute("read", read);
		return "review/update";
	}
	
	@RequestMapping(value = "revUpdate", method = RequestMethod.POST)
	public String revUpdate(Model model, ReviewItem item) throws Exception {
		reviewServ.update(item);
		return "redirect:revList";
	}
	
	@RequestMapping(value = "revDelete")
	public String revDelete(Model model, @RequestParam(value="key") Long id) throws Exception {
		reviewServ.delete(id);
		return "redirect:revList";
	}
	
	
	
	@RequestMapping(value = "/commRead")
	public String comRead(Model model, @RequestParam("key") Long num) throws Exception {
		ReviewComment comRead = reviewComServ.comRead(num);
		reviewComServ.comViewCnt(comRead);
		model.addAttribute("comment", comRead);
		return "review/comm/comRead";
	}
	@RequestMapping(value = "/commCreate")
	public String comCreate(ReviewComment content, Model model) throws Exception {
		return "review/comm/comCreate";
	}
	
	@RequestMapping(value = "/commPost", method = RequestMethod.POST)
	public String comCreatePost(ReviewComment content, @RequestParam("key") Long num) throws Exception {
		content.setReviewItem(reviewServ.read(num));
		reviewComServ.comCreate(content);
		return "redirect:revList";
	}
	
	@RequestMapping(value = "/commModify")
	public String comUpdating(Model model, @RequestParam("key") Long num) throws Exception {
		ReviewComment comRead = reviewComServ.comRead(num);
		model.addAttribute("comment", comRead);
		return "review/comm/comUpdate";
	}
	
	@RequestMapping(value = "/commUpdate", method = RequestMethod.POST)
	public String comUpdate(Model model, ReviewComment item) throws Exception {
		reviewComServ.comUpdate(item);
		return "redirect:revList";
	}
	
	@RequestMapping(value = "/commDelete")
	public String comDelete(Model model, @RequestParam(value="key") Long id) throws Exception {
		reviewComServ.comDelete(id);
		return "redirect:revList";
	}
	
	@RequestMapping(value = "/resvList")
	public String showList() {
		return "reserve/resvList";
	}
	
	@RequestMapping(value = "/resvOne")
	public String showOne() {
		return "reserve/resvOne";
	}
}

