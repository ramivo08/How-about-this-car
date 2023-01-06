package mall.controller;

import java.util.ArrayList;
import java.util.Iterator;
import java.util.List;
import java.util.Map;
import java.util.Set;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import car.model.CarBean;
import car.model.CarDao;
import mall.cart.MyCartList;
import mall.cart.ShoppingInfo;

@Controller
public class MallComparisonController {
	
	private final String command = "comparison.mall";
	private String getPage="/comparison";
	
	@Autowired
	private CarDao carDao;
	
	@RequestMapping(command)
	public String comparison(HttpSession session, Model model, @RequestParam("numData") String numData) {
		System.out.println("비교하기 컨트롤러");
		
		System.out.println("numData:" + numData);
		
		List<CarBean> carList = new ArrayList<CarBean>();
		
		String[] numArr = numData.split(",");
		for (String num : numArr) {
			CarBean carItem = carDao.getCarByNum(Integer.parseInt(num));
			carList.add(carItem);
		}
		
		model.addAttribute("carList", carList);

		return getPage;

	}

}

