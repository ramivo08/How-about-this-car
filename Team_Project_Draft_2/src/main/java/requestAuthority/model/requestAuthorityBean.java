package requestAuthority.model;

import javax.validation.constraints.Pattern;

import org.hibernate.validator.constraints.NotBlank;
import org.springframework.web.multipart.MultipartFile;

public class requestAuthorityBean {

	private String id;
	@NotBlank(message = "��ǥ�� ����� �ʼ� �Դϴ�.")
	private String name;
	@NotBlank(message = "ȸ��� ����� �ʼ� �Դϴ�.")
	private String company;
	@NotBlank(message = "���� ����� �ʼ� �Դϴ�.")
	private String kind;
	@NotBlank(message = "���� ����� �ʼ� �Դϴ�.")
	private String evidence;
	
	
	private String registrationno;
	@NotBlank(message = "�ݵ�� �Է��� �ʿ��մϴ�.")
	@Pattern(regexp = "^([0-9]{3})$", message = "ù��° ����� ��� ��ȣ�� �߸��Ǿ����ϴ�.")
	private String registrationno1;
	@NotBlank(message = "�ݵ�� �Է��� �ʿ��մϴ�.")
	@Pattern(regexp = "^([0-9]{2})$", message = "�ι�° ����� ��� ��ȣ�� �߸��Ǿ����ϴ�.")
	private String registrationno2;
	@NotBlank(message = "�ݵ�� �Է��� �ʿ��մϴ�.")
	@Pattern(regexp = "^([0-9]{5})$", message = "����° ����� ��� ��ȣ�� �߸��Ǿ����ϴ�.")
	private String registrationno3;
	@NotBlank(message = "�ּ� �Է��� �ʿ��մϴ�.")
	private String com_add;
	@NotBlank(message = "��ȣ �Է��� �ʿ��մϴ�.")
	@Pattern(regexp ="^(01[01346-9])-?([1-9]{1}[0-9]{2,3})-?([0-9]{4})$", message = "'-'�� �̿��ؼ� �Է����ּ���. ���� ���ڿ� '-' �̿ܿ��� ���� �� �����ϴ�.")
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
		System.out.println("setUpload : " + upload); // ��ü���·� ��
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
