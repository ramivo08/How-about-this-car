package member.model;


import org.hibernate.validator.constraints.NotBlank;
import org.hibernate.validator.constraints.NotEmpty;

public class MemberBean {
	private int num;
	
	 private String id;
	   @NotBlank(message = "이름을 입력하세요")
	   private String name;
	   private String pw;
	   private String company;
	   private String gender;
	   
	   private String addrnum;
	   @NotBlank(message = "주소를 입력하세요")
	   private String addr;
	   @NotBlank(message = "이메일을 입력하세요")
	   private String email;
	   private String com_add;
	   @NotEmpty(message = "전화번호를 입력하세요")
	   private String hp;

	   @NotBlank(message = "생년월일을 입력하세요")
	   private String yy;
	   @NotBlank(message = "생년월일을 입력하세요")
	   private String mm;
	   @NotBlank(message = "생년월일을 입력하세요")
	   private String dd;
	   private int authority;
	
	
	private String addr_num;
	private String addr_first;
	private String addr_last;
	
	
	public String getAddr_num() {
		return addr_num;
	}
	public void setAddr_num(String addr_num) {
		this.addr_num = addr_num;
	}
	public String getAddr_first() {
		return addr_first;
	}
	public void setAddr_first(String addr_first) {
		this.addr_first = addr_first;
	}
	public String getAddr_last() {
		return addr_last;
	}
	public void setAddr_last(String addr_last) {
		this.addr_last = addr_last;
	}
	
	
	public int getNum() {
		return num;
	}
	public void setNum(int num) {
		this.num = num;
	}
	public String getId() {
		return id;
	}
	public void setId(String id) {
		this.id = id;
	}
	public String getName() {
		return name;
	}
	public void setName(String name) {
		this.name = name;
	}
	public String getPw() {
		return pw;
	}
	public void setPw(String pw) {
		this.pw = pw;
	}
	public String getCompany() {
		return company;
	}
	public void setCompany(String company) {
		this.company = company;
	}
	public String getGender() {
		return gender;
	}
	public void setGender(String gender) {
		this.gender = gender;
	}
	public String getAddrnum() {
		return addrnum;
	}
	public void setAddrnum(String addrnum) {
		this.addrnum = addrnum;
	}
	public String getAddr() {
		return addr;
	}
	public void setAddr(String addr) {
		this.addr = addr;
	}
	public String getEmail() {
		return email;
	}
	public void setEmail(String email) {
		this.email = email;
	}
	public String getCom_add() {
		return com_add;
	}
	public void setCom_add(String com_add) {
		this.com_add = com_add;
	}
	public String getHp() {
		return hp;
	}
	public void setHp(String hp) {
		this.hp = hp;
	}
	public String getYy() {
		return yy;
	}
	public void setYy(String yy) {
		this.yy = yy;
	}
	public String getMm() {
		return mm;
	}
	public void setMm(String mm) {
		this.mm = mm;
	}
	public String getDd() {
		return dd;
	}
	public void setDd(String dd) {
		this.dd = dd;
	}
	public int getAuthority() {
		return authority;
	}
	public void setAuthority(int authority) {
		this.authority = authority;
	}
	
	

}
