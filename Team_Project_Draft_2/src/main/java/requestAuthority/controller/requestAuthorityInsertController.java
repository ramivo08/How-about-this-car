package requestAuthority.controller;

import java.io.File;
import java.io.IOException;
import java.util.UUID;

import javax.servlet.ServletContext;
import javax.validation.Valid;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.multipart.MultipartFile;

import requestAuthority.model.requestAuthorityBean;
import requestAuthority.model.requestAuthorityDao;

@Controller
public class requestAuthorityInsertController {

	private final String command = "insertRA.ra";
	private final String getPage = "/insertRAForm";
	private final String getoPage = "redirect:/myPage.ca";
	
	@Autowired
	requestAuthorityDao radao;
	
	@Autowired
	ServletContext sc;
	
	@RequestMapping(command)
	public String requestAuthorityInsertForm() {
		
		return getPage;
	}
	
	@RequestMapping(value=command,method = RequestMethod.POST)
	public String requestAuthorityInsert(@ModelAttribute("rabean") @Valid requestAuthorityBean rabean, BindingResult result) {
		
		rabean.setRegistrationno(rabean.getRegistrationno1()+"-"+rabean.getRegistrationno2()+"-"+rabean.getRegistrationno3());
		
		if(result.hasErrors()) {
			
			return getPage;
		}
		
		System.out.println("사업자 번호 : "  + rabean.getRegistrationno());
		
		UUID uuid = UUID.randomUUID();
		String uuidName = uuid.toString()+"_";
		
		MultipartFile multi = rabean.getUpload();
		String uploadPath = sc.getRealPath("/resources/images");
		System.out.println("12312673812 : " + uploadPath);
		File file = new File(uploadPath + "/" + uuidName + multi.getOriginalFilename());
		try {
			multi.transferTo(file);
		} catch (IllegalStateException e) {
			e.printStackTrace();
		} catch (IOException e) {
			e.printStackTrace();
		}
		
		radao.insertRA(rabean);
		
		
		return getoPage;
	}
}
