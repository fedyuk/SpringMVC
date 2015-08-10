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

import com.bentleytek.org.services.CarPageService;
import com.bentleytek.org.services.CarService;
import com.bentleytek.org.models.Car;

@EnableWebMvc
@Controller
@RequestMapping(value = "/car")
public class CarController {
	
	@Autowired
	CarService carService;
	
	@Autowired
	CarPageService carPageService;
	@RequestMapping(value="/all", method = RequestMethod.GET)
	public String showhAllCars(Model model, @RequestParam("page") int pageNumber) {
		if(pageNumber < 1) {
			pageNumber = 1;
		}
		Page<Car> page = carPageService.getCarPage(pageNumber);
		int current = page.getNumber() + 1;
	    int begin = Math.max(1, current - 4);
	    int end = Math.min(begin + 20, page.getTotalPages());
	    model.addAttribute("page", page);
	    model.addAttribute("beginIndex", begin);
	    model.addAttribute("endIndex", end);
	    model.addAttribute("currentIndex", current);
		model.addAttribute("cars", carService.findAll(new PageRequest(current-1, 20, Sort.Direction.ASC, "brand")).getContent());
		return "car-all";
	}
	
	@RequestMapping(value="/add", method = RequestMethod.GET)
	public String addCar(Model model) {
		model.addAttribute("car", new Car());
		return "car-add";
	}
	
	@RequestMapping(value="/add.do", method=RequestMethod.POST)
	public String addCarActions(@ModelAttribute("car") @Validated Car car, BindingResult bindingResult, Model model){
		if(bindingResult.hasErrors()) {
			model.addAttribute("car", car);
	        return "car-add";
		}
		if(!carService.findByCarNumber(car.getCarNumber()).isEmpty()) {
			 model.addAttribute("car", car);
			 bindingResult.rejectValue("carNumber", "error.car", "Такий номер машини вже існує");
			 model.addAttribute(bindingResult.getModel());
			 return "car-add";
		}
		carService.addCar(car);
		return "redirect:/car/all?page=1";
	}
	
	@RequestMapping(value = "/delete", method = RequestMethod.GET)
	public String deleteCar(Model model, @RequestParam(value = "carId", required = true) int id) {
		if(id > 0) {
			carService.deleteCar(id);
		}
		return "redirect:/car/all?page=1";
	}
	
	@RequestMapping(value = "/edit", method = RequestMethod.GET)
	public String editCar(Model model, @RequestParam(value = "carId", required = true) int id) {
		model.addAttribute("car", carService.findByCarId(id));
		return "car-edit";
	}
	
	@RequestMapping(value="/edit.do", method=RequestMethod.POST)
	public String editCarActions(@ModelAttribute("car") @Validated Car car, BindingResult bindingResult, Model model) {
		if(bindingResult.hasErrors()) {
			model.addAttribute("car", car);
	        return "car-edit";
		}
		if(!carService.findByCarNumber(car.getCarNumber()).isEmpty() && car.getCarNumber().equals(carService.findByCarId(car.getCarId()))) {
			 model.addAttribute("car", car);
			 bindingResult.rejectValue("carNumber", "error.car", "Такий номер машини вже існує");
			 model.addAttribute(bindingResult.getModel());
			 return "car-edit";
		}
		carService.editCar(car);
		return "redirect:/car/all?page=1";
	}
	
	@RequestMapping(value="/getAllCarNumbers", method = RequestMethod.GET)
	@ResponseBody
	public List<Car> getAllCarNumbers() {
		return carService.findAllCarNumbers();
	}

}
