package member.controller;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

import member.model.MemberBean;
import member.model.MemberDao;

@Controller
public class MemberLoginController {
	
	private final String command = "/login.mem";
	private final String logout = "/logout.mem";
	private final String getPage = "/login";
	private final String gotoPage = "redirect:/main.mem";
	
	@Autowired
	private MemberDao memberDao;
	
	@RequestMapping(value = command, method=RequestMethod.GET)
	public String login() {
		return getPage;
	}
	
	@RequestMapping(value = command, method=RequestMethod.POST)
	public String login(
			MemberBean member,
			HttpServletResponse response,HttpServletRequest request,
			HttpSession session
			/*@RequestParam("name") String name,
			@RequestParam("email") String email*/
			) throws IOException {
		//alert 내보내는데 한글처리
		response.setContentType("text/html; charset=UTF-8");
		
	/*	System.out.println("카카오로그인");
		System.out.println("카카오이름 : "+name);
		System.out.println("카카오이메일 : "+email);
		*/
		//String kakaoid = request.getParameter("email"); //kakao
		//member.setId(email); //kakao
		
		//if() {
		//	
		//}
		//else{
		//	
		//}
		
		//MemberBean mb =  memberDao.getKakaoinsert(member.setId(email));
		
		PrintWriter writer = response.getWriter(); // 예외처리해야함
		
		MemberBean login = memberDao.getMember(member.getId());
		
		//if(kakaoid == login) {}
		
		if(login == null) {
			System.out.println("가입하지 않은 회원");
			writer.println("<script> alert('가입하지 않은 회원입니다'); </script>");
			writer.flush();
			return getPage;
		}
		else {
			if(member.getPw().equals(login.getPw())) {
				System.out.println("가입한 회원");
				session.setAttribute("loginInfo", login); //login 안에 있는 모든 정보를 가져옴
				Object destination = session.getAttribute("destination");
				if (destination != null) {
					// 목적지가 정해진 채로 로그인을 시도하는 경우 목적지로 이동
					return destination.toString();
				} else {
					// 일반적인 로그인 시도의 경우 메인페이지로 이동
					return gotoPage;
				}
			}
			else { //비번이 일치하지 않을때
				writer.println("<script> alert('비밀번호가 일치하지 않습니다'); </script>");
				writer.flush();
				return getPage;
			}
		}
	}

	
	@RequestMapping(logout)
	public String logout(HttpSession session) {
		session.invalidate();
		
		return gotoPage;
	}
}
