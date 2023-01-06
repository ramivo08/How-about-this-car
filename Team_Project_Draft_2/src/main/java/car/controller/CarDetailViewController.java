package car.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import car.model.CarBean;
import car.model.CarDao;

@Controller
public class CarDetailViewController {

	private final String command="carDetailView.ca";
	private final String getPage="/CarDetailView";
	
	@Autowired
	CarDao cdao;
	
	@RequestMapping(command)
	public ModelAndView detailView(@RequestParam("cnum") String cnum ) {
		ModelAndView mav = new ModelAndView();
		
		CarBean cb = cdao.myCarDetail(cnum);
		
		PriceCalculate pc = new PriceCalculate();
		pc.setP_max(cdao.getMaxPrice(cb.getCmodel())); 
		pc.setP_min(cdao.getMinPrice(cb.getCmodel()));
		
		System.out.println("min : " + cdao.getMinPrice(cb.getCmodel()));
		System.out.println("max : " + cdao.getMaxPrice(cb.getCmodel()));
		
		double middlePrice = pc.getP_max() - pc.getP_min();
		
		double temp = Integer.parseInt(cb.getCprice()) - pc.getP_min();
		
		if(temp == 0 && middlePrice == 0) {
			middlePrice = 100;
		}
		
		System.out.println("mp : " + middlePrice);
		System.out.println("temp : " + temp);
		
		double avg = temp/middlePrice * 100;
		
		long avg2 = Math.round(avg);
		
		
		System.out.println(avg2);
		
		if(avg2>0 && avg2 <1) {
			avg2 = 1;
		}
		
		System.out.println("avg : " + avg);
		
		System.out.println("상품 디테일 화면 이미지 파일들 이름 : " + cb.getCimage());
		
		
		pc.setP_avg((int) avg2);
		System.out.println(pc.getP_avg());
		System.out.println("==============");
		
		mav.addObject("pc", pc);
		mav.addObject("cb",cb);
		mav.setViewName(getPage);
		
		return mav;
	}
}
