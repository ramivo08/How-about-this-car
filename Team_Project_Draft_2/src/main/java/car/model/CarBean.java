package car.model;

import javax.validation.constraints.NotNull;
import javax.validation.constraints.Pattern;

import org.hibernate.validator.constraints.NotBlank;
import org.springframework.web.multipart.MultipartFile;

public class CarBean {

	private int cnum;
	private String cid;
	private String cname;
	
	@Pattern(regexp="^[0-9]{0,11}$",message = "��ȣ������ Ʋ�Ƚ��ϴ�.")
	private String chp;

	
	@NotBlank(message="��ǰ�� �̸��� �ʼ��Դϴ�.")
	private String carname;
	
	@NotBlank(message="���� ������� �ʼ��Դϴ�.")
	private String creg_day;
	
	@NotBlank(message="������ �̸��� �ʼ��Դϴ�.")
	private String ccompany;
	
	@NotBlank(message="�� �̸��� �ʼ��Դϴ�.")
	private String cmodel;
	

	private String coption;
	
	@Pattern(regexp="^[0-9]*$",message = "���ڸ� �Է� �����մϴ�.")
	@NotBlank(message="���� �Է��� �ʼ��Դϴ�.")
	private String cprice;
	@Pattern(regexp="^[0-9]*$",message = "���ڸ� �Է� �����մϴ�.")
	@NotBlank(message="����Ÿ� �Է��� �ʼ��Դϴ�.")
	private String cmileage;
	
	@NotNull(message="�������� �Է��� �ʼ��Դϴ�.")
	private String cdnf;
	
	@NotNull(message="��� ���� �Է��� �ʼ��Դϴ�.")
	private String caccident;
	
	@NotBlank(message="��ǰ ������ �ʼ��Դϴ�.")
	private String cimage;
	
	@NotBlank(message="��ǰ ������ �ʼ��Դϴ�.")
	private String ccontent;
	
	private String inputdate;
	private int status;
	private MultipartFile upload;
	
	private int cnt;
	
	public int getCnt() {
		return cnt;
	}
	public void setCnt(int cnt) {
		this.cnt = cnt;
	}
	public int getStatus() {
		return status;
	}
	public void setStatus(int status) {
		this.status = status;
	}
	

	public MultipartFile getUpload() {
		return upload;
	}
	public void setUpload(MultipartFile upload) {
		this.upload = upload;
		System.out.println("setUpload : " + upload); // ��ü���·� ��
		System.out.println(upload.getName()); // upload�� �̸�
		System.out.println(upload.getOriginalFilename()); // ��¥ ���� �̸�
		this.cimage = upload.getOriginalFilename();
	}
	public int getCnum() {
		return cnum;
	}
	public void setCnum(int cnum) {
		this.cnum = cnum;
	}
	public String getCid() {
		return cid;
	}
	public void setCid(String cid) {
		this.cid = cid;
	}
	public String getCname() {
		return cname;
	}
	public void setCname(String cname) {
		this.cname = cname;
	}
	public String getChp() {
		return chp;
	}
	public void setChp(String chp) {
		this.chp = chp;
	}

	public String getCarname() {
		return carname;
	}
	public void setCarname(String carname) {
		this.carname = carname;
	}
	public String getCreg_day() {
		return creg_day;
	}
	public void setCreg_day(String creg_day) {
		this.creg_day = creg_day;
	}
	public String getCcompany() {
		return ccompany;
	}
	public void setCcompany(String ccompany) {
		this.ccompany = ccompany;
	}
	public String getCmodel() {
		return cmodel;
	}
	public void setCmodel(String cmodel) {
		this.cmodel = cmodel;
	}
	public String getCoption() {
		return coption;
	}
	public void setCoption(String coption) {
		this.coption = coption;
	}
	public String getCprice() {
		return cprice;
	}
	public void setCprice(String cprice) {
		this.cprice = cprice;
	}
	public String getCmileage() {
		return cmileage;
	}
	public void setCmileage(String cmileage) {
		this.cmileage = cmileage;
	}
	public String getCdnf() {
		return cdnf;
	}
	public void setCdnf(String cdnf) {
		this.cdnf = cdnf;
	}
	public String getCaccident() {
		return caccident;
	}
	public void setCaccident(String caccident) {
		this.caccident = caccident;
	}
	public String getCimage() {
		return cimage;
	}
	public void setCimage(String cimage) {
		this.cimage = cimage;
	}
	public String getCcontent() {
		return ccontent;
	}
	public void setCcontent(String ccontent) {
		this.ccontent = ccontent;
	}
	public String getInputdate() {
		return inputdate;
	}
	public void setInputdate(String inputdate) {
		this.inputdate = inputdate;
	}
	
	
}
