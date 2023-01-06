package faq.controller;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import faq.model.FaqBean;
import faq.model.FaqDao;
import utility.Paging;

@Controller
public class FaqListController {
	private final String command="list.fq";
	private String getPage="/faqList";
	
	@Autowired
	private FaqDao faqDao;
	
	@RequestMapping(command)
	public String list(@RequestParam(value="pageNumber" , required=false) String pageNumber,
						@RequestParam(value="whatColumn", required=false) String whatColumn,
						@RequestParam(value="keyword", required=false) String keyword,
						HttpServletRequest request	) {

		Map<String,String> map  = new HashMap<String,String>();
		map.put("whatColumn", whatColumn);
		map.put("keyword", "%"+keyword+"%");
		
		int totalCount = faqDao.getTotalCount(map);
		
		String url = request.getContextPath()+"/"+command;
		
		Paging pageInfo = new Paging(pageNumber,null,totalCount,url,whatColumn,keyword,null);
		
		List<FaqBean> lists = new ArrayList<FaqBean>();
		lists = faqDao.getFaqList(pageInfo,map);
		
		request.setAttribute("lists", lists);
		request.setAttribute("pageInfo", pageInfo);
		request.setAttribute("totalCount",totalCount);
		
		return getPage;
	}
	
}