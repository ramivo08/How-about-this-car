package mall.controller;


import java.util.ArrayList;
import java.util.List;
import java.util.Map;
import java.util.Set;

import javax.servlet.http.HttpServletRequest;
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
public class MallPayController {

	@Autowired
	private CarDao cardao;
	
	private final String command="pay.mall";
	private String getPage="/payForm";

	@RequestMapping(command)
	public String pay(HttpSession session, Model model,
			HttpServletRequest request, @RequestParam(value="num", required = false) String num) {
		String numList = request.getParameter("numList");
		String[] numList2 = null;
		boolean isList = false; // 여러개의 상품인지 여부
		if (numList != null) {
			isList = true;
			numList2 = numList.split(",");
			System.out.println("여러개의 상품");
		} else {
			System.out.println("pay컨트롤러 num:"+num);
		}
		
		MyCartList mycart =(MyCartList)session.getAttribute("mycart");
		Map<Integer,String> map = mycart.getAllOrderList();
		
		Set<Integer> paylist = map.keySet();
		System.out.println("paylist:"+paylist);
		
		int Totalpay_amt= 0;
		
		List<ShoppingInfo> shopLists = new ArrayList<ShoppingInfo>();

		if (!isList) {
			// 하나만 가지고 왔을 때
			CarBean car = cardao.getCarByNum(Integer.parseInt(num));
		
			ShoppingInfo shopinfo = new ShoppingInfo();
			shopinfo.setNum(Integer.parseInt(num));
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
		} else {
			// 여러개를 가지고 왔을 때
			for(Integer pnum : paylist) {
				for (String numStr : numList2) {
					if (numStr.equals(String.valueOf(pnum))) {
						CarBean car = cardao.getCarByNum(pnum);
						
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
						Totalpay_amt += amt;
						
						shopLists.add(shopinfo);
						break;
					}
				}
			}
		}
		model.addAttribute("lists", shopLists);
		model.addAttribute("Totalpay_amt", Totalpay_amt);
		model.addAttribute("numData", isList ? numList : num);
		
		return getPage;
		
	
}
}
