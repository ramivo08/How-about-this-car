package review.model;

import java.sql.Timestamp;

import org.hibernate.validator.constraints.NotBlank;
import org.hibernate.validator.constraints.NotEmpty;
import org.springframework.web.multipart.MultipartFile;

public class ReviewboardBean {
	private int rnum;
	private String rid;
	private String rname;
	
	@NotBlank(message="제목을 입력하세요")
	private String rtitle;
	
	@NotBlank(message="내용 입력해주세요")
	private String rcontents;
	private String rimage;
	private Timestamp r_day;
	
	@NotEmpty(message="비밀번호 입력하세요")
	private String repw;
	private int ref;
	private int re_step;
	private int re_level;
	private String carname;
	private int asterion;
	private int rcount;
	
	private MultipartFile upload;

	public int getRnum() {
		return rnum;
	}

	public void setRnum(int rnum) {
		this.rnum = rnum;
	}

	public String getRid() {
		return rid;
	}

	public void setRid(String rid) {
		this.rid = rid;
	}

	public String getRname() {
		return rname;
	}

	public void setRname(String rname) {
		this.rname = rname;
	}

	public String getRtitle() {
		return rtitle;
	}

	public void setRtitle(String rtitle) {
		this.rtitle = rtitle;
	}

	public String getRcontents() {
		return rcontents;
	}

	public void setRcontents(String rcontents) {
		this.rcontents = rcontents;
	}

	public String getRimage() {
		return rimage;
	}

	public void setRimage(String rimage) {
		this.rimage = rimage;
	}

	public Timestamp getR_day() {
		return r_day;
	}

	public void setR_day(Timestamp r_day) {
		this.r_day = r_day;
	}

	public String getRepw() {
		return repw;
	}

	public void setRepw(String repw) {
		this.repw = repw;
	}

	public int getRef() {
		return ref;
	}

	public void setRef(int ref) {
		this.ref = ref;
	}

	public int getRe_step() {
		return re_step;
	}

	public void setRe_step(int re_step) {
		this.re_step = re_step;
	}

	public int getRe_level() {
		return re_level;
	}

	public void setRe_level(int re_level) {
		this.re_level = re_level;
	}
	
	public String getCarname() {
		return carname;
	}

	public void setCarname(String carname) {
		this.carname = carname;
	}

	public int getAsterion() {
		return asterion;
	}

	public void setAsterion(int asterion) {
		this.asterion = asterion;
	}

	public int getRcount() {
		return rcount;
	}

	public void setRcount(int rcount) {
		this.rcount = rcount;
	}

	public MultipartFile getUpload() {
		return upload;
	}

	public void setUpload(MultipartFile upload) {
		this.upload = upload;
		System.out.println("setUpload:"+upload);
		System.out.println("upload.getName:"+upload.getName());
		System.out.println("upload.getOriginalFilename():"+upload.getOriginalFilename());
		
		this.rimage=upload.getOriginalFilename();
	}
	
	
	
	
}
