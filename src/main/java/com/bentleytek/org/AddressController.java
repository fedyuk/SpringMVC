package com.bentleytek.org;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.PageRequest;
import org.springframework.data.domain.Sort;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.validation.annotation.Validated;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.config.annotation.EnableWebMvc;

import com.bentleytek.org.services.AddressPageService;
import com.bentleytek.org.services.AddressService;
import com.bentleytek.org.models.Address;

@EnableWebMvc
@Controller
@RequestMapping(value = "/address")
public class AddressController {
	
	@Autowired
	AddressService addressService;
	
	@Autowired
	AddressPageService addressPageService;
	@RequestMapping(value="/all", method = RequestMethod.GET)
	public String showhAllAddresses(Model model, @RequestParam("page") int pageNumber) {
		if(pageNumber < 1) {
			pageNumber = 1;
		}
		Page<Address> page = addressPageService.getAddressPage(pageNumber);
		int current = page.getNumber() + 1;
	    int begin = Math.max(1, current - 4);
	    int end = Math.min(begin + 20, page.getTotalPages());
	    model.addAttribute("page", page);
	    model.addAttribute("beginIndex", begin);
	    model.addAttribute("endIndex", end);
	    model.addAttribute("currentIndex", current);
		model.addAttribute("addresses", addressService.findAll(new PageRequest(current-1, 20, Sort.Direction.ASC, "name")).getContent());
		return "address-all";
	}
	
	@RequestMapping(value="/add", method = RequestMethod.GET)
	public String addAddress(Model model) {
		model.addAttribute("address", new Address());
		return "address-add";
	}
	
	@RequestMapping(value="/add.do", method=RequestMethod.POST)
	public String addAddressActions(@ModelAttribute("address") @Validated Address address, BindingResult bindingResult, Model model){
		if(bindingResult.hasErrors()) {
			model.addAttribute("address", address);
	        return "address-add";
		}
		if(!addressService.findByName(address.getName()).isEmpty()) {
			 model.addAttribute("address", address);
			 bindingResult.rejectValue("name", "error.address", "Така адреса вже існує");
			 model.addAttribute(bindingResult.getModel());
			 return "address-add";
		}
		addressService.addAddress(address);
		return "redirect:/address/all?page=1";
	}
	
	@RequestMapping(value = "/delete", method = RequestMethod.GET)
	public String deleteAdress(Model model, @RequestParam(value = "addressId", required = true) int id) {
		if(id > 0) {
			addressService.deleteAddress(id);
		}
		return "redirect:/address/all?page=1";
	}
	
	@RequestMapping(value = "/edit", method = RequestMethod.GET)
	public String editAddress(Model model, @RequestParam(value = "addressId", required = true) int id) {
		model.addAttribute("address", addressService.findByAddressId(id));
		return "address-edit";
	}
	
	@RequestMapping(value="/edit.do", method=RequestMethod.POST)
	public String editAddressActions(@ModelAttribute("address") @Validated Address address, BindingResult bindingResult, Model model) {
		if(bindingResult.hasErrors()) {
			model.addAttribute("address", address);
	        return "address-edit";
		}
		if(!addressService.findByName(address.getName()).isEmpty()) {
			 model.addAttribute("address", address);
			 bindingResult.rejectValue("name", "error.address", "Така адреса вже існує");
			 model.addAttribute(bindingResult.getModel());
			 return "address-edit";
		}
		addressService.editAddress(address);
		return "redirect:/address/all?page=1";
	}
	
	@RequestMapping(value="/getAllAddresses", method = RequestMethod.GET)
	@ResponseBody
	public List<Address> getAllAddresses() {
		return addressService.findAllAddresses();
	}
}
