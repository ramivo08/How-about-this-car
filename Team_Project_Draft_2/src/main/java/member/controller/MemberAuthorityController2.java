package member.controller;

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
import member.model.MemberDao;
import requestAuthority.model.requestAuthorityDao;

@Controller
public class MemberAuthorityController2 {
	public final String command="authority2.mem";
	public String getPage="redirect:/list.mem";
	
	@Autowired
	private MemberDao memberDao;
	
	@Autowired(required = false)
	requestAuthorityDao radao;
	
	@RequestMapping(value=command, method=RequestMethod.POST)
	public String authority(
							@RequestParam(value="authority",required = false) int authority,
							@RequestParam(value="id",required = false) String id,
						 @RequestParam(value="pageNumber",required = false) String pageNumber,
						 Model model, HttpServletResponse response, HttpSession session) throws IOException {

		
			if(authority == 1){
				memberDao.authorityMember2(id);
				radao.deleteByID(id);
				MemberBean mb = memberDao.getMember(id);
				
		
			
			}else if(authority == 0){
				response.setContentType("text/html; charset=UTF-8");
				PrintWriter writer = response.getWriter();
				writer.println("<script type='text/javascript'>");
				writer.println("alert('권한을 가지고 있지 않습니다'); history.go(-1);");
				writer.println("</script>");
				writer.flush();
				
			}return getPage+"?pageNumber="+pageNumber;
			
	}


}
