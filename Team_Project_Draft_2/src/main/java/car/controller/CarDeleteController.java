package car.controller;

import java.io.File;
import java.io.IOException;
import java.util.List;
import java.util.StringTokenizer;

import javax.servlet.ServletContext;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;

import car.model.CarBean;
import car.model.CarDao;

@Controller
public class CarDeleteController {

	private final String command= "myCarDelete.ca";
	private final String getPage= "redirect:/myCarList.ca";

	@Autowired
	CarDao cdao;
	
	@Autowired
	ServletContext sc;
	
	@RequestMapping(command)
	public String deleteCar(@RequestParam(value="pageNumber",required = false) String pageNumber,@RequestParam("cnum") String cnum) {
		
		System.out.println("cnum : " + cnum);
		String deletePath = sc.getRealPath("/resources/images/"); // 실제 이미지 파일이 들어있는 경로
		CarBean cb = cdao.myCarDetail(cnum);
		String images = cb.getCimage();
		System.out.println("이미지 파일 경로 : " + deletePath);

		String []tokens=images.split(",");
		
		for(int i = 0;i<tokens.length;i++) {
			
			File file = new File(deletePath + tokens[i]);
			
			if (file.exists()) {
				if (file.delete()) {
					System.out.println(i+ "번 이미지 삭제 성공");
				} else {
					System.out.println(i+ "번이미지 삭제 실패");
				}
			} else {
				System.out.println("이미지 파일이 존재하지 않음");
			}
		}
		
		
		cdao.deleteCar(cnum);	
	
	
		return getPage + "?pageNumber=" + pageNumber;
	}
}

/*
 * List<MultipartFile> fileList = mtfRequest.getFiles("upload");
 * 
 * String uploadPath = sc.getRealPath("/resources/images");
 * 
 * for (MultipartFile mf : fileList) { String originFileName =
 * mf.getOriginalFilename(); // 원본 파일 명
 * 
 * System.out.println("originFileName : " + originFileName);
 * 
 * String safeFile = uploadPath + "/" + originFileName; try { mf.transferTo(new
 * File(safeFile)); } catch (IllegalStateException e) { // TODO Auto-generated
 * catch block e.printStackTrace(); } catch (IOException e) { // TODO
 * Auto-generated catch block e.printStackTrace(); } }
 */
