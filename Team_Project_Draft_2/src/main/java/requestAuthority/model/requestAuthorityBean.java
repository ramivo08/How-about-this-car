package requestAuthority.model;

import javax.validation.constraints.Pattern;

import org.hibernate.validator.constraints.NotBlank;
import org.springframework.web.multipart.MultipartFile;

public class requestAuthorityBean {

	private String id;
	@NotBlank(message = "대표명 등록은 필수 입니다.")
	private String name;
	@NotBlank(message = "회사명 등록은 필수 입니다.")
	private String company;
	@NotBlank(message = "구분 등록은 필수 입니다.")
	private String kind;
	@NotBlank(message = "사진 등록은 필수 입니다.")
	private String evidence;
	
	
	private String registrationno;
	@NotBlank(message = "반드시 입력이 필요합니다.")
	@Pattern(regexp = "^([0-9]{3})$", message = "첫번째 사업자 등록 번호가 잘못되었습니다.")
	private String registrationno1;
	@NotBlank(message = "반드시 입력이 필요합니다.")
	@Pattern(regexp = "^([0-9]{2})$", message = "두번째 사업자 등록 번호가 잘못되었습니다.")
	private String registrationno2;
	@NotBlank(message = "반드시 입력이 필요합니다.")
	@Pattern(regexp = "^([0-9]{5})$", message = "세번째 사업자 등록 번호가 잘못되었습니다.")
	private String registrationno3;
	@NotBlank(message = "주소 입력이 필요합니다.")
	private String com_add;
	@NotBlank(message = "번호 입력이 필요합니다.")
	@Pattern(regexp ="^(01[01346-9])-?([1-9]{1}[0-9]{2,3})-?([0-9]{4})$", message = "'-'을 이용해서 입력해주세요. 또한 숫자와 '-' 이외에는 넣을 수 없습니다.")
	private String hp;
	private int status;
	
	
	private MultipartFile upload;
	
	
	public String getCompany() {
		return company;
	}
	public void setCompany(String company) {
		this.company = company;
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
		System.out.println("setUpload : " + upload); // 객체형태로 됨
		this.evidence = upload.getOriginalFilename();
	}
	public String getRegistrationno1() {
		return registrationno1;
	}
	public void setRegistrationno1(String registrationno1) {
		this.registrationno1 = registrationno1;
	}
	public String getRegistrationno2() {
		return registrationno2;
	}
	public void setRegistrationno2(String registrationno2) {
		this.registrationno2 = registrationno2;
	}
	public String getRegistrationno3() {
		return registrationno3;
	}
	public void setRegistrationno3(String registrationno3) {
		this.registrationno3 = registrationno3;
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
	public String getKind() {
		return kind;
	}
	public void setKind(String kind) {
		this.kind = kind;
	}
	public String getEvidence() {
		return evidence;
	}
	public void setEvidence(String evidence) {
		this.evidence = evidence;
	}
	public String getRegistrationno() {
		return registrationno;
	}
	public void setRegistrationno(String registrationno) {
		this.registrationno = registrationno;
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
	
	
}
