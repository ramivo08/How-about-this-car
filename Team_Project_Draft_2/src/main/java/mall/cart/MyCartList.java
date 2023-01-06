package mall.cart;

import java.util.HashMap;
import java.util.LinkedHashMap;
import java.util.Map;

import javax.servlet.http.HttpServletResponse;



public class MyCartList {

	private HttpServletResponse response;
	
	private Map<Integer,String> orderlists = null;
	
	public MyCartList() {
		//장바구니 만들면 여기로오기!
		orderlists = new LinkedHashMap<Integer,String>();
	}
	
	
	public boolean addOrder(int pnum, String pid) {
		boolean isOrder = false;
		
		if(orderlists.containsKey(pnum)) {
			
			String opid = orderlists.get(pnum);
			orderlists.replace(pnum, opid);
			isOrder = true;
		} else {
			//장바구니 없으면 담기
			orderlists.put(pnum,pid);
		}
		return isOrder;
	}


	public Map<Integer, String> getAllOrderList() {
		return orderlists;
	}


	public void delete(int num) {
		String data = orderlists.get(num);
		if (data != null) {
			orderlists.remove(num);
		}
	}
}
