package board.controller;

import java.io.File;
import java.io.IOException;
import java.sql.Timestamp;
import java.util.UUID;

import javax.servlet.ServletContext;
import javax.servlet.http.HttpServletRequest;
import javax.validation.Valid;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.ModelAndView;

import board.model.BoardBean;
import board.model.BoardDao;

@Controller
public class BoardWriteController {

		private final String command ="write.bd";
		private String getPage="/boardWrite";
		private String gotoPage="redirect:/list.bd";
		
		@Autowired
		private BoardDao boardDao;
		
		@Autowired
		ServletContext servletContext;
		
		@RequestMapping(value=command, method=RequestMethod.GET)
		public String write() {
			return getPage;
		}
		@RequestMapping(value=command, method= RequestMethod.POST)
		public ModelAndView write(@ModelAttribute("board") @Valid BoardBean board , BindingResult result,
				HttpServletRequest request
									) {
			ModelAndView mav = new ModelAndView();
			Timestamp inputdate = new Timestamp(System.currentTimeMillis());
			board.setInputdate(inputdate); 
			
			String uploadPath = servletContext.getRealPath("/resources");
			
			MultipartFile multi = board.getUpload();
			
			UUID uuid = UUID.randomUUID();
			String uuidName = uuid.toString()+"_";
			
			if(result.hasErrors()) {
				mav.setViewName(getPage);
				System.out.println(result.getErrorCount());
				return mav;
			}
			String realName=uuidName+multi.getOriginalFilename();
			System.out.println(realName);
			board.setImage(realName);
			int cnt =boardDao.writeBoard(board);
			if(cnt>0) {
				File file = new File(uploadPath+"/"+uuidName+multi.getOriginalFilename());
				System.out.println(uploadPath+"/"+uuidName+multi.getOriginalFilename());
				try {
					multi.transferTo(file);//파일올리는 메서드
					
				} catch (IllegalStateException e) {
					// TODO Auto-generated catch block
					e.printStackTrace();
					System.out.println("이미지삽입 오류1");
				} catch (IOException e) {
					// TODO Auto-generated catch block
					e.printStackTrace();
					System.out.println("이미지삽입 오류2");
				}
				
				mav.setViewName(gotoPage);
				
			}
			else {
				mav.setViewName(getPage);
			}
			return mav;
			
		}
	
}
