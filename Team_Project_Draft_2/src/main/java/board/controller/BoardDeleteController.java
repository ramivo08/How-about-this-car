package board.controller;
import java.io.File;

import javax.servlet.ServletContext;
import javax.servlet.http.HttpServletResponse;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import board.model.BoardBean;
import board.model.BoardDao;

@Controller
public class BoardDeleteController {
	public final String command = "delete.bd";
	public String getPage = "redirect:/list.bd";

	@Autowired
	private BoardDao boardDao;

	@Autowired
	ServletContext servletContext; 

	@RequestMapping(command)
	public String goDelete(@RequestParam("bnum") String bnum, 
			@RequestParam("pageNumber") String pageNumber,
			Model model, HttpServletResponse response) {

		BoardBean board = boardDao.getBoard(bnum);

		String deletePath = servletContext.getRealPath("/resources"); 
		File file = new File(deletePath + board.getImage());
		file.delete();
		if (file.exists()) {
			if (file.delete()) {
				System.out.println("이미지 삭제 성공");
			} else {
				System.out.println("이미지 삭제 실패");
			}
		} else {
			System.out.println("이미지 파일이 존재하지 않음");
		}
		boardDao.deleteBoard(bnum);
		
		model.addAttribute("bnum", bnum);
		model.addAttribute("pageNumber", pageNumber);

		return getPage;
	}
}

