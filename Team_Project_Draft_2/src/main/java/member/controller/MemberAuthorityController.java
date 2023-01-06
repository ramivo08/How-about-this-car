package member.controller;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import member.model.MemberBean;
import member.model.MemberDao;
import requestAuthority.model.requestAuthorityDao;

@Controller 
public class MemberAuthorityController {
	public final String command="authority.mem";
	public String getPage="redirect:/list.mem";
	
	@Autowired
	private MemberDao memberDao;
	
	@Autowired(required = false)
	requestAuthorityDao radao;
	
	@RequestMapping(value=command, method=RequestMethod.POST)
	public String authority(@RequestParam("num") String num,
						 @RequestParam("pageNumber") String pageNumber,
						 Model model) {
		MemberBean member=memberDao.getMember(num);
		model.addAttribute("mem",member);
		model.addAttribute("pageNumber",pageNumber);
		return getPage;
	}

	@RequestMapping(value=command,method=RequestMethod.GET)
	public ModelAndView authority(@RequestParam(value="num",required = false) String num, 
			@RequestParam(value="pageNumber",required = false) String pageNumber, HttpSession session,
			@RequestParam(value="id",required = false) String id) {
		ModelAndView mav = new ModelAndView();
		memberDao.authorityMember(id);
		MemberBean mb = memberDao.getMember(id);
		
		radao.updateStatus(id);
		mav.setViewName(getPage+"?pageNumber="+pageNumber);

		return mav;	
	}

}


