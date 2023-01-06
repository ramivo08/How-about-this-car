package member.controller;

import javax.servlet.http.HttpServletResponse;
import javax.validation.Valid;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;

import member.model.MemberBean;
import member.model.MemberDao;

@Controller
public class MemberRegisterController {

	private final String command = "/register.mem";
	private final String getPage = "/registerForm";
	private String gotoPage = "redirect:/login.mem";
	
	@Autowired
	private MemberDao memberDao;
	
	@RequestMapping(value = command, method=RequestMethod.GET)
	public String register() {
		return getPage;
	}
	
	@RequestMapping(value = command, method=RequestMethod.POST)
	public ModelAndView registermem(
			@ModelAttribute("member") @Valid MemberBean member,
			BindingResult  result) {
		
		member.setAddr(member.getAddr_num()+"|"+member.getAddr_first()+"|"+member.getAddr_last());
		
		ModelAndView mav = new ModelAndView();
		
		int cnt = memberDao.registerMember(member);
		mav.setViewName(gotoPage);
		
		return mav;
	}
	
}
