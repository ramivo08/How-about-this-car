package mall.controller;

import java.io.IOException;
import java.io.PrintWriter;
import java.net.http.HttpResponse;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;

import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import car.model.CarBean;
import car.model.CarDao;
import mall.model.OrderBean;
import mall.model.OrderDao;
import mall.model.OrderInfoBean;
import mall.model.PaySuccessBean;
import member.model.MemberBean;

@Controller
public class MallOrderListController {

	private final String command = "orderList.mall";
	private String getPage = "/orderList";

	@Autowired
	private OrderDao orderDao;

	@RequestMapping(command)
	public String orderList(HttpSession session, Model model, HttpServletResponse response) throws IOException {
		MemberBean mb = (MemberBean) session.getAttribute("loginInfo");

		List<OrderInfoBean> orderList = new ArrayList<OrderInfoBean>(); // 주문 단위
		List<OrderInfoBean> orderInfoList = orderDao.selectOrderListByMid(mb.getId()); // 주문상세 단위 (차 단위), 회원의 아이디로 주문한것을 가져온다
		List<Integer> orderCheckList = new ArrayList<Integer>(); // 체크 확인용 리스트

		for (OrderInfoBean item : orderInfoList) { //주문상세단위(차 단위)를 OrderInfoBean에 담는다.
			if (!orderCheckList.contains(item.getOnum())) { //orderCheckList에 OrderInfoBean의 Onum을 포함하는게 없으면 
				orderList.add(item);//orderList(주문단위)에 추가해라
				orderCheckList.add(item.getOnum());//orderCheckList OrderInfoBean의 Onum을 추가해라
			}
		}
		

		for (OrderInfoBean item : orderInfoList) {
			for (OrderInfoBean subItem : orderList) {
				if (subItem.getOnum() == item.getOnum()) {
					item.addCarList(subItem);
				}
			}
		}

		model.addAttribute("orderInfoList", orderList);

		return getPage;
	}
}
