package mall.controller;


import javax.servlet.ServletContext;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import car.model.CarBean;
import car.model.CarDao;
import mall.cart.MyCartList;


@Controller
public class MallWishAddController {

	private final String command ="wishadd.mall";
	private String getPage ="redirect:/login.mem";
	private String gotoPage ="redirect:/wishlist.mall";
	
	
	@Autowired
	CarDao cdao;
	
	@Autowired
	ServletContext servletContext;
	
	@RequestMapping(command)
	public String addwish(HttpSession session, CarBean car,
						@RequestParam(value="pageNumber",required = false) String pageNumber,
						@RequestParam(value="cnum",required = false) String cnum,
						@RequestParam(value="cid",required = false) String cid
						) {
		
		System.out.println("위시add");
		System.out.println("car.getCnum():"+car.getCnum());
		System.out.println("car.getCid():"+car.getCid());
		
		int pnum = Integer.parseInt(cnum);
		String pid = cid;
		
		if(session.getAttribute("loginInfo")==null) {
			//detail.ca?cnum=17&pageNumber=null
			//carDetailView.ca?cnum=17
			session.setAttribute("destination", "redirect:/carDetailView.ca?cnum="+car.getCnum());//로그인후 상품상세보기로 이동
			
			return getPage;
		
		}
		else {
			MyCartList mycart =(MyCartList)session.getAttribute("mycart"); 
			System.out.println("mycart:"+mycart);
			
			if(mycart==null) {
				//장바구니 생성전
				
			mycart = new MyCartList();
			
			}
			
			
			boolean isOrder = mycart.addOrder(pnum, pid);
			String isOrderYn = isOrder ? "Y" : "N";
			System.out.println("mycart:"+mycart);
			session.setAttribute("mycart", mycart);
			
			return gotoPage + "?isOrderYn=" + isOrderYn;
		}

	}
	
}

