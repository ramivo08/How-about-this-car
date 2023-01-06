package member.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import member.model.MemberDao;

@Controller
public class MemberCheckController {
	
	@Autowired
	private MemberDao memberDao;
	
	private final String command = "id_check_proc.mem";
	
	@RequestMapping(command)
	@ResponseBody // 글자 자체를 넘김
	public String check(
			@RequestParam("inputid") String inputid) {

		int cnt = -1;
		cnt = memberDao.checkId(inputid); //yes:사용가능, no:사용불가
		if(cnt == 0) {
			return "YES";
		}
		else {
			return "NO";
		}
	}
	
	
}
