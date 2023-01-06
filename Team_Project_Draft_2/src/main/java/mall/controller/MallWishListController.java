package mall.controller;

import java.util.ArrayList;
import java.util.Iterator;
import java.util.List;
import java.util.Map;
import java.util.Set;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import car.model.CarBean;
import car.model.CarDao;
import mall.cart.MyCartList;
import mall.cart.ShoppingInfo;

@Controller
public class MallWishListController {
	
	private final String command = "wishlist.mall";
	private String getPage="/wishList";
	
	@Autowired
	private CarDao carDao;
	
	@RequestMapping(command)
	public String mallList(HttpSession session, Model model, HttpServletRequest request) {
		String isOrderYn = request.getParameter("isOrderYn");
		if (isOrderYn == null) isOrderYn = "N";
			//장바구니 끌어오기
		MyCartList mycart =(MyCartList)session.getAttribute("mycart");
		if(mycart==null) {
			//장바구니 생성전
			mycart = new MyCartList();
		}
		Map<Integer,String> map = mycart.getAllOrderList(); //장바구니를 가져오는 메서드이다.
		
		Set<Integer> klist = map.keySet();
		System.out.println("klist:"+klist);
		
		String allWishData = "";
		Iterator<Integer> iterator = klist.iterator();
		while (iterator.hasNext()) {
			Integer value = iterator.next();
			allWishData += value;
			if (iterator.hasNext()) {
				allWishData += ",";
			}
		}
		
		List<ShoppingInfo> shopLists = new ArrayList<ShoppingInfo>();
		
		int Totalpay_amt= 0;
		
		for(Integer pnum : klist) {
			System.out.println("pnum : "  + pnum);
			CarBean car = carDao.getCarByNum(pnum);
			System.out.println(car.getCmodel());
			System.out.println(car.getCid());
			System.out.println(car.getCnum());
			
			ShoppingInfo shopinfo = new ShoppingInfo();
			shopinfo.setNum(pnum);
			shopinfo.setName(car.getCarname());
			shopinfo.setImage(car.getCimage());
			shopinfo.setModel(car.getCmodel());
			shopinfo.setOption(car.getCoption());
			shopinfo.setPrice(Integer.parseInt(car.getCprice()));
			shopinfo.setCompany(car.getCcompany());
			
			int amt = (int) (Integer.parseInt(car.getCprice())*0.3);
			shopinfo.setPay_amt(amt);
			Totalpay_amt = amt;
			
			shopLists.add(shopinfo);
		}
		model.addAttribute("lists", shopLists);
		model.addAttribute("Totalpay_amt", Totalpay_amt);
		model.addAttribute("allWishData", allWishData);
		model.addAttribute("isOrderYn", isOrderYn);

		System.out.println("위시리스트컨트롤러");
		return getPage;

	}

}

