package faq.model;

import java.sql.Timestamp;

import org.hibernate.validator.constraints.NotBlank;

public class FaqBean {
	private int fnum; 
	@NotBlank(message= "������ �Է��ϼ���")
	private String ftitle; 
	private String fwriter;// ���� �ʿ����� �ʴ�.
	@NotBlank(message= "������ �Է��ϼ���")
	private String fcontent;
	private Timestamp finputdate; // ���� �ʿ����� �ʴ�.
	
	public FaqBean() {
		
	}
	public int getFnum() {
		return fnum;
	}
	public void setFnum(int fnum) {
		this.fnum = fnum;
	}
	public String getFtitle() {
		return ftitle;
	}
	public void setFtitle(String ftitle) {
		this.ftitle = ftitle;
	}
	public String getFwriter() {
		return fwriter;
	}
	public void setFwriter(String fwriter) {
		this.fwriter = fwriter;
	}
	public String getFcontent() {
		return fcontent;
	}
	public void setFcontent(String fcontent) {
		this.fcontent = fcontent;
	}
	public Timestamp getFinputdate() {
		return finputdate;
	}
	public void setFinputdate(Timestamp finputdate) {
		this.finputdate = finputdate;
	}
		
}
