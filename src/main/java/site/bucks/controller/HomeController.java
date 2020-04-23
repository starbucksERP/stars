package site.bucks.controller;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import site.bucks.dto.Sale;
@Controller
public class HomeController {
	@RequestMapping(value = "/", method = RequestMethod.GET)
	public String template() {
		return "home";
	}
	


	

	

}











