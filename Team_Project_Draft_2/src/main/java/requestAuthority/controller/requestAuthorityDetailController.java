package requestAuthority.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import requestAuthority.model.requestAuthorityBean;
import requestAuthority.model.requestAuthorityDao;

@Controller
public class requestAuthorityDetailController {

	private final String command = "detail.ra";
	private final String getPage = "/raDetail";
	
	@Autowired
	requestAuthorityDao radao;
	
	@RequestMapping(command)
	public String detailView(@RequestParam("id") String id, Model model) {
		
		requestAuthorityBean rabean = radao.getInfoByID(id);
		model.addAttribute("rabean", rabean);
		
		return getPage;
	}
}
