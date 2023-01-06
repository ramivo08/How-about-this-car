package board.controller;

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

import board.model.BoardBean;
import board.model.BoardDao;
import utility.Paging;

@Controller
public class BoardListController {

	private final String command="list.bd";
	private String getPage="/boardList";
	
	@Autowired
	private BoardDao boardDao;
	
	@RequestMapping(command)
	public String list(@RequestParam(value="pageNumber" , required=false) String pageNumber,
						@RequestParam(value="whatColumn", required=false) String whatColumn,
						@RequestParam(value="keyword", required=false) String keyword,
						HttpServletRequest request	) {

		Map<String,String> map  = new HashMap<String,String>();
		map.put("whatColumn", whatColumn);
		map.put("keyword", "%"+keyword+"%");
		
		int totalCount = boardDao.getTotalCount(map);
		
		String url = request.getContextPath()+"/"+command;
		
		Paging pageInfo = new Paging(pageNumber,null,totalCount,url,whatColumn,keyword,null);
		
		List<BoardBean> lists = new ArrayList<BoardBean>();
		lists = boardDao.getBoardList(pageInfo,map);
		
		request.setAttribute("lists", lists);
		request.setAttribute("pageInfo", pageInfo);
		request.setAttribute("totalCount",totalCount);
		
		return getPage;
	}
	
}
