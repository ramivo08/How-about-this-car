package personalQuestion.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import personalQuestion.model.PersonalQuestionDao;

@Controller
public class personalQuestionDeleteController {
	private final String command = "deletePQ.pq";
	private final String gotoPage = "redirect:/myList.pq";
	
	@Autowired
	PersonalQuestionDao pqdao;
	
	@RequestMapping(command)
	public String deletePQ(@RequestParam("pnum") String pnum) {
		
		pqdao.deletePQ(pnum);
		
		return gotoPage;
	}
	
}
