package car.controller;

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
import car.model.CarDao;
import member.model.MemberBean;
import utility.Paging;

@Controller
public class MyCarListController {

	private final String command = "myCarList.ca";
	private final String getPage = "/myCarList";
	
	@Autowired
	CarDao cdao;
	
	@RequestMapping(command)
	public ModelAndView myCarList(HttpSession session,@RequestParam(value="whatColumn",required = false) String whatColumn,
			@RequestParam(value="keyword",required = false) String keyword,
			@RequestParam(value="pageNumber",required = false) String pageNumber,
			HttpServletRequest request) {
		
		MemberBean mb = (MemberBean)session.getAttribute("loginInfo");
		String cid = mb.getId();

		
		Map<String, String> map = new HashMap<String,String>();
		map.put("whatColumn", whatColumn); // map에 put이라는 메소드를 사용하여 whatColumn넣기
		map.put("keyword", "%" + keyword + "%"); // "%"로 묶는 이유는 sql에서 검색할 때, 입력한 내용이 포함되기 위해서 넣음
		map.put("cid", cid);

		System.out.println(cid);
		int totalcount = cdao.getTotalCount(map);
		String url = request.getContextPath() + "/" + command;
		Paging pageInfo = new Paging(pageNumber, null, totalcount, url, whatColumn, keyword, null);
		
		ModelAndView mav = new ModelAndView();
		List<CarBean> lists=new ArrayList<CarBean>();
		lists = cdao.myCarList(map,pageInfo);

		mav.addObject("lists", lists);
		mav.addObject("pageInfo", pageInfo);
		mav.addObject("totalcount", totalcount);
		
		mav.setViewName(getPage);
		
		
		return mav;
	}
	
}
