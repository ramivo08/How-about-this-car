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
		//alert �������µ� �ѱ�ó��
		response.setContentType("text/html; charset=UTF-8");
		
	/*	System.out.println("īī���α���");
		System.out.println("īī���̸� : "+name);
		System.out.println("īī���̸��� : "+email);
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
		
		PrintWriter writer = response.getWriter(); // ����ó���ؾ���
		
		MemberBean login = memberDao.getMember(member.getId());
		
		//if(kakaoid == login) {}
		
		if(login == null) {
			System.out.println("�������� ���� ȸ��");
			writer.println("<script> alert('�������� ���� ȸ���Դϴ�'); </script>");
			writer.flush();
			return getPage;
		}
		else {
			if(member.getPw().equals(login.getPw())) {
				System.out.println("������ ȸ��");
				session.setAttribute("loginInfo", login); //login �ȿ� �ִ� ��� ������ ������
				Object destination = session.getAttribute("destination");
				if (destination != null) {
					// �������� ������ ä�� �α����� �õ��ϴ� ��� �������� �̵�
					return destination.toString();
				} else {
					// �Ϲ����� �α��� �õ��� ��� ������������ �̵�
					return gotoPage;
				}
			}
			else { //����� ��ġ���� ������
				writer.println("<script> alert('��й�ȣ�� ��ġ���� �ʽ��ϴ�'); </script>");
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
