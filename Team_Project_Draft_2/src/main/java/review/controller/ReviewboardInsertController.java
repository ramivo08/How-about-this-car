package review.controller;

import java.io.File;
import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Timestamp;
import java.util.ArrayList;
import java.util.List;
import java.util.UUID;

import javax.servlet.ServletContext;
import javax.servlet.http.HttpServletRequest;
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
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.ModelAndView;

import member.model.MemberBean;
import review.model.ReviewboardBean;
import review.model.ReviewboardDao;

@Controller
public class ReviewboardInsertController {
	
	private final String command = "reinsert.reb";
	private String getPage = "/reviewboardInsert";
	private String gotoPage = "redirect:/list.reb";
	
	@Autowired
	private ReviewboardDao reviewboardDao;
	
	@Autowired
	ServletContext servletContext;
	
	@RequestMapping(value=command, method=RequestMethod.GET)
	public String insert(
			HttpServletRequest request, 
			HttpSession session,
			HttpServletResponse response) throws IOException {
		
		
		response.setContentType("text/html;charset=UTF-8");
		
		MemberBean loginInfo = (MemberBean)session.getAttribute("loginInfo");
		System.out.println("loginInfo::"+loginInfo);
		
		List<Integer> getLoginid = reviewboardDao.getLoginid(loginInfo.getId());
		
		if(getLoginid.size() == 0) {
			PrintWriter out = response.getWriter();
			out.print("<script>alert('결제 내역이 없습니다'); history.back(-1);</script>");
			out.close();
			
			return "redirect:/list.reb";
		}
		
		else {
			ArrayList<String> cnumList = new ArrayList<String>();
			ArrayList<String> carList = new ArrayList<String>();
			for(Integer cnum : getLoginid) {
				cnumList.add(reviewboardDao.getCnum(cnum));
				carList.add(reviewboardDao.getCar(cnum));
			}
			
			request.setAttribute("cnumList", cnumList);
			request.setAttribute("carList", carList);
			
			
			return getPage;
		}
		
	}
	
	@RequestMapping(value=command, method=RequestMethod.POST)
	public ModelAndView insertre(
			@ModelAttribute("rebbean") @Valid ReviewboardBean rebbean,
			BindingResult result,
			HttpServletRequest request,
			HttpSession session) {
		
		ModelAndView mav = new ModelAndView();
		
		MemberBean loginInfo = (MemberBean)session.getAttribute("loginInfo");
		
		Timestamp r_day =  new Timestamp(System.currentTimeMillis()); //날짜
		rebbean.setR_day(r_day);
		
		String uploadPath = servletContext.getRealPath("/resources/img"); //이미지
		System.out.println("uploadPath:"+uploadPath);
		
		MultipartFile multi = rebbean.getUpload();
		System.out.println("multi.getName():"+multi.getName());
		System.out.println("multi.getOriginalFilename():"+multi.getOriginalFilename());
		System.out.println("board.getImage():"+rebbean.getRimage());
		
		UUID uuid = UUID.randomUUID();
		String uuidName = uuid.toString()+"_";
		if(result.hasErrors()) {
			System.out.println("1: "+rebbean.getRid());
			System.out.println("2: "+rebbean.getRname());
			
			mav.setViewName(getPage); //reviewboardInsert.jsp
			return mav;
		}
		String realName=uuidName+multi.getOriginalFilename();
		System.out.println(realName);
		rebbean.setRimage(realName);
		 int cnt = reviewboardDao.insertReiew(rebbean); 
		 System.out.println("insertController cnt:"+cnt);
		 
		 if(cnt > 0) {
			 File file = new File(uploadPath+"/" +uuidName + multi.getOriginalFilename());
			 
			 try {
				multi.transferTo(file);
			} catch (IllegalStateException e) {
				System.out.println("review 이미지 에러1");
			} catch (IOException e) {
				System.out.println("review 이미지 에러2");
			}
			 mav.setViewName(gotoPage); //redirect:/list.reb
		 }
		 
		 else {
			
			mav.setViewName(getPage); //reviewboardInsert.jsp
		 }
		
		return mav; 
		
	}
	
	

}
