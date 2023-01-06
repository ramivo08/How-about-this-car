package board.controller;

import java.io.File;
import java.io.IOException;
import java.util.UUID;

import javax.servlet.ServletContext;
import javax.validation.Valid;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;

import board.model.BoardBean;
import board.model.BoardDao;

@Controller
public class BoardUpdateController {

	private final String command ="/update.bd";
	private String getPage="/boardUpdate";
	private String gotoPage="redirect:/list.bd";
	
	@Autowired
	private BoardDao boardDao;
	
	@Autowired
	ServletContext servletContext;
	
	@RequestMapping(value=command, method=RequestMethod.GET)
	public String update(@RequestParam(value="bnum" , required=false) String bnum,
						@RequestParam(value="pageNumber" , required= false) String pageNumber,
						Model model
						) {
		BoardBean board = boardDao. getBoard(bnum);
		model.addAttribute("bd", board);
		model.addAttribute("pageNumber", pageNumber);
		return getPage;
	}
	
	@RequestMapping(value=command,method=RequestMethod.POST)
	public String goUpdate(@ModelAttribute("bb") @Valid BoardBean bb, 
			BindingResult result,@RequestParam(value="pageNumber",required=false) String pageNumber,
			Model model
			) {

		String deletePath = servletContext.getRealPath("/resources/images/"); 
		File file = new File(deletePath + bb.getImage()); 
		
		UUID uuid = UUID.randomUUID();
		String uuidName = uuid.toString()+"_";
		
		if(result.hasErrors()) {
			model.addAttribute("pageNumber",pageNumber); 
			System.out.println(result.getErrorCount());
			return getPage;
		}
		
		System.out.println("이미지 파일 경로 : " + deletePath);
		if (file.exists()) {
			if (file.delete()) {
				System.out.println("이미지 삭제 성공");
			} else {
				System.out.println("이미지 삭제 실패");
			}
		} else {
			System.out.println("이미지 파일이 존재하지 않음");
		}
		
		MultipartFile multi = bb.getUpload(); 
		String uploadPath = servletContext.getRealPath("/resources");
		File uploadFile = new File(uploadPath + "/" + uuidName+multi.getOriginalFilename());
		try {
			multi.transferTo(uploadFile);
		} catch (IllegalStateException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} catch (IOException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		String realName=uuidName+multi.getOriginalFilename();
		System.out.println(realName);
		bb.setImage(realName);
		boardDao.updateBoard(bb);

		return gotoPage+"?pageNumber="+pageNumber;
	}
}
	

