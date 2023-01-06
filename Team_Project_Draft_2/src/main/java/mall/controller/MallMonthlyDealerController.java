package mall.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import car.model.CarBean;
import car.model.CarDao;
import mall.model.MonthlyDealerBean;
import mall.model.OrderDao;

@Controller
public class MallMonthlyDealerController {

	private final String command = "/monthlyDealer.mall";
	private final String getPage = "/monthlyDealer";

	@Autowired
	private OrderDao orderDao;
	
	@Autowired
	CarDao cdao;

	@RequestMapping(value = command, method = RequestMethod.GET)
	public String Dealer(Model model) {
		List<MonthlyDealerBean> dealerList = orderDao.getMonthlyDealerList();
		
		List<CarBean> lists =  cdao.selectMonthlyDealer();
		
		dealerList = dealerList.subList(0, dealerList.size() > 3 ? 3 : dealerList.size());
		model.addAttribute("lists", lists);
		model.addAttribute("dealerList", dealerList);

		return getPage;
	}
}
