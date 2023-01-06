package mall.model;

import java.util.ArrayList;
import java.util.Date;
import java.util.List;

public class OrderInfoBean {

	
	private String cimage;
	private Date orderdate;
	private int onum;
	private String mid;
	private int cnum;//상품번호
	private String carname;
	
	private List<OrderInfoBean> carList = new ArrayList<OrderInfoBean>();
	
	public String getCimage() {
		return cimage;
	}
	public void setCimage(String cimage) {
		this.cimage = cimage;
	}
	public int getOnum() {
		return onum;
	}
	public void setOnum(int onum) {
		this.onum = onum;
	}
	public String getMid() {
		return mid;
	}
	public void setMid(String mid) {
		this.mid = mid;
	}
	public int getCnum() {
		return cnum;
	}
	public void setCnum(int cnum) {
		this.cnum = cnum;
	}
	public List<OrderInfoBean> getCarList() {
		return carList;
	}
	public void setCarList(List<OrderInfoBean> carList) {
		this.carList = carList;
	}
	
	public void addCarList(OrderInfoBean param) {
		this.carList.add(param);
	}
	public Date getOrderdate() {
		return orderdate;
	}
	public void setOrderdate(Date orderdate) {
		this.orderdate = orderdate;
	}
	public String getCarname() {
		return carname;
	}
	public void setCarname(String carname) {
		this.carname = carname;
	}
	
	
}
