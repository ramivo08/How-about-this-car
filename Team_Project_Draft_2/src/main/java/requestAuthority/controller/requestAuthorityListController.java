package requestAuthority.controller;

import java.util.ArrayList;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import requestAuthority.model.requestAuthorityBean;
import requestAuthority.model.requestAuthorityDao;

@Controller
public class requestAuthorityListController {
	
	private final String command="requestList.ra";
	private final String getPage="/requestList";

	@Autowired
	requestAuthorityDao radao;
	
	@RequestMapping(command)
	public String requestList(Model model) {
		List<requestAuthorityBean> lists=new ArrayList<requestAuthorityBean>();
		
		lists = radao.getRequestList();
		
		model.addAttribute("lists", lists);
		
		
		return getPage;
	}
}
