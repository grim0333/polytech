package kr.ac.kopo.ctc.resort.web;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import kr.ac.kopo.ctc.resort.service.ReserveService;

@Controller
public class AdminController {
	@Autowired
	ReserveService serv;
	
	
	@RequestMapping(value="admLogin")
    public String admLogin(Model model) {
        return "admin/adm_logIn";
    }
	
	@RequestMapping(value="admLogChk")
    public String admLogChk(Model model) {
        return "admin/adm_logChk";
    }
	
	@RequestMapping(value="admLogOut")
    public String admLogOut(Model model) {
        return "admin/adm_logOut";
    }
	
	
	@RequestMapping(value="admView")
    public String admView(Model model) throws Exception {
		List<Object[]> pages = serv.listObj();
		model.addAttribute("list", pages);
        return "admin/adm_allView";
    }
	
}
