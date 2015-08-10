package com.bentleytek.org;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

@Controller
public class ErrorController {

	@RequestMapping(value="/404",  method = RequestMethod.GET)
	public String showError(Model model) {
		model.addAttribute("error", "You have not access");
		return "404";
	}
}
