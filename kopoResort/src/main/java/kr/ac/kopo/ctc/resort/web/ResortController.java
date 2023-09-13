package kr.ac.kopo.ctc.resort.web;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
public class ResortController {
	@RequestMapping("/dyna1")
    public String showBoardPage() {
        return "board/e_01";
    }
	
	@RequestMapping("/dyna2")
    public String showReviewPage() {
        return "review/e_02";
    }
}
