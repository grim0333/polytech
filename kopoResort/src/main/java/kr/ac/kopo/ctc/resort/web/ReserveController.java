package kr.ac.kopo.ctc.resort.web;

import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.List;
import java.util.Locale;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.format.annotation.DateTimeFormat;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

import jakarta.persistence.Column;
import jakarta.persistence.Id;
import kr.ac.kopo.ctc.resort.domain.ReserveItem;
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
    public String generateData() throws ParseException {
    	dataGenrServ.generateDataFor30Days();
        return "redirect:resvList";
    }
    
    @RequestMapping(value="resvWrite")
    public String resvWrt(Model model) {
        return "reserve/resvWrite";
    }
    
    @RequestMapping(value = "resvUpdate", method = RequestMethod.POST)
    public String resvUp(Model model, @RequestParam("resvDate") @DateTimeFormat(pattern = "yyyy-MM-dd") Date resvDate,
                         @RequestParam("writeDate") @DateTimeFormat(pattern = "yyyy-MM-dd") Date writeDate,
                         @RequestParam("room") int room,
                         @RequestParam("name") String name,
                         @RequestParam("addr") String addr,
                         @RequestParam("telnum") String telnum,
                         @RequestParam("inName") String inName,
                         @RequestParam("comment") String comment) throws Exception {
        ReserveItem up = new ReserveItem();
        up.setName(name);
        up.setResvDate(resvDate);
        up.setRoom(room);
        up.setAddr(addr);
        up.setTelnum(telnum);
        up.setInName(inName);
        up.setComment(comment);
        up.setWriteDate(writeDate);
        up.setProcessing(1);
        
        serv.update(up);
        return "redirect:resvList";
    }
    
    @GetMapping(value = "error")
    public String errorPage() {
    	return "/errorPage";
    }
}
