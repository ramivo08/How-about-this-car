package member.controller;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import member.model.MemberBean;
import member.model.MemberDao;
import personalQuestion.model.PersonalQuestionBean;
import personalQuestion.model.PersonalQuestionDao;
import requestAuthority.model.requestAuthorityDao;
import utility.Paging;

@Controller
public class MemberListController {
	private final String command="/list.mem";
	private String getPage="/memberList";
	
	@Autowired
	MemberDao memberDao;
	
	@Autowired(required = false)
	requestAuthorityDao radao;
	
	@RequestMapping(command)
	public ModelAndView list(
			@RequestParam(value="whatColumn",required = false) String whatColumn,
			@RequestParam(value="keyword",required = false) String keyword,
			@RequestParam(value="pageNumber",required = false) String pageNumber,
			HttpServletRequest request) {
		
		ModelAndView mav=new ModelAndView();
		
		Map<String, String> map=new HashMap<String, String>();
		map.put("whatColumn", whatColumn);
		map.put("keyword", "%"+keyword+"%");
		int totalCount = memberDao.getTotalCount(map);
		String url=request.getContextPath()+"/"+command;
		 
		Paging pageInfo = new Paging(pageNumber,null, totalCount, url, whatColumn, keyword, null);
		
		List<MemberBean> lists = new ArrayList<MemberBean>();
		lists = memberDao.getMemberList(pageInfo,map);
		
		int result = radao.getCount();
		
		System.out.println("어드민이 관리하는 회원 수 : " + lists.size());
		mav.addObject("result", result);
		mav.addObject("lists",lists);
		mav.addObject("pageInfo",pageInfo);
		mav.setViewName(getPage);
		mav.addObject("totalCount",totalCount);

		return mav;
		
	}

	
}
