package member.controller;


 
import java.io.IOException;
import java.io.PrintWriter;
import java.util.List;

import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import javax.validation.Valid;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

import car.controller.CarDeleteController;
import car.model.CarBean;
import car.model.CarDao;
import member.model.MemberBean;
import member.model.MemberDao;

@Controller
public class MemberDeleteController {

	private final String command = "delete.mem";
	private final String command2 = "deleteAll.mem";
	private String getPage = "redirect:/list.mem";
	private String getPage2 = "redirect:/main.mem";
	
	@Autowired
	private MemberDao memberDao;
	
	@Autowired(required = false)
	private CarDeleteController cdc;
	
	@Autowired
	private CarDao cdao;
	
	@RequestMapping(value = command,method=RequestMethod.GET)
	public String delete(@RequestParam(value="num",required = false) String num,
			@RequestParam(value="pageNumber",required = false) String pageNumber) {
		
		
		memberDao.deleteMember(num);
		return getPage+"?pageNumber="+pageNumber;
		
		
	}
	@RequestMapping(value = command2)
	public String deleteAll(@RequestParam(value="num",required = false) String num,HttpSession session,HttpServletResponse response) throws IOException {
		
		MemberBean mb = memberDao.selectMember(num);
		
		
		if(mb.getAuthority() == 1) {
			
			List<CarBean> cnumLists = cdao.selectCnumById(mb.getId());
			
			for(CarBean cb : cnumLists) {
				cdc.deleteCar(null, String.valueOf(cb.getCnum()));
			}
		}
		
		memberDao.deleteMember(num);
		session.invalidate();
		
		
		return getPage2;
		
		
	}
}