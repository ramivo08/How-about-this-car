package car.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
public class CarServiceController {

	private final String command= "service.ca";
	private final String getPage= "/CarService";
	
	@RequestMapping(command)
	public String servicePage() {
		
		return getPage;
	}

	
}
