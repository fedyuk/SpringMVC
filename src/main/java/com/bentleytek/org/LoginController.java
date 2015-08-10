package com.bentleytek.org;


import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import com.bentleytek.org.services.AccountService;

@Controller
public class LoginController {
	
	@Autowired 
	AccountService accountService;
    @RequestMapping(value = {"/"}, method = RequestMethod.GET)
	public String home(Model model) {
	return "redirect:/login";
	}
		
	@RequestMapping(value = "/login", method = RequestMethod.GET)
	public ModelAndView loginAccount(@RequestParam(value = "error", required = false) String error,
			@RequestParam(value = "logout", required = false) String logout) {
	ModelAndView model = new ModelAndView();
	if (error != null) {
		model.addObject("error", "Неправильний логінь або пароль");
	}
	if (logout != null) {
		model.addObject("msg", "Ви вийшли із системи");
	}
		model.setViewName("login");
		return model;
	}
}
