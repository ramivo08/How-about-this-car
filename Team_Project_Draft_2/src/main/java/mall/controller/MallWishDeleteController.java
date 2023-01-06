package mall.controller;


import javax.servlet.ServletContext;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import car.model.CarBean;
import mall.cart.MyCartList;


@Controller
public class MallWishDeleteController {

	private final String command ="wishdelete.mall";
	private String getPage ="redirect:/login.mem";
	private String gotoPage ="redirect:/wishlist.mall";
	
	@Autowired
	ServletContext servletContext;
	
	@RequestMapping(command)
	public String deleteWish(HttpSession session, @RequestParam(value = "num", required = false) String numStr,
			@RequestParam(value = "numList", required = false) String numList) {
		boolean isList = false; // 리스트로 데이터가 들어왔는지 여부
		int num = 0;
		String[] numArr = null;
		if (numList != null) {
			isList = true;
			numArr = numList.split(",");
		} else {
			num = Integer.parseInt(numStr);
		}
		System.out.println("위시delete");
		System.out.println("num:" + num);
		
		if(session.getAttribute("loginInfo")==null) {
			session.setAttribute("destination", "redirect:/detail.ca?cnum="+num);
			return getPage;
		} else {
			MyCartList mycart =(MyCartList)session.getAttribute("mycart"); 
			System.out.println("mycart:"+mycart);
			
			if (mycart == null) {
				//장바구니 생성전
				mycart = new MyCartList();
			}
			
			if (isList) {
				for (String item : numArr) {
					mycart.delete(Integer.parseInt(item));
				}
			} else {
				mycart.delete(num);
			}
			System.out.println("mycart:"+mycart);
			session.setAttribute("mycart", mycart);
			
			return gotoPage;
		}
	}
}