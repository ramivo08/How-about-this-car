package mall.controller;


import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import car.model.CarBean;
import car.model.CarDao;


//주문상세 보기
@Controller
public class MallOrderDetailController {

	private final String command = "orderDetail.mall";
	private String getPage = "/orderDetail";

	@Autowired
	private CarDao carDao;

	@RequestMapping(command)
	public String orderDetail(HttpSession session, Model model, HttpServletRequest req) {
		String cnumStr = req.getParameter("cnum");
		int cnum = Integer.parseInt(cnumStr);

		CarBean item = carDao.getCarByNum(cnum);

		model.addAttribute("item", item);
		model.addAttribute("cnum", req.getParameter("cnum"));

		return getPage;
	}
}