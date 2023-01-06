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

		List<OrderInfoBean> orderList = new ArrayList<OrderInfoBean>(); // �ֹ� ����
		List<OrderInfoBean> orderInfoList = orderDao.selectOrderListByMid(mb.getId()); // �ֹ��� ���� (�� ����), ȸ���� ���̵�� �ֹ��Ѱ��� �����´�
		List<Integer> orderCheckList = new ArrayList<Integer>(); // üũ Ȯ�ο� ����Ʈ

		for (OrderInfoBean item : orderInfoList) { //�ֹ��󼼴���(�� ����)�� OrderInfoBean�� ��´�.
			if (!orderCheckList.contains(item.getOnum())) { //orderCheckList�� OrderInfoBean�� Onum�� �����ϴ°� ������ 
				orderList.add(item);//orderList(�ֹ�����)�� �߰��ض�
				orderCheckList.add(item.getOnum());//orderCheckList OrderInfoBean�� Onum�� �߰��ض�
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
