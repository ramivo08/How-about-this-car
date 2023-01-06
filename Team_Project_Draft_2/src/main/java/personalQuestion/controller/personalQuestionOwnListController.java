package personalQuestion.controller;

import java.util.ArrayList;
import java.util.List;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import member.model.MemberBean;
import personalQuestion.model.PersonalQuestionBean;
import personalQuestion.model.PersonalQuestionDao;

@Controller
public class personalQuestionOwnListController {

	private final String command = "myList.pq";
	private final String getPage = "/myOwnPQLists";
	
	@Autowired
	PersonalQuestionDao pqdao;
	
	@RequestMapping(command)
	public ModelAndView myOwnPQLists(HttpSession session) {
		ModelAndView mav = new ModelAndView();
		
		MemberBean mb = (MemberBean)session.getAttribute("loginInfo");
		 String buyer_id = mb.getId();
		
	
		List<PersonalQuestionBean> lists = new ArrayList<PersonalQuestionBean>();
		lists = pqdao.selectMyList(buyer_id);
		mav.addObject("lists", lists);
		mav.setViewName(getPage);
		return mav;
	}
	
}
