package personalQuestion.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

import personalQuestion.model.PersonalQuestionBean;
import personalQuestion.model.PersonalQuestionDao;

@Controller
public class personalQuestionAnswerController {

	private final String command = "goAnswer.pq";
	private final String getPage = "/pqAnswerForm";
	private final String gotoPage = "redirect:/list.pq";
	
	@Autowired
	PersonalQuestionDao pqdao;
	
	@RequestMapping(command)
	public String goAnswer(@RequestParam("pnum") String pnum,Model model) {
		
		PersonalQuestionBean pqbean = pqdao.selectQuestion(pnum);
		model.addAttribute("pqbean", pqbean);
		
		return getPage;
	}
	
	@RequestMapping(value=command,method = RequestMethod.POST)
	public String goUpdateAnswer(PersonalQuestionBean pqbean) {
		
		pqdao.updateAnswer(pqbean);
		return gotoPage;
	}
}
