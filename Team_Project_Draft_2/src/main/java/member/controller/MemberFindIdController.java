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
		
		//alert �������µ� �ѱ�ó��
		response.setContentType("text/html; charset=UTF-8");
				
		MemberBean mb = memberDao.searchIdByBean(member);
		PrintWriter out = response.getWriter();
		// ���Ե� ���̵� ������
		if(mb == null) {
			out.print("<script>alert('��ϵ��� ���� �����Դϴ�.'); history.back(-1);</script>");
			out.close();
		
		}
		else {
			sendEmail(mb, "findpw");
			
			out.print("<script>alert('�̸��Ϸ� ���̵� �߼��Ͽ����ϴ�.'); location.href='login.mem'</script>");
			out.close();
			
		}
		
		return getPage;
	}
	
	
	public void sendEmail(MemberBean mbean, String div ) {
		// Mail Server ����
		String charSet = "utf-8";
		String hostSMTP = "smtp.gmail.com"; //���̹� smtp.naver.com //smtp.gmail.com
		String hostSMTPid = "2carwhere";
		String hostSMTPpwd = "behllwyqgfsiamov";
		
		// ������ ��� EMail, ����, ����
		String fromEmail = "2carwhere@gmail.com";
		String fromName = "Minha_Song";
		String subject = "";
		String msg = "";
		
		if(div.equals("findpw")) {
			subject = "����� ȸ���� ���̵� �Դϴ�.";
			msg += "<div align='center' style='font-family:verdana'>";
			msg += "<h2><p> �ȳ��ϼ���. <br>";
			msg += mbean.getName() + "���� ���̵� ���� �Դϴ�.</p></h2>";
			msg += "<p style='font-size : 18px;'> ����� ���̵� : ";
			msg += mbean.getId() + "</p></div>";
		}
		
		System.out.println("���۸��� PW: "+hostSMTPpwd);
		
		// �޴� ��� E-Mail �ּ�
		String mail = mbean.getEmail();
		try {
			HtmlEmail email = new HtmlEmail();
			email.setDebug(true);
			email.setCharset(charSet);
			email.setSSLOnConnect(true);
			email.setHostName(hostSMTP);
			email.setSmtpPort(465); //���̹� 587 // ���� 465
			
			email.setAuthentication(hostSMTPid, hostSMTPpwd);
			email.addTo(mail, charSet);
			email.setFrom("2carwhere@gmail.com",fromName);
			email.setSubject(subject);
			email.setHtmlMsg(msg);
			email.send();
		} catch (Exception e) {
			System.out.println("���Ϲ߼� ���� : " + e);
		}
	}
	 
	
}
