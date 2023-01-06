package review.controller;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;
import javax.validation.Valid;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import member.model.MemberBean;
import review.model.ReviewboardBean;
import review.model.ReviewboardDao;
import utility.Paging;

@Controller
public class ReviewboardListController {
	
	private final String command = "/list.reb";
	private String getPage = "/reviewboardList";
	
	@Autowired
	private ReviewboardDao reviewboardDao;
	
	@RequestMapping(command)
	public String rblist(
			@RequestParam(value="name", required=false) String rname,
			@RequestParam(value="pageNumber" , required=false) String pageNumber,
			@RequestParam(value="whatColumn", required=false) String whatColumn,
			@RequestParam(value="keyword", required=false) String keyword,
			HttpServletRequest request,
			HttpSession session,Model model	) {
		
		MemberBean loginInfo = (MemberBean)session.getAttribute("loginInfo");
		
		Map<String, String> map = new HashMap<String,String>();
		
		if(rname != null) {
	         if(rname.equals("")) {
	            map.put("rname", null);
	         }
	         else {
	            map.put("rname", rname);
	         }
	      }   
	      else {
	         map.put("rname", rname);
	      }
		
		map.put("whatColumn", whatColumn);
		map.put("keyword", "%"+keyword+"%");
		
		int totalCount = reviewboardDao.getTotalCount(map);
		
		String url = request.getContextPath()+command;
		
		Paging pageInfo = new Paging(pageNumber,null,totalCount,url,whatColumn,keyword,null);
		
		List<ReviewboardBean> lists = new ArrayList<ReviewboardBean>();
		lists = reviewboardDao.getReviewBoard(pageInfo,map);

		System.out.println("rname:::"+rname);
		
		ModelAndView mav=new ModelAndView();
		mav.addObject("rname",rname);
		
		request.setAttribute("loginInfo", loginInfo);
		request.setAttribute("totalCount",totalCount);
		request.setAttribute("pageInfo",pageInfo);
		request.setAttribute("lists",lists);
		
		return getPage;
	}
	
	
	
}
