package com.ssafy.home;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;

import io.swagger.annotations.Api;

@Controller
@Api(tags = {"Trip Controller"})
public class HomeController {

	@GetMapping("/home")
	public String home() {
		return "home";	
	}
	
	@GetMapping("/searchtravel")
	public String searchtravel() {
		return "SearchTravel";	
	}
}
