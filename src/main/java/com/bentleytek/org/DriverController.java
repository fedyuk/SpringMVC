package com.bentleytek.org;

import java.util.List;

import javax.servlet.http.HttpServletRequest;

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

import com.bentleytek.org.services.CarService;
import com.bentleytek.org.services.DriverPageService;
import com.bentleytek.org.services.DriverService;
import com.bentleytek.org.models.Car;
import com.bentleytek.org.models.Driver;

@Controller
@RequestMapping(value = "/driver")
public class DriverController {
	
	@Autowired
	DriverService driverService;
	
	@Autowired
	CarService carService;
	
	@Autowired
	DriverPageService driverPageService;
	@RequestMapping(value="/all", method = RequestMethod.GET)
	public String showhAllDrivers(Model model, @RequestParam("page") int pageNumber) {
		if(pageNumber < 1) {
			pageNumber = 1;
		}
		Page<Driver> page = driverPageService.getDriverPage(pageNumber);
		int current = page.getNumber() + 1;
	    int begin = Math.max(1, current - 4);
	    int end = Math.min(begin + 20, page.getTotalPages());
	    model.addAttribute("page", page);
	    model.addAttribute("beginIndex", begin);
	    model.addAttribute("endIndex", end);
	    model.addAttribute("currentIndex", current);
		model.addAttribute("drivers", driverService.findAll(new PageRequest(current-1, 20, Sort.Direction.ASC, "lastName")).getContent());
		return "driver-all";
	}
	
	@RequestMapping(value="/add", method = RequestMethod.GET)
	public String addDriver(Model model) {
		Driver driver = new Driver();
		driver.setCar(carService.findAll().get(0));
		model.addAttribute("driver", new Driver());
		List<Car> cars = carService.findAllCarNumbersAndBrands();
		model.addAttribute("cars", cars);
		return "driver-add";
	}
	
	@RequestMapping(value="/add.do", method=RequestMethod.POST)
	public String addDriverActions(@ModelAttribute("driver") @Validated Driver driver, BindingResult bindingResult, Model model, HttpServletRequest request){
		if(bindingResult.hasErrors()) {
			driver.setCar(carService.findByCarId(Integer.parseInt(request.getParameter("itemDrivers"))));
			model.addAttribute("driver", driver);
			List<Car> cars = carService.findAllCarNumbersAndBrands();
			model.addAttribute("cars", cars);
	        return "driver-add";
		}
		if((!driverService.findByLastName(driver.getLastName()).isEmpty()) && (!driverService.findByFirstName(driver.getFirstName()).isEmpty())) {
			 driver.setCar(carService.findByCarId(Integer.parseInt(request.getParameter("itemDrivers"))));
			 model.addAttribute("driver", driver);
			 bindingResult.rejectValue("firstName", "error.driver", "Водій з таким прізвищем і іменем вже існує");
			 model.addAttribute(bindingResult.getModel());
			 List<Car> cars = carService.findAllCarNumbersAndBrands();
			 model.addAttribute("cars", cars);
			 return "driver-add";
		}
		if(request.getParameter("itemDrivers").toString().isEmpty()) {
			 model.addAttribute("driver", driver);
			 bindingResult.rejectValue("car", "error.driver", "Виберіть машину");
			 model.addAttribute(bindingResult.getModel());
			 List<Car> cars = carService.findAllCarNumbersAndBrands();
			 model.addAttribute("cars", cars);
			 return "driver-add";
		}
		driver.setCar(carService.findByCarId(Integer.parseInt(request.getParameter("itemDrivers"))));
		driverService.addDriver(driver);
		return "redirect:/driver/all?page=1";
	}
	
	@RequestMapping(value = "/delete", method = RequestMethod.GET)
	public String deleteDriver(Model model, @RequestParam(value = "driverId", required = true) int id) {
		if(id > 0) {
			driverService.deleteDriver(id);
		}
		return "redirect:/driver/all?page=1";
	}
	
	@RequestMapping(value = "/edit", method = RequestMethod.GET)
	public String editDriver(Model model, @RequestParam(value = "driverId", required = true) int id) {
		model.addAttribute("driver", driverService.findByDriverId(id));
		List<Car> cars = carService.findAllCarNumbersAndBrands();
		model.addAttribute("cars", cars);
		return "driver-edit";
	}
	
	@RequestMapping(value="/edit.do", method=RequestMethod.POST)
	public String editDriverActions(@ModelAttribute("driver") @Validated Driver driver, BindingResult bindingResult, Model model, HttpServletRequest request) {
		if(bindingResult.hasErrors()) {
		     driver.setCar(carService.findByCarId(Integer.parseInt(request.getParameter("itemDrivers"))));
			model.addAttribute("driver", driver);
			List<Car> cars = carService.findAllCarNumbersAndBrands();
			model.addAttribute("cars", cars);
	        return "driver-edit";
		}
		if((!driverService.findByLastName(driver.getLastName()).isEmpty()) && (!driverService.findByFirstName(driver.getFirstName()).isEmpty())) {
			if(driver.getFirstName().equals(driverService.findByDriverId(driver.getDriverId()).getFirstName()) && driver.getLastName().equals(driverService.findByDriverId(driver.getDriverId()).getLastName())) {
				driver.setCar(carService.findByCarId(Integer.parseInt(request.getParameter("itemDrivers"))));
				driverService.editDriver(driver);
				return "redirect:/driver/all?page=1";
			}
			else {
		     driver.setCar(carService.findByCarId(Integer.parseInt(request.getParameter("itemDrivers"))));
			 model.addAttribute("driver", driver);
			 bindingResult.rejectValue("firstName", "error.driver", "Водій з таким прізвищем та іменем вже існує");
			 model.addAttribute(bindingResult.getModel());
			 List<Car> cars = carService.findAllCarNumbersAndBrands();
			 model.addAttribute("cars", cars);
			 return "driver-edit";
			}
		}
		driver.setCar(carService.findByCarId(Integer.parseInt(request.getParameter("itemDrivers"))));
		driverService.editDriver(driver);
		return "redirect:/driver/all?page=1";
	}
	
	@RequestMapping(value="/getAllPhoneNumbers", method = RequestMethod.GET)
	@ResponseBody
	public List<Driver> getAllPhoneNumbers() {
		return driverService.findAllDrivers();
	}
	
	@RequestMapping(value="/getAllDrivers", method = RequestMethod.GET)
	@ResponseBody
	public List<Driver> getAllDrivers() {
		return driverService.findAllDriversDetails();
	}
}
