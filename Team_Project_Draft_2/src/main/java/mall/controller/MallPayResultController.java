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
import mall.model.OrderDao;
import mall.model.OrderInfoBean;
import mall.model.PaySuccessBean;
import member.model.MemberBean;

@Controller
public class MallPayResultController {

	private final String command = "payResult.mall";
	private String getPage = "/payResult";
	
	@Autowired
	private CarDao carDao;
	
	@Autowired
	private OrderDao orderDao;

	@RequestMapping(command)
	public String payResult(HttpSession session, Model model, HttpServletResponse response) throws IOException {
		PaySuccessBean paySuccessBean = (PaySuccessBean) session.getAttribute("paySuccessData");
		System.out.println("paySuccessBean : " + paySuccessBean);
		SimpleDateFormat sdf = new SimpleDateFormat("yyyy/MM/dd");
		Date now = new Date();
		String nowStr = sdf.format(now);
		
		
		
		if(paySuccessBean == null) {
			
			response.setContentType("text/html; charset=UTF-8");
			PrintWriter out = response.getWriter();
			out.println("<script>" + "alert('결제하신 상품이 없습니다.'); " + "history.go(-1);" +"</script>");
			out.flush();
			
			return null;
		}
		else if(paySuccessBean != null) {
			
		List<CarBean> carList = new ArrayList<CarBean>();
		String[] dataList = paySuccessBean.getDataList().split(",");
		for (String data : dataList) {
			CarBean carItem = carDao.getCarByNum(Integer.parseInt(data));
			carList.add(carItem);
		}

		System.out.println("getDataList:" + paySuccessBean.getDataList());
		System.out.println("getOrderNum:" + paySuccessBean.getOrderNum());
		System.out.println("getList size:" + paySuccessBean.getList().size());
		System.out.println("getPaidAmount:" + paySuccessBean.getPaidAmount());

		model.addAttribute("paySuccessBean", paySuccessBean);
		model.addAttribute("carList", carList);
		model.addAttribute("nowStr", nowStr);

		session.setAttribute("paySuccessBean", paySuccessBean);
		session.setAttribute("carList", carList);
		session.setAttribute("nowStr", nowStr);
		}

		return getPage;
	}
}
