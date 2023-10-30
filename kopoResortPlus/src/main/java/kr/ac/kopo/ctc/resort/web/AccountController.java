package kr.ac.kopo.ctc.resort.web;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import kr.ac.kopo.ctc.resort.domain.AccountDomain;
import kr.ac.kopo.ctc.resort.repository.AccountRepository;
import kr.ac.kopo.ctc.resort.service.AccountService;

@Controller
public class AccountController {
	@Autowired
	AccountService accServ;
	@Autowired
	AccountRepository accRepo;
	
	@RequestMapping(value="login")
    public String admLogin(Model model) {
		boolean check = accServ.adminCheck();
		model.addAttribute("check", check);
        return "account/acc_logIn";
    }
	
	@RequestMapping(value="accLogChk")
    public String admLogChk(Model model, @RequestParam("id") String id, @RequestParam("passwd") String passwd ) {
		AccountDomain acc = accServ.accCheck(id, passwd);
		long auth = acc.getAdminAuth();
		boolean check = false;
		if(acc != null) {
			check = true;
			model.addAttribute("id", id);
			model.addAttribute("auth", auth);
		}
		model.addAttribute("check", check);
        return "account/acc_logChk";
    }
	
	@RequestMapping(value="accCreate")
    public String accCreate(Model model) {
        return "account/acc_create";
    }
	
	@RequestMapping(value="accPost")
	public String accPost(@RequestParam("id") String id,
	                      @RequestParam("passwd") String passwd,
	                      @RequestParam("name") String name,
	                      @RequestParam("addr") String addr,
	                      @RequestParam("telnum") String telnum,
	                      @RequestParam("email") String email) {
	    AccountDomain acc = new AccountDomain();
	    acc.setId(id);
	    acc.setPasswd(passwd);
	    acc.setName(name);
	    acc.setAddr(addr);
	    acc.setTelnum(telnum);
	    acc.setEmail(email);
	    acc.setAdminAuth(0);
	    accRepo.save(acc);
	    return "redirect:accLogin";
	}
	
	@RequestMapping(value="accInfo")
    public String accInfo(Model model) {
        return "account/acc_info";
    }
	
	@RequestMapping(value="logOut")
    public String accLogOut(Model model) {
        return "account/acc_logOut";
    }
}