package kr.ac.kopo.ctc.resort.web;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;

import kr.ac.kopo.ctc.resort.repository.ReserveRepository;
import kr.ac.kopo.ctc.resort.service.DataGenerateService;
import kr.ac.kopo.ctc.resort.service.ReserveService;

@Controller
public class ReserveController {
	@Autowired
    private DataGenerateService dataGenrServ;
	
	@Autowired
	ReserveRepository repo;
	
	@Autowired
	ReserveService serv;
	

	@GetMapping(value="resvList")
    public String list(Model model) throws Exception {
		List<Object[]> pages = serv.listObj();
		model.addAttribute("list", pages);
        return "reserve/resvList";
    }
	
    @GetMapping(value="generateData")
    public String generateData() {
    	dataGenrServ.generateDataFor30Days();
        return "redirect:resvList";
    }
    
    
}
