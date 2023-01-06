package faq.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
public class ServiceMemController {
	
	private final String command = "service.fq";
	private String getPage = "/servicemem";
	
	@RequestMapping(command)
	public String servic() {
		return getPage;
	}
	
	
}
