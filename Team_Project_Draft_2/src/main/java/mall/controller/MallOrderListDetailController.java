package mall.controller;

import java.io.IOException;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import mall.model.OrderDao;
import mall.model.OrderInfoBean;

@Controller
public class MallOrderListDetailController {

	private final String command = "orderListDetail.mall";
	private String getPage = "/orderListDetail";

	@Autowired
	private OrderDao orderDao;

	@RequestMapping(command)
	public String orderListDetail(HttpSession session, Model model, HttpServletResponse response,
			HttpServletRequest req) throws IOException {
		String onumStr = req.getParameter("onum");
		int onum = Integer.parseInt(onumStr);

		List<OrderInfoBean> payResultDetailList = orderDao.selectpayResultDetailListByOnum(onum);

		model.addAttribute("payResultDetailList", payResultDetailList);

		return getPage;
	}
}
