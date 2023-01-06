package review.controller;

import java.io.File;
import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletContext;
import javax.servlet.http.HttpServletResponse;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

import review.model.ReviewboardBean;
import review.model.ReviewboardDao;

@Controller
public class ReviewboardDeleteController {
	
	private final String command ="delete.reb";
	private String getPage ="/reviewboardDelete";
	private String gotoPage="redirect:/list.reb";
	
	@Autowired
	private ReviewboardDao reviewboardDao;
	
	@Autowired
	ServletContext servletContext;
	
	@RequestMapping(value=command, method=RequestMethod.GET)
	public String deleteform(
			@RequestParam(value="rnum" , required=true) String rnum,
			@RequestParam(value="pageNumber", required=true) String pageNumber,
			Model model) {
		
		model.addAttribute("rnum", rnum);
		model.addAttribute("pageNumber", pageNumber);
		
		return getPage;
		
	}
	
	@RequestMapping(value=command, method=RequestMethod.POST)
	public String delete(@RequestParam(value="rnum" , required=true) String rnum,
						@RequestParam(value="pageNumber", required=true) String pageNumber,
						@RequestParam(value="repw" , required=true) String repw,
						Model model, HttpServletResponse response
				) {
		
		System.out.println("delete rnum:"+rnum);
		System.out.println("delete pw:"+repw);
		
		response.setContentType("text/html; charset=UTF-8");
		
		ReviewboardBean rb = reviewboardDao.getRnum(rnum);
		
		if(rb.getRepw().equals(repw)) {
			
			String deletePath = servletContext.getRealPath("/resources/img");
		
			System.out.println("deletePath: "+deletePath);
		
		File delFile = new File(deletePath+"/"+rb.getRimage()); //경로와 지우려는 파일명
		delFile.delete();//진짜 메서드 삭제
		
		int cnt = reviewboardDao.BoardDelete(rnum);
		
		return gotoPage+"?pageNumber="+pageNumber;
		}
		else {
			try {
				PrintWriter writer = response.getWriter();
				writer.println("<script type='text/javascript'>");
				writer.println("alert('비번 일치하지 않습니다.');");
				writer.println("</script>");
				writer.flush();
				
			} catch (IOException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
			
			model.addAttribute("rnum", rnum);
			model.addAttribute("pageNumber", pageNumber);
			return getPage;
		}	
	}
	
}
