package car.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
public class CarMainController {

	private final String command = "/main.ca";
	private final String getPage = "/Main";
	
	@RequestMapping(command)
	public String main() {
		
		return getPage;
	}
	
}
