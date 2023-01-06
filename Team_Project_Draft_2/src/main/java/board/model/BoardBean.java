package board.model;




import java.sql.Timestamp;

import org.hibernate.validator.constraints.NotBlank;
import org.hibernate.validator.constraints.NotEmpty;
import org.springframework.web.multipart.MultipartFile;

public class BoardBean {
	public int bnum;
	@NotBlank(message="제목을 입력하세요")
	public String title;
	public String writer;
	@NotBlank(message= "카테고리를 선택 하세요")
	public String cgview;
	@NotEmpty(message= "사진 선택 안함")
	public String image;
	@NotBlank(message="내용을 입력하세요")
	public String content;
	public Timestamp inputdate;
	public int count;
	private MultipartFile upload;	
	
	
	public MultipartFile getUpload() {
		return upload;
	}
	public void setUpload(MultipartFile upload) {
		this.upload = upload;
		this.image=upload.getOriginalFilename();
	}
	
	public int getCount() {
		return count;
	}
	public void setCount(int count) {
		this.count = count;
	}
	public int getBnum() {
		return bnum;
	}
	public void setBnum(int bnum) {
		this.bnum = bnum;
	}
	public String getTitle() {
		return title;
	}
	public void setTitle(String title) {
		this.title = title;
	}
	public String getWriter() {
		return writer;
	}
	public void setWriter(String writer) {
		this.writer = writer;
	}
	public String getCgview() {
		return cgview;
	}
	public void setCgview(String cgview) {
		this.cgview = cgview;
	}
	public String getImage() {
		return image;
	}
	public void setImage(String image) {
		this.image = image;
	}
	public String getContent() {
		return content;
	}
	public void setContent(String content) {
		this.content = content;
	}
	public Timestamp getInputdate() {
		return inputdate;
	}
	public void setInputdate(Timestamp inputdate) {
		this.inputdate = inputdate;
	}

	 
}
