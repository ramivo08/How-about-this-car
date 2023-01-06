package car.controller;

import java.io.File;
import java.io.IOException;
import java.io.PrintWriter;
import java.util.List;
import java.util.UUID;

import javax.servlet.ServletContext;
import javax.servlet.ServletRequest;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.validation.Valid;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.multipart.MultipartHttpServletRequest;

import car.model.CarBean;
import car.model.CarDao;
import category.model.CategoryBean;
import category.model.CategoryDao;

@Controller
public class CarInsertController {

	private final String command = "insertCar.ca";
	private final String getPage = "/insertCarForm";
	private final String gotoPage = "redirect:/main.mem";

	@Autowired
	ServletContext sc;

	@Autowired
	CarDao cdao;
	
	@Autowired(required = false)
	CategoryDao catedao;

	@RequestMapping(command)
	public String insert(Model model) {
		
		List<CategoryBean> modLists= catedao.getList();
		List<CategoryBean> comLists = catedao.getComList();
		
		model.addAttribute("modLists", modLists);
		model.addAttribute("comLists", comLists);
		
		return getPage;
	}

	@RequestMapping(value = command, method = RequestMethod.POST)
	public String insertData(@ModelAttribute("cb") @Valid CarBean cb, BindingResult result,
			HttpServletResponse response, MultipartHttpServletRequest mtfRequest, HttpServletRequest request) throws IOException {

		System.out.println("input creg_day : " + cb.getCreg_day());

		List<MultipartFile> fileList = mtfRequest.getFiles("upload");

		String uploadPath = sc.getRealPath("/resources/images");
		String images = "";
		
		System.out.println("uploadPath : " + uploadPath );
		System.out.println("otherPath : " + request.getContextPath());
		String otherPath =" C:\\Spring_sjw\\.metadata\\.plugins\\org.eclipse.wst.server.core/uploadImages";
		
		for (MultipartFile mf : fileList) {
			UUID uuid = UUID.randomUUID();
			String randomName = uuid.toString()+"_";
			
			String originFileName = mf.getOriginalFilename(); // 원본 파일 명

			System.out.println("originFileName : " + originFileName);
			images += randomName+originFileName + ",";
			String safeFile = uploadPath + "/" + randomName+originFileName;
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
		
		System.out.println("images : " + images);
		if (result.hasErrors()) { // 에러 발생시 insertForm

			return getPage;
		}

		if (cb.getCoption() == null) { // 옵션을 선택하지 않을 경우
			cb.setCoption("옵션 선택 x");
		}
		System.out.println("추가 완료");
		cb.setCimage(images);
		cdao.insertCar(cb);
		System.out.println("추가 완료2");

		response.setContentType("text/html; charset=UTF-8");
		PrintWriter out = response.getWriter();
		out.println("<script>" + "alert('등록이 완료되었습니다.');" + "location.href='main.mem';" + "</script>");
		out.flush();

		return gotoPage; // 등록 완료 시, 메인페이지로 이동
	}
}
