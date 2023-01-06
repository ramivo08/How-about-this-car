package mall.model;

public class MallWishBean {

	private String wid;       
	private int wnum;      
	private String wimage;   
	private String wname;    
	private int wprice;   
	private String wday;
	private String wyear;
	private String wmileage;
	private int wpay_amt;
	private String wcmem_comadd;
	private String wmodel;
	private String wcompany;
	private String woption;
	
	public MallWishBean() {
		super();
	}

	public MallWishBean(String wid, int wnum, String wimage, String wname, int wprice, String wday, String wyear,
			String wmileage, int wpay_amt, String wcmem_comadd, String wmodel, String wcompany, String woption) {
		super();
		this.wid = wid;
		this.wnum = wnum;
		this.wimage = wimage;
		this.wname = wname;
		this.wprice = wprice;
		this.wday = wday;
		this.wyear = wyear;
		this.wmileage = wmileage;
		this.wpay_amt = wpay_amt;
		this.wcmem_comadd = wcmem_comadd;
		this.wmodel = wmodel;
		this.wcompany = wcompany;
		this.woption = woption;
	}



	public String getWid() {
		return wid;
	}

	public void setWid(String wid) {
		this.wid = wid;
	}

	public int getWnum() {
		return wnum;
	}

	public void setWnum(int wnum) {
		this.wnum = wnum;
	}

	public String getWimage() {
		return wimage;
	}

	public void setWimage(String wimage) {
		this.wimage = wimage;
	}

	public String getWname() {
		return wname;
	}

	public void setWname(String wname) {
		this.wname = wname;
	}

	public int getWprice() {
		return wprice;
	}

	public void setWprice(int wprice) {
		this.wprice = wprice;
	}

	public String getWday() {
		return wday;
	}

	public void setWday(String wday) {
		this.wday = wday;
	}

	public String getWyear() {
		return wyear;
	}

	public void setWyear(String wyear) {
		this.wyear = wyear;
	}

	public String getWmileage() {
		return wmileage;
	}

	public void setWmileage(String wmileage) {
		this.wmileage = wmileage;
	}

	public int getWpay_amt() {
		return wpay_amt;
	}

	public void setWpay_amt(int wpay_amt) {
		this.wpay_amt = wpay_amt;
	}

	public String getWcmem_comadd() {
		return wcmem_comadd;
	}

	public void setWcmem_comadd(String wcmem_comadd) {
		this.wcmem_comadd = wcmem_comadd;
	}

	public String getWmodel() {
		return wmodel;
	}

	public void setWmodel(String wmodel) {
		this.wmodel = wmodel;
	}

	public String getWcompany() {
		return wcompany;
	}

	public void setWcompany(String wcompany) {
		this.wcompany = wcompany;
	}

	public String getWoption() {
		return woption;
	}

	public void setWoption(String woption) {
		this.woption = woption;
	}

	
	
}
