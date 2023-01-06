package review.controller;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import review.model.ReviewboardDao;
import utility2.Paging2;

@Controller
public class YouTubeController {
		
	private final String command = "youtube.reb";
	private String getpage = "/youTube2";
	
	@Autowired
	private ReviewboardDao reviewboardDao;
	
	@RequestMapping(command)
	public String youtube(
			@RequestParam(value="pageNumber",required = false) String pageNumber,
			HttpServletRequest request) {
		
		String url = request.getContextPath() + "/" + command;
		Paging2 pageInfo = new Paging2(pageNumber, null, 0, url,null, null, null);
		
		ModelAndView mav = new ModelAndView();
		
		reviewboardDao.pageinfo(pageInfo);
		
		mav.addObject("pageInfo", pageInfo);
		
		return getpage;
	}
	

}
