package faq.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import faq.model.FaqDao;

@Controller
public class FaqDeleteController {

	private final String command = "delete.fq";
	private String getPage = "redirect:/list.fq";
	
	@Autowired
	private FaqDao faqDao;
	@RequestMapping(command)
	public String delete(@RequestParam(value="fnum",required = false) String fnum,
			@RequestParam(value="pageNumber",required = false) String pageNumber) {
		
		
		int result = faqDao.deleteFaq(fnum); 
		System.out.println("result:"+result);
		return getPage+"?pageNumber="+pageNumber;
		
	}
}
