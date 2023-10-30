package kr.ac.kopo.ctc.resort.web;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.PageRequest;
import org.springframework.data.domain.Pageable;
import org.springframework.data.domain.Sort;
import org.springframework.data.domain.Sort.Direction;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

import kr.ac.kopo.ctc.resort.domain.ResortDomain;
import kr.ac.kopo.ctc.resort.repository.ResortRepository;
import kr.ac.kopo.ctc.resort.repository.ReviewComRepository;
import kr.ac.kopo.ctc.resort.repository.ReviewRepository;
import kr.ac.kopo.ctc.resort.service.ResortService;
import kr.ac.kopo.ctc.resort.service.ReviewComService;
import kr.ac.kopo.ctc.resort.service.ReviewService;

@Controller
public class ResortController {
	@Autowired
	ResortRepository repo;
	
	@Autowired
	ResortService serv;
	
	@Autowired
	ReviewRepository reviewRepo;
	
	@Autowired
	ReviewService reviewServ;
	
	@Autowired
	ReviewComRepository reviewComRepo;
	
	@Autowired
	ReviewComService reviewComServ;
	
	@GetMapping(value = "main")
	public String main(Model model) {
		return "/main";
	}
	
	@GetMapping(value = "top")
	public String top(Model model) {
		return "/top";
	}
	
	@RequestMapping(value = "list")
	public String list(Model model, @RequestParam(required = false, defaultValue="0", value = "page") int page,
									@RequestParam(required = false, defaultValue = "") String field,
									@RequestParam(required = false, defaultValue = "") String word) throws Exception {
		Pageable pageR = PageRequest.of(page, 10, Sort.by(Direction.DESC,"id"));
		Page<ResortDomain> pages = serv.pageList(pageR);
		
		if(field.equals("title")){
			pages = repo.findByTitleContaining((String)word, pageR);
		}else if(field.equals("content")){
			pages = repo.findByContentContaining((String)word, pageR);
		}
		
		int pageNumber= pages.getPageable().getPageNumber();
		int totalPage = pages.getTotalPages();
		int pageBlock = 10; //블럭의 수 1, 2, 3, 4, 5	
		int startBlockPage = ((pageNumber)/pageBlock)*pageBlock+1; //현재 페이지가 7이라면 1*5+1=6
		int endBlockPage = startBlockPage+pageBlock-1; //6+5-1=10. 6,7,8,9,10해서 10.
		endBlockPage= totalPage<endBlockPage? totalPage:endBlockPage;
		long listCnt = repo.count();
		model.addAttribute("cnt", listCnt);
		model.addAttribute("list", pages);
		model.addAttribute("totalPage", totalPage);
		model.addAttribute("startBlockPage", startBlockPage);
		model.addAttribute("endBlockPage", endBlockPage);
		return "board/list";
	}
	
	@RequestMapping(value = "read")
	public String read(Model model, @RequestParam("key") Long num) throws Exception {
		ResortDomain read = serv.read(num);
		serv.viewCnt(read);
		model.addAttribute("read", read);
		return "board/read";
	}
	@RequestMapping(value = "create")
	public String create(ResortDomain content, Model model) throws Exception {
		return "board/create";
	}
	
	@RequestMapping(value = "post", method = RequestMethod.POST)
	public String createPost(ResortDomain content) throws Exception {
		serv.create(content);
		return "redirect:list";
	}
	
	@RequestMapping(value = "modify")
	public String updating(Model model, @RequestParam("key") Long num) throws Exception {
		ResortDomain read = serv.read(num);
		model.addAttribute("read", read);
		return "board/update";
	}
	
	@RequestMapping(value = "update", method = RequestMethod.POST)
	public String update(Model model, ResortDomain item) throws Exception {
		serv.update(item);
		return "redirect:list";
	}
	
	@RequestMapping(value = "delete")
	public String delete(Model model, @RequestParam(value="key") Long id) throws Exception {
		serv.delete(id);
		return "redirect:list";
	}
}

