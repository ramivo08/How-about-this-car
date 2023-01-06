package personalQuestion.controller;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import car.model.CarBean;
import member.model.MemberBean;
import personalQuestion.model.PersonalQuestionBean;
import personalQuestion.model.PersonalQuestionDao;
import utility.Paging;

@Controller
public class personalQuestionListController {

	private final String command = "list.pq";
	private final String getPage = "/oneToOnePQ";

	@Autowired
	PersonalQuestionDao pqdao;
	
	@RequestMapping(command)
	public ModelAndView listPQ(HttpSession session,@RequestParam(value="whatColumn",required = false) String whatColumn,
			@RequestParam(value="keyword",required = false) String keyword,@RequestParam(value="pageNumber",required = false) String pageNumber,
			HttpServletRequest request) {
		
		MemberBean mb = (MemberBean)session.getAttribute("loginInfo");
		 String seller_id = mb.getId();
		
		Map<String, String> map = new HashMap<String,String>();
		map.put("whatColumn", whatColumn); // map에 put이라는 메소드를 사용하여 whatColumn넣기
		map.put("keyword", "%" + keyword + "%"); // "%"로 묶는 이유는 sql에서 검색할 때, 입력한 내용이 포함되기 위해서 넣음
		map.put("seller_id", seller_id);
	
		
		int totalcount = pqdao.getTotalCount(map);
		String url = request.getContextPath() + "/" + command;
		Paging pageInfo = new Paging(pageNumber, null, totalcount, url, whatColumn, keyword, null);
		
		ModelAndView mav = new ModelAndView();
		List<PersonalQuestionBean> lists=new ArrayList<PersonalQuestionBean>();
		lists = pqdao.myPQList(map,pageInfo);

		mav.addObject("lists", lists);
		mav.addObject("pageInfo", pageInfo);
		mav.addObject("totalcount", totalcount);
		
		mav.setViewName(getPage);
		
		
		return mav;
	}
}
