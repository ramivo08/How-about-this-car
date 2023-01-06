package car.controller;

import java.io.File;
import java.io.IOException;
import java.io.PrintWriter;
import java.net.http.HttpResponse;
import java.util.List;
import java.util.StringTokenizer;
import java.util.UUID;

import javax.servlet.ServletContext;
import javax.servlet.http.HttpServletResponse;
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
import org.springframework.web.multipart.MultipartHttpServletRequest;

import car.model.CarBean;
import car.model.CarDao;
import category.model.CategoryBean;
import category.model.CategoryDao;

@Controller
public class CarUpdateController {
	private final String command = "carUpdate.ca";
	private final String gotoPage = "/updateCarForm";
	//private final String getPage = "redirect:/myCarList.ca";
	
	
	@Autowired
	ServletContext sc;
	
	@Autowired
	CarDao cdao;
	
	@Autowired(required = false)
	CategoryDao catedao;
	
	@RequestMapping(command)
	public String updateForm(@RequestParam("cnum") String cnum,Model model) {
		
		CarBean cb = cdao.myCarDetail(cnum);
		
		List<CategoryBean> modLists= catedao.getList();
		List<CategoryBean> comLists = catedao.getComList();
		
		model.addAttribute("modLists", modLists);
		model.addAttribute("comLists", comLists);
		
		
		model.addAttribute("cb", cb);
		model.addAttribute("cnum", cnum);
		return gotoPage;
	}
	
	@RequestMapping(value= command, method = RequestMethod.POST)
	public String updateCar(@ModelAttribute("cb") @Valid CarBean cb, BindingResult result,HttpServletResponse response, @RequestParam(value="pageNumber",required = false) String pageNumber, Model model, @RequestParam("cnum") String cnum, MultipartHttpServletRequest mtfRequest) throws IOException {
		
		System.out.println("하하하 : " + cb.getCreg_day());
		
		String temp = "";
		String[] reg_day = (cb.getCreg_day()).split("-");
		for(int i = 0;i<reg_day.length;i++) {
			temp += reg_day[i];
		}
		
		String day;
		
		cb.setCreg_day(temp);
		
		String deletePath = sc.getRealPath("/resources/images/"); // 실제 이미지 파일이 들어있는 경로
		
		
		
		System.out.println("에러 개수 : " + result.getErrorCount());
		if(result.hasErrors()) {
			model.addAttribute("pageNumber",pageNumber); // 입력 누락시, pageNumber가 초기화 되기 때문에 다시 속성설정이 필요함
			return gotoPage;
		}
		UUID uuid = UUID.randomUUID();
		String uuidName = uuid.toString()+"_";
		
		CarBean cbean = cdao.myCarDetail(cnum);
		String images = cbean.getCimage();
		System.out.println("이미지 파일 경로 : " + deletePath);

		System.out.println(images);
		String []tokens=images.split(",");
		for(int i = 0;i<tokens.length;i++) {
			
			File file = new File(deletePath + tokens[i]);
			
			if (file.exists()) {
				if (file.delete()) {
					System.out.println(i+ "번 이미지 삭제 성공");
				} else {
					System.out.println(i+ "번이미지 삭제 실패");
				}
			} else {
				System.out.println("이미지 파일이 존재하지 않음");
			}
		}
		
		
		List<MultipartFile> fileList = mtfRequest.getFiles("upload");

		String uploadPath = sc.getRealPath("/resources/images");
		images = "";
		for (MultipartFile mf : fileList) {
			String originFileName = mf.getOriginalFilename(); // 원본 파일 명

			System.out.println("originFileName : " + originFileName);
			images += uuidName +originFileName + ",";
			String safeFile = uploadPath + "/" +uuidName +originFileName;
			try {
				mf.transferTo(new File(safeFile));
			} catch (IllegalStateException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			} catch (IOException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
		}
		cb.setCimage(images);
		
		
		
		
		if(cb.getCoption()==null) { // 옵션을 선택하지 않을 경우
			cb.setCoption("옵션 선택 x");
		}
		
		System.out.println("cnum : " + cnum);
		cdao.updateMyCar(cb);
		

		response.setContentType("text/html; charset=UTF-8");
		PrintWriter out = response.getWriter();
		out.println("<script>"+"alert('수정이 완료되었습니다.');"+"window.close();"
				+ "</script>");
		out.flush();
		
		return null;
	}
}
