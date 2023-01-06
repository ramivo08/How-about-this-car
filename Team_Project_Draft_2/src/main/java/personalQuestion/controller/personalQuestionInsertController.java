package personalQuestion.controller;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

import car.model.CarBean;
import car.model.CarDao;
import member.model.MemberBean;
import personalQuestion.model.PersonalQuestionBean;
import personalQuestion.model.PersonalQuestionDao;

@Controller
public class personalQuestionInsertController {

	private final String command = "insertpq.pq";
	private final String gotoPage = "/pqWriteForm";
	private final String getPage = "redirect:/list.pq";
	
	@Autowired
	PersonalQuestionDao pqdao;
	
	@Autowired
	@Qualifier("MyCarDao")
	CarDao cdao;
	
	@RequestMapping(value=command, method=RequestMethod.GET)
	public String insertpqForm(@RequestParam("cnum") String cnum,Model model,HttpServletResponse response, HttpSession session) throws IOException {
		System.out.println("cnum : " + cnum);
		
		response.setContentType("text/html; charset=UTF-8");
		PrintWriter out = response.getWriter();
		
		MemberBean mb = (MemberBean)session.getAttribute("loginInfo");
		if(mb == null) {
			out.println("<script>"+"alert('로그인 후 이용해주세요.');"+"history.go(-1);"
					+ "</script>");
			out.flush();
			return null;
		}
		
		CarBean cb = cdao.myCarDetail(cnum);
		
		model.addAttribute("cb", cb);
		return gotoPage;
	}
	
	@RequestMapping(value=command, method=RequestMethod.POST)
	public String insertpq(PersonalQuestionBean pqbean,HttpServletResponse response, HttpSession session) throws IOException {
	
		System.out.println("sellerID : " + pqbean.getSeller_id());
		System.out.println("buyerID : " + pqbean.getBuyer_id());
		System.out.println("buyerName : " + pqbean.getBuyer_name());
		System.out.println("title : " + pqbean.getPtitle());
		System.out.println("contents : " + pqbean.getPcontents());
		System.out.println("carInfo : " + pqbean.getCarInfo());
	
		response.setContentType("text/html; charset=UTF-8");
		PrintWriter out = response.getWriter();
		
		
		
		pqdao.insertPQ(pqbean);
		
		out.println("<script>"+"alert('등록이 완료되었습니다.');"+"history.go(-2);"
				+ "</script>");
		out.flush();
		
		
		return null;
	}
}
