package mall.controller;

import java.util.ArrayList;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import car.model.CarDao;
import mall.cart.MyCartList;
import mall.model.OrderDao;
import mall.model.OrderDetailDao;
import mall.model.PaySuccessBean;
import mall.model.PaySuccessDetailBean;
import member.model.MemberBean;

@Controller
public class MallPaySuccessController {

	@Autowired
	private OrderDao orderDao;

	@Autowired
	private OrderDetailDao orderDetailDao;
	
	@Autowired
	CarDao cdao;

	private final String command = "paySuccess.mall";

	@ResponseBody
	@RequestMapping(value = command, method = RequestMethod.POST)
	public String paySuccess(HttpSession session, Model model, HttpServletRequest request, PaySuccessBean paySuccessBean) {
		
		System.out.println("dataList: " + paySuccessBean.getDataList());
		System.out.println("getOrderNum: " + paySuccessBean.getOrderNum());
		System.out.println("getPaidAmount: " + paySuccessBean.getPaidAmount());
		
		List<PaySuccessDetailBean> detailList = new ArrayList<PaySuccessDetailBean>();
		
		System.out.println("������� �� ��!");
		MemberBean loginInfo = (MemberBean) session.getAttribute("loginInfo");
		if (loginInfo == null) {
			System.out.println("���� ����!");
		}

		int result = orderDao.insertData(paySuccessBean);
		System.out.println("result: " + result);

		if (result > 0) {
			String[] dataArr = paySuccessBean.getDataList().split(",");
			for (String item : dataArr) {
				PaySuccessDetailBean detailBean = new PaySuccessDetailBean();
				detailBean.setOnum(paySuccessBean.getOrderNum());
				detailBean.setCnum(item); // ��ǰ��ȣ
				cdao.updateStatus(item);
				detailBean.setMid(loginInfo.getId()); // ȸ�����̵�
				orderDetailDao.insertData(detailBean);
				detailList.add(detailBean);
				System.out.println("detailList.add Success!");
			}
			paySuccessBean.setList(detailList);
			

			MyCartList mycart =(MyCartList)session.getAttribute("mycart"); 
			System.out.println("mycart:"+mycart);
			
			if (mycart == null) {
				//��ٱ��� ������
				mycart = new MyCartList();
			}
			
			if (dataArr.length > 1) {
				for (String item : dataArr) {
					mycart.delete(Integer.parseInt(item));
				}
			} else {
				mycart.delete(Integer.parseInt(dataArr[0]));
			}
			System.out.println("mycart:"+mycart);
			session.setAttribute("mycart", mycart);
			
			session.setAttribute("paySuccessData", paySuccessBean);
			System.out.println("session.setAttribute Success!");
		}
		return String.valueOf(result);
	}
}
