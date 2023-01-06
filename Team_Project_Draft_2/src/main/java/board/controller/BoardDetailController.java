package board.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import board.model.BoardBean;
import board.model.BoardDao;

@Controller
public class BoardDetailController {

	private final String command = "detail.bd";
	private String getPage ="/boardDetail";
	
	@Autowired
	private BoardDao boardDao;
	
	@RequestMapping(command)
	public String detail(@RequestParam(value="bnum") String bnum,
						@RequestParam(value="pageNumber") String pageNumber,
						Model model	
					) {
		
		boardDao.boardCount(bnum);
		BoardBean board = boardDao.getBoard(bnum);
		
		
		String image = board.getImage();
		System.out.println("image : " + image);
		model.addAttribute("image", image);
		
		model.addAttribute("pageNumber", pageNumber);
		model.addAttribute("bd", board);
		
		return getPage;
		
	}
	
}
