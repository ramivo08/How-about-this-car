package member.controller;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.http.HttpServletResponse;
import javax.validation.Valid;

import org.apache.commons.mail.HtmlEmail;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import member.model.MemberBean;
import member.model.MemberDao;

@Controller
public class MemberFindPwController {
	
	private final String command = "findpw.mem";
	private String getPage = "/findpw";
	
	@Autowired
	private MemberDao memberDao;
	
	@RequestMapping(value = command, method=RequestMethod.GET)
	public String findpw() {
		return getPage;
	}
	
	
	@RequestMapping(value = command, method=RequestMethod.POST)
	public String findpw2(
			@ModelAttribute("member") @Valid MemberBean member,
			BindingResult  result,
			HttpServletResponse response) throws Exception {
		
		response.setContentType("text/html;charset=utf-8");
		
		
		System.out.println("member.getId() : " + member.getId());
		System.out.println("member.getEmail() : " + member.getEmail());
		
		MemberBean mb = memberDao.getMember(member.getId());
		PrintWriter out = response.getWriter();
		
		if(memberDao.pwFindIdCheck(member.getId()) == null) {
			out.print("<script>alert('등록되지 않은 아이디입니다.'); history.back(-1);</script>");
			out.close();
		}
		
		else if(!member.getEmail().equals(mb.getEmail())) {
			out.print("<script>alert('등록되지 않은 이메일입니다.'); history.back(-1);</script>");
			out.close();
			
		}
		else {
			//비밀번호 갖고오기
			String pw = "";
			for (int i = 0; i < 12; i++) {
				pw += (char) ((Math.random() * 26) + 97);
			}
			member.setPw(pw);
			// 비밀번호 변경
			memberDao.updatePw(member);
			
			// 비밀번호 변경 메일 발송
			sendEmail(member, "findpw");
			
			out.print("<script>alert('이메일로 임시 비밀번호를 발송하였습니다.'); location.href='login.mem'</script>");
			out.close();
			
		}
		
		return getPage;
	}


	private void sendEmail(MemberBean member, String div) {
		String charSet = "utf-8";
		String hostSMTP = "smtp.gmail.com"; //네이버 smtp.naver.com //smtp.gmail.com
		String hostSMTPid = "2carwhere";
		String hostSMTPpwd = "behllwyqgfsiamov";
		
		String fromEmail = "2carwhere@gmail.com";
		String fromName = "Minha_Song";
		String subject = "";
		String msg = "";
		
		if(div.equals("findpw")) {
			subject = "이차어때 회원님 임시 비밀번호 발송";
			msg += "<div align='center' font-family:verdana'>";
			msg += "<h2><p> 안녕하세요. <br>";
			msg += member.getId() + "님의 임시 비밀번호 입니다.</h2>";
			msg += "<p> 임시 비밀번호 : ";
			msg += member.getPw() + "</p>";
			msg += "<p>※임시 비밀번호는 시일 내 변경하여 안전하게 계정을 관리하세요.</p></div>";
		}
		
		String mail = member.getEmail();
		try {
			HtmlEmail email = new HtmlEmail();
			email.setDebug(true);
			email.setCharset(charSet);
			email.setSSLOnConnect(true);
			email.setHostName(hostSMTP);
			email.setSmtpPort(465);
			
			email.setAuthentication(hostSMTPid, hostSMTPpwd);
			email.addTo(mail, charSet);
			email.setFrom(fromEmail, fromName);
			email.setSubject(subject);
			email.setHtmlMsg(msg);
			email.send();
		} catch (Exception e) {
			System.out.println("메일발송 실패 : " + e);
		}
		
	}
	
}
