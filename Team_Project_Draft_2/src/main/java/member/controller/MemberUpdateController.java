package member.controller;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.validation.Valid;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import member.model.MemberBean;
import member.model.MemberDao;

@Controller
public class MemberUpdateController {
		
	private final String commandlist = "/memberListupdate.mem";
	private final String command = "/memberupdate.mem";
	private String getPage="/memberListUpdate";
	private String gettoPage="/memberUpdateForm";
	private String gotoPage = "redirect:/memberListupdate.mem";
	
	@Autowired
	private MemberDao memberDao;
	
	@RequestMapping(value=commandlist, method=RequestMethod.GET)
	public String updatemember(
			@RequestParam(value="num",required=false) int num,
			HttpServletRequest request) {
		MemberBean mbean = memberDao.selectMemberup(num);
		request.setAttribute("mbean", mbean);
		
		return getPage;
	}
	
	@RequestMapping(value=command, method=RequestMethod.GET)
	public String updatelist(
			@RequestParam(value="num",required=false) String num,
			HttpServletRequest request) {
		
		MemberBean mbean = memberDao.selectMember(num);
		request.setAttribute("mbean", mbean);
		
		return gettoPage;
		
	}
	
	@RequestMapping(value=command, method=RequestMethod.POST)
	public final ModelAndView updatefin(
			@ModelAttribute("mbean") @Valid MemberBean mbean,
			BindingResult  result,
			HttpServletResponse response) {
		
		mbean.setAddr(mbean.getAddr_num()+"|"+mbean.getAddr_first()+"|"+mbean.getAddr_last());

		ModelAndView mav = new ModelAndView();
		memberDao.updateMember(mbean);
		mav.setViewName(gotoPage+"?num="+mbean.getNum());
		
		return mav;
		
	}
	
	

}
