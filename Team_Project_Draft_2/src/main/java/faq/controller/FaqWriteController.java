package faq.controller;

import javax.validation.Valid;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;

import faq.model.FaqBean;
import faq.model.FaqDao;

@Controller
public class FaqWriteController {
	
	public final String command="write.fq";
	public String getPage="/faqWrite";
	private final String gotoPage = "redirect:/list.fq";

	@Autowired
	private FaqDao faqDao;

	
	@RequestMapping(command)
	public String write() {
		return getPage;
	}
	
	@RequestMapping(value= command,method=RequestMethod.POST)
	public ModelAndView write(@ModelAttribute("faq") @Valid FaqBean faq, 	
							BindingResult result) {
		
		ModelAndView mav = new ModelAndView();
		if(result.hasErrors()) {
			mav.setViewName(getPage);
			System.out.println(result.getErrorCount());
			return mav;
		}
		
		faqDao.writeFaq(faq);

		mav.setViewName(gotoPage);
		return mav;

	}

}
