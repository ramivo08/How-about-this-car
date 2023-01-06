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
public class MemberFindIdController {
	
	private final String command = "findid.mem";
	private final String getPage = "/findid";

	@Autowired
	private MemberDao memberDao;
	
	@RequestMapping(value = command, method=RequestMethod.GET)
	public String findid() {
		return getPage;
	}
	
	@RequestMapping(value = command, method=RequestMethod.POST)
	public String findid2(
			@ModelAttribute("member") @Valid MemberBean member,
			BindingResult  result,
			HttpServletResponse response
			) throws IOException {
		
		//alert 내보내는데 한글처리
		response.setContentType("text/html; charset=UTF-8");
				
		MemberBean mb = memberDao.searchIdByBean(member);
		PrintWriter out = response.getWriter();
		// 가입된 아이디가 없으면
		if(mb == null) {
			out.print("<script>alert('등록되지 않은 계정입니다.'); history.back(-1);</script>");
			out.close();
		
		}
		else {
			sendEmail(mb, "findpw");
			
			out.print("<script>alert('이메일로 아이디를 발송하였습니다.'); location.href='login.mem'</script>");
			out.close();
			
		}
		
		return getPage;
	}
	
	
	public void sendEmail(MemberBean mbean, String div ) {
		// Mail Server 설정
		String charSet = "utf-8";
		String hostSMTP = "smtp.gmail.com"; //네이버 smtp.naver.com //smtp.gmail.com
		String hostSMTPid = "2carwhere";
		String hostSMTPpwd = "behllwyqgfsiamov";
		
		// 보내는 사람 EMail, 제목, 내용
		String fromEmail = "2carwhere@gmail.com";
		String fromName = "Minha_Song";
		String subject = "";
		String msg = "";
		
		if(div.equals("findpw")) {
			subject = "이차어때 회원님 아이디 입니다.";
			msg += "<div align='center' style='font-family:verdana'>";
			msg += "<h2><p> 안녕하세요. <br>";
			msg += mbean.getName() + "님의 아이디 정보 입니다.</p></h2>";
			msg += "<p style='font-size : 18px;'> 이차어때 아이디 : ";
			msg += mbean.getId() + "</p></div>";
		}
		
		System.out.println("구글메일 PW: "+hostSMTPpwd);
		
		// 받는 사람 E-Mail 주소
		String mail = mbean.getEmail();
		try {
			HtmlEmail email = new HtmlEmail();
			email.setDebug(true);
			email.setCharset(charSet);
			email.setSSLOnConnect(true);
			email.setHostName(hostSMTP);
			email.setSmtpPort(465); //네이버 587 // 구글 465
			
			email.setAuthentication(hostSMTPid, hostSMTPpwd);
			email.addTo(mail, charSet);
			email.setFrom("2carwhere@gmail.com",fromName);
			email.setSubject(subject);
			email.setHtmlMsg(msg);
			email.send();
		} catch (Exception e) {
			System.out.println("메일발송 실패 : " + e);
		}
	}
	 
	
}
