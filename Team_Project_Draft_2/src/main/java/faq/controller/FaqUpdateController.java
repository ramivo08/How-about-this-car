package faq.controller;

import javax.validation.Valid;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import faq.model.FaqBean;
import faq.model.FaqDao;

@Controller
public class FaqUpdateController {
	public final String command="update.fq";
	public String getPage="/faqUpdate";
	public String gotoPage="redirect:/list.fq";
	
	@Autowired
	private FaqDao faqDao;
	
	@RequestMapping(value=command, method=RequestMethod.GET)
	public String update(@RequestParam("fnum") String fnum,
						 @RequestParam(value="pageNumber", required = false) String pageNumber,
						 Model model) {
		 
		FaqBean faq=faqDao.getFaq(fnum);
		model.addAttribute("fq",faq);
		model.addAttribute("pageNumber",pageNumber);
		return getPage;
	}

	@RequestMapping(value=command,method=RequestMethod.POST)
	public ModelAndView updateProc(
			@ModelAttribute("faq") @Valid FaqBean faq,
			BindingResult result,
			@RequestParam(value="pageNumber",required = false) String pageNumber) {
		
		ModelAndView mav=new ModelAndView();
		if(result.hasErrors()) {
			mav.addObject("pageNumber", pageNumber);
			mav.setViewName(getPage);
		}
		
		faqDao.updateFaq(faq);
		mav.setViewName(gotoPage+"?pageNumber="+pageNumber);
		
		return mav;
	}

	
}
