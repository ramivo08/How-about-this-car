package review.controller;

import java.io.File;
import java.io.IOException;
import java.io.PrintWriter;
import java.util.ArrayList;
import java.util.List;
import java.util.UUID;

import javax.servlet.ServletContext;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import javax.validation.Valid;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;

import member.model.MemberBean;
import review.model.ReviewboardBean;
import review.model.ReviewboardDao;

@Controller
public class ReviewboardUpdateController {

	private final String command ="/update.reb";
	private String getPage="/reviewboardUpdate";
	private String gotoPage = "redirect:/list.reb";

	private ReviewboardBean rebbean;
	
	@Autowired
	private ReviewboardDao reviewboardDao;

	@Autowired
	ServletContext servletContext;

	@RequestMapping(value=command, method=RequestMethod.GET)
	public String update(
			@RequestParam(value="rnum" , required=true) String rnum ,
			@RequestParam(value="pageNumber" , required= true) String pageNumber,
			Model model,HttpSession session) {

		MemberBean loginInfo = (MemberBean)session.getAttribute("loginInfo");
		System.out.println("loginInfo::"+loginInfo);
		
		List<Integer> getLoginid = reviewboardDao.getLoginid(loginInfo.getId());
		System.out.println("getLoginid::"+getLoginid);
		
		ArrayList<String> cnumList = new ArrayList<String>();
		//ArrayList<String> carList = new ArrayList<String>();

		for(Integer cnum : getLoginid) {
			cnumList.add(reviewboardDao.getCnum(cnum));
			//carList.add(reviewboardDao.getCar(cnum));
		}

		rebbean = reviewboardDao.getRnum(rnum);
		
		model.addAttribute("cnumList", cnumList);
		model.addAttribute("rebbean", rebbean);
		model.addAttribute("pageNumber", pageNumber);

		return getPage;

	}
	
	@RequestMapping(value=command, method=RequestMethod.POST)
	public String doAction(
			@RequestParam(value="pageNumber", required=false) String pageNumber,
			@ModelAttribute("rebbean") @Valid ReviewboardBean rebbean,
			@RequestParam(value="originalImg" , required=false) String originalImg,
			@RequestParam(value="repw" , required=false) String repw,
			@RequestParam(value="rnum", required=false) String rnum,
			BindingResult result, Model model,
			HttpServletResponse response) {
		
		response.setContentType("text/html;charset=UTF-8");
		
		//System.out.println("여기 안오는거 같은데 ......");
		
		System.out.println("rebbean.getRimage:"+rebbean.getRimage());//새이미지
		System.out.println("UpdateController originalImg:"+originalImg);//기존이미지
		
		
		if(result.hasErrors()) {
			System.out.println("에러:::");
			model.addAttribute("pageNumber", pageNumber);
			return getPage;
		}
		
		UUID uuid = UUID.randomUUID();
		String uuidName = uuid.toString()+"_";
		
		String updatePw = reviewboardDao.selectByPw(rebbean.getRnum());
		
		if(updatePw.equals(repw)) {
			String originalPath = servletContext.getRealPath("/resources/img");
			File file = new File(originalPath);
			file.delete();
			
			//새로운 이미지 등록
			MultipartFile multi = rebbean.getUpload();
			String newPath = servletContext.getRealPath("/resources/img")+"/"+uuidName+multi.getOriginalFilename();//업로드 위치 설정
			File file2 = new File(newPath);
			
			try {
				multi.transferTo(file2);
			} catch (IllegalStateException e) {
				e.printStackTrace();
			} catch (IOException e) {
				e.printStackTrace();
			}
			String realName=uuidName+multi.getOriginalFilename();
			System.out.println(realName);
			rebbean.setRimage(realName);
			reviewboardDao.updateReviewboard(rebbean);
			//model.addAttribute("pageNumber", pageNumber);
			
			return "redirect:/list.reb?pageNumber="+pageNumber;		
		}
		else {
			try {
				PrintWriter out = response.getWriter();
				out.print("<script>alert('비밀번호가 일치하지 않습니다'); location.href='update.reb?rnum="+rnum+"&pageNumber="+pageNumber+"' </script>");
				out.flush();
				return null;
			} catch (IOException e) {
				System.out.println("ReviewboardUpdateController ::: 비밀번호 에러");
			}
			return getPage;
		}
		
	}
	
}
