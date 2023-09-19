package kr.ac.kopo.ctc.resort.web;

import java.util.Date;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.format.annotation.DateTimeFormat;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

import kr.ac.kopo.ctc.resort.domain.AccountDomain;
import kr.ac.kopo.ctc.resort.domain.ReserveItem;
import kr.ac.kopo.ctc.resort.service.AccountService;
import kr.ac.kopo.ctc.resort.service.ReserveService;

@Controller
public class AccountController {
	@Autowired
	ReserveService serv;
	@Autowired
	AccountService accServ;
	
	@RequestMapping(value="admLogin")
    public String admLogin(Model model) {
		boolean check = accServ.adminCheck();
		model.addAttribute("check", check);
        return "admin/adm_logIn";
    }
	
	@RequestMapping(value="admLogChk")
    public String admLogChk(Model model, @RequestParam("id") String id, @RequestParam("passwd") String passwd ) {
		AccountDomain acc = accServ.accCheck(id, passwd);
		boolean check = false;
		if(acc != null) {
			check = true;
			model.addAttribute("id", id);
		}else {
			check = false;
		}
		model.addAttribute("check", check);
        return "admin/adm_logChk";
    }
	
	@RequestMapping(value="admLogOut")
    public String admLogOut(Model model) {
        return "admin/adm_logOut";
    }
	
	@RequestMapping(value="genAdmin")
    public String genAdmin(Model model) {
		accServ.genAcc();
        return "redirect:admLogin";
    }
	
	@RequestMapping(value="admView")
    public String admView(Model model) throws Exception {
		List<Object[]> pages = serv.listObj();
		model.addAttribute("list", pages);
        return "admin/adm_allView";
    }
	
	@RequestMapping(value="admOneView")
    public String admOneView(Model model, @RequestParam("date") 
    										@DateTimeFormat(pattern = "yyyy-MM-dd") Date date, 
    										@RequestParam("room") int room ) throws Exception {
		ReserveItem item = serv.read(date, room);
		model.addAttribute("view", item);
        return "admin/adm_oneView";
    }
	
	@RequestMapping(value="admOneChk")
    public String admOneChk(Model model) {
        return "admin/adm_update";
    }
	
	@RequestMapping(value = "admUpdate", method = RequestMethod.POST)
    public String admUp(Model model, @RequestParam("resvDate") @DateTimeFormat(pattern = "yyyy-MM-dd") Date resvDate,
                         @RequestParam("writeDate") @DateTimeFormat(pattern = "yyyy-MM-dd") Date writeDate,
                         @RequestParam("room") int room,
                         @RequestParam("name") String name,
                         @RequestParam("addr") String addr,
                         @RequestParam("telnum") String telnum,
                         @RequestParam("inName") String inName,
                         @RequestParam("comment") String comment,
                         @RequestParam("processing") int processing) throws Exception {
        ReserveItem up = new ReserveItem();
        up.setName(name);
        up.setResvDate(resvDate);
        up.setRoom(room);
        up.setAddr(addr);
        up.setTelnum(telnum);
        up.setInName(inName);
        up.setComment(comment);
        up.setWriteDate(writeDate);
        up.setProcessing(processing);
        
        serv.update(up);
        return "redirect:admView";
    }
	
	@RequestMapping(value="admDelete")
    public String admDelete(Model model, @RequestParam("resvDate") @DateTimeFormat(pattern = "yyyy-MM-dd") Date resvDate,
    									@RequestParam("room") int room) throws Exception {
		serv.delete(resvDate, room);
		return "redirect:admView";
	}
        
}
