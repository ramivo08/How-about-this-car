package car.controller;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import car.model.CarBean;
import car.model.CarDao;
import utility.Paging;
import utility2.Paging2;

@Controller
public class CarMainListController {

	private final String command="mainList.ca";
	private final String getPage="/mainList";
	
	@Autowired
	CarDao cdao;
	
	@RequestMapping(command)
	public ModelAndView goList(HttpSession session,@RequestParam(value="whatColumn",required = false) String whatColumn,
			@RequestParam(value="keyword",required = false) String keyword,
			@RequestParam(value="pageNumber",required = false) String pageNumber,
			@RequestParam(value="whatColumn2",required = false) String whatColumn2,
			@RequestParam(value="whatColumn3",required = false) String whatColumn3,
			@RequestParam(value="keyword2",required = false) String keyword2,
			@RequestParam(value="keyword3",required = false) String keyword3,
			HttpServletRequest request,Model model) {
		
				
				Map<String, String> map = new HashMap<String,String>();
				map.put("whatColumn", whatColumn); // map에 put이라는 메소드를 사용하여 whatColumn넣기
				map.put("keyword", "%" + keyword + "%"); // "%"로 묶는 이유는 sql에서 검색할 때, 입력한 내용이 포함되기 위해서 넣음
				map.put("whatColumn2", whatColumn2);
				map.put("whatColumn3", whatColumn3);
				map.put("keyword2", keyword2);
				map.put("keyword3", keyword3);

				int totalcount = cdao.getMainTotalCount(map);
				String url = request.getContextPath() + "/" + command;
				Paging2 pageInfo = new Paging2(pageNumber, null, totalcount, url, whatColumn, keyword, null);
				
				ModelAndView mav = new ModelAndView();
				List<CarBean> lists=new ArrayList<CarBean>();
				
				lists = cdao.selectAllCar(map,pageInfo);

				mav.addObject("lists", lists);
				mav.addObject("pageInfo", pageInfo);
				mav.addObject("totalcount", totalcount);
				
				mav.setViewName(getPage);
		
		
		
		
		//lists = cdao.selectAllCar();
		
		//model.addAttribute("lists", lists);
		
		return mav;
	}
	
	/*
	 * @RequestMapping(value=command,method=RequestMethod.POST) public String
	 * goListBySearch(Model model) {
	 * 
	 * List<CarBean> lists = new ArrayList<CarBean>();
	 * 
	 * //lists = cdao.selectAllCar();
	 * 
	 * model.addAttribute("lists", lists);
	 * 
	 * return getPage; }
	 */	
}
