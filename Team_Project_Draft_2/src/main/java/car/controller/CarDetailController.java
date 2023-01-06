package car.controller;

import javax.servlet.ServletContext;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import car.model.CarBean;
import car.model.CarDao;

@Controller
public class CarDetailController {
	
	private final String command = "carDetail.ca";
	private final String getPage = "/myCarDetail";
	
	@Autowired
	ServletContext sc;
	
	@Autowired
	CarDao cdao;
	
	@RequestMapping(command)
	public ModelAndView myCarDetail(@RequestParam("cnum") String cnum) {
		ModelAndView mav = new ModelAndView();
		CarBean cb = cdao.myCarDetail(cnum);
		
		mav.addObject("cb", cb);
		mav.setViewName(getPage);
		
		return mav;
	}
}
