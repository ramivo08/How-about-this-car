package car.controller;



import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

import member.model.MemberBean;
import requestAuthority.model.requestAuthorityBean;
import requestAuthority.model.requestAuthorityDao;

@Controller
public class CarMyPageController {

	private final String command = "myPage.ca";
	private final String getPage = "/myPage";
	private final String gotoPage = "/myPageDetail";
	
	@Autowired(required = false)
	requestAuthorityDao radao;
	
	
	@RequestMapping(command)
	public String myPage() {
		
		return getPage;
	}
	@RequestMapping(value=command,method=RequestMethod.POST)
	public String myPageDetail(@RequestParam("password") String password, HttpSession session, HttpServletResponse response, Model model) throws IOException {
		
		 MemberBean mb = (MemberBean)session.getAttribute("loginInfo");
		 String loginInfoPassword = mb.getPw();
		 
		 response.setContentType("text/html; charset=UTF-8");
		 PrintWriter out =
		 response.getWriter();
		 

		  if(loginInfoPassword.equals(password)) { // 비밀번호 일치
			 requestAuthorityBean rabean = radao.getInfoByID(mb.getId());
			 model.addAttribute("rabean", rabean);
			  return gotoPage;
			  }else {// 일치하지 않을 경우 
		out.println("<script>"+"alert('비밀번호가 일치하지 않습니다.');"+
		 "</script>");
		out.flush();
		return getPage;
		}
		
	}
}
