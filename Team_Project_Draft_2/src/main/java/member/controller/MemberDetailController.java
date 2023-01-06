package member.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import member.model.MemberBean;
import member.model.MemberDao;


@Controller
public class MemberDetailController {
	private final String command = "detail.mem";
	private String getPage = "/memberDetail";
	
	@Autowired
	private MemberDao memberDao; 

	
	@RequestMapping(command)
	public String detail(@RequestParam(value="num",required = true) String num,
			@RequestParam(value="pageNumber",required = false) String pageNumber,
			Model model) {
		
		MemberBean member = memberDao.getMemberByNum(num); 
		model.addAttribute("mem", member);
		model.addAttribute("pageNumber", pageNumber);

		return getPage;
		
	}

}
