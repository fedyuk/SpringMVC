package com.bentleytek.org;

import java.sql.Date;
import java.text.DateFormat;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
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

import com.bentleytek.org.services.AddressService;
import com.bentleytek.org.services.DriverService;
import com.bentleytek.org.services.ProductService;
import com.bentleytek.org.services.TransportationPageService;
import com.bentleytek.org.services.TransportationService;
import com.bentleytek.org.models.Transportation;

@Controller
@RequestMapping(value = "/transportation")
public class TransportationController {
	
	@Autowired
	TransportationService transportationService;
	
	@Autowired
	DriverService driverService;
	
	@Autowired
	ProductService productService;
	
	@Autowired
	AddressService addressService;
	
	@Autowired
	TransportationPageService transportationPageService;
	
	@RequestMapping(value="/all", method = RequestMethod.GET, params={"page"})
	public String showhAllTransportations(Model model, @RequestParam("page") int pageNumber) {
		if(pageNumber < 1) {
			pageNumber = 1;
		}
		Page<Transportation> page = transportationPageService.getTransportationPage(pageNumber);
		int current = page.getNumber() + 1;
	    int begin = Math.max(1, current - 4);
	    int end = Math.min(begin + 10, page.getTotalPages());
	    model.addAttribute("page", page);
	    model.addAttribute("beginIndex", begin);
	    model.addAttribute("endIndex", end);
	    model.addAttribute("currentIndex", current);
	    DateFormat shortDF = DateFormat.getDateInstance(DateFormat.SHORT);
	    model.addAttribute("dateFormat", shortDF);
		model.addAttribute("transportations", transportationService.findAll(new PageRequest(current-1, 10, Sort.Direction.DESC, "loadDate")).getContent());
		return "transportation-all";
	}
	
	@RequestMapping(value="/add", method = RequestMethod.GET)
	public String addTransportation(Model model) {
		Transportation transportation = new Transportation();
		transportation.setLoadAddress(addressService.findAll().get(0));
		transportation.setUnloadAddress(addressService.findAll().get(0));
		transportation.setDriver(driverService.findAll().get(0));
		transportation.setProduct(productService.findAll().get(0));
		transportation.setStatus("agree");
		model.addAttribute("transportation", transportation);
	    model.addAttribute("addresses", addressService.findAllAddresses());
	    model.addAttribute("drivers", driverService.findAllDrivers());
	    model.addAttribute("products", productService.findAllProducts());
	    List<String> status = new ArrayList<String>();
	    status.add("agree");
	    status.add("load");
	    status.add("unload");
	    model.addAttribute("status", status);
		return "transportation-add";
	}
	
	@RequestMapping(value="/add.do", method=RequestMethod.POST)
	public String addTransportationActions(@ModelAttribute("transportation") @Validated Transportation transportation, BindingResult bindingResult, Model model, HttpServletRequest request) throws ParseException{
		if(bindingResult.hasErrors()) {
			transportation.setDriver(driverService.findByDriverId(Integer.parseInt(request.getParameter("itemDrivers"))));
			transportation.setLoadAddress(addressService.findByAddressId(Integer.parseInt(request.getParameter("itemAddresses1"))));
			transportation.setUnloadAddress(addressService.findByAddressId(Integer.parseInt(request.getParameter("itemAddresses2"))));
			transportation.setProduct(productService.findByProductId(Integer.parseInt(request.getParameter("itemProducts"))));
			transportation.setStatus(request.getParameter("itemStatus"));
			SimpleDateFormat formatter = new SimpleDateFormat("yy-MM-dd");
			String dateInString = request.getParameter("date1");
			java.util.Date utilDate = formatter.parse(dateInString);
			Date date = new java.sql.Date(utilDate.getTime());
			SimpleDateFormat formatter2 = new SimpleDateFormat("yy-MM-dd");
			String dateInString2 = request.getParameter("date2");
			if(dateInString2.equals("")) {
				transportation.setLoadDate(date);
			}
			else {
				java.util.Date utilDate2 = formatter2.parse(dateInString2);
				Date date2 = new java.sql.Date(utilDate2.getTime());
				transportation.setUnloadDate(date2);
				transportation.setLoadDate(date);
			}
			model.addAttribute("transportation", transportation);
			 model.addAttribute("addresses", addressService.findAllAddresses());
			    model.addAttribute("drivers", driverService.findAllDrivers());
			    model.addAttribute("products", productService.findAllProducts());
			    List<String> status = new ArrayList<String>();
			    status.add("agree");
			    status.add("load");
			    status.add("unload");
			    model.addAttribute("status", status);
	        return "transportation-add";
		}
		transportation.setDriver(driverService.findByDriverId(Integer.parseInt(request.getParameter("itemDrivers"))));
		transportation.setLoadAddress(addressService.findByAddressId(Integer.parseInt(request.getParameter("itemAddresses1"))));
		transportation.setUnloadAddress(addressService.findByAddressId(Integer.parseInt(request.getParameter("itemAddresses2"))));
		transportation.setProduct(productService.findByProductId(Integer.parseInt(request.getParameter("itemProducts"))));
		transportation.setStatus(request.getParameter("itemStatus"));
		SimpleDateFormat formatter = new SimpleDateFormat("yy-MM-dd");
		String dateInString = request.getParameter("date1");
		java.util.Date utilDate = formatter.parse(dateInString);
		Date date = new java.sql.Date(utilDate.getTime());
		SimpleDateFormat formatter2 = new SimpleDateFormat("yy-MM-dd");
		String dateInString2 = request.getParameter("date2");
		if(dateInString2.equals("")) {
			transportation.setLoadDate(date);
		}
		else {
			java.util.Date utilDate2 = formatter2.parse(dateInString2);
			Date date2 = new java.sql.Date(utilDate2.getTime());
			transportation.setUnloadDate(date2);
			transportation.setLoadDate(date);
		}
		transportationService.addTransportation(transportation);
		return "redirect:/transportation/all?page=1";
	}
	
	@RequestMapping(value = "/delete", method = RequestMethod.GET)
	public String deleteTransportation(Model model, @RequestParam(value = "transportationId", required = true) int id) {
		if(id > 0) {
			transportationService.deleteTransportation(id);
		}
		return "redirect:/transportation/all?page=1";
	}
	
	@RequestMapping(value = "/edit", method = RequestMethod.GET)
	public String editTransportation(Model model, @RequestParam(value = "transportationId", required = true) int id) {
		model.addAttribute("transportation", transportationService.findByTransportationId(id));
		 model.addAttribute("addresses", addressService.findAllAddresses());
		    model.addAttribute("drivers", driverService.findAllDrivers());
		    model.addAttribute("products", productService.findAllProducts());
		    List<String> status = new ArrayList<String>();
		    status.add("agree");
		    status.add("load");
		    status.add("unload");
		    model.addAttribute("status", status);
		return "transportation-edit";
	}
	
	@RequestMapping(value="/edit.do", method=RequestMethod.POST)
	public String editTransportationActions(@ModelAttribute("transportation") @Validated Transportation transportation, BindingResult bindingResult, Model model, HttpServletRequest request) throws ParseException{
		if(bindingResult.hasErrors()) {
			transportation.setDriver(driverService.findByDriverId(Integer.parseInt(request.getParameter("itemDrivers"))));
			transportation.setLoadAddress(addressService.findByAddressId(Integer.parseInt(request.getParameter("itemAddresses1"))));
			transportation.setUnloadAddress(addressService.findByAddressId(Integer.parseInt(request.getParameter("itemAddresses2"))));
			transportation.setProduct(productService.findByProductId(Integer.parseInt(request.getParameter("itemProducts"))));
			transportation.setStatus(request.getParameter("itemStatus"));
			SimpleDateFormat formatter = new SimpleDateFormat("yy-MM-dd");
			String dateInString = request.getParameter("date1");
			java.util.Date utilDate = formatter.parse(dateInString);
			Date date = new java.sql.Date(utilDate.getTime());
			SimpleDateFormat formatter2 = new SimpleDateFormat("yy-MM-dd");
			String dateInString2 = request.getParameter("date2");
			if(dateInString2.equals("")) {
				transportation.setLoadDate(date);
			}
			else {
				java.util.Date utilDate2 = formatter2.parse(dateInString2);
				Date date2 = new java.sql.Date(utilDate2.getTime());
				transportation.setUnloadDate(date2);
				transportation.setLoadDate(date);
			}
			model.addAttribute("transportation", transportation);
			 model.addAttribute("addresses", addressService.findAllAddresses());
			    model.addAttribute("drivers", driverService.findAllDrivers());
			    model.addAttribute("products", productService.findAllProducts());
			    List<String> status = new ArrayList<String>();
			    status.add("agree");
			    status.add("load");
			    status.add("unload");
			    model.addAttribute("status", status);
	        return "transportation-add";
		}
		transportation.setDriver(driverService.findByDriverId(Integer.parseInt(request.getParameter("itemDrivers"))));
		transportation.setLoadAddress(addressService.findByAddressId(Integer.parseInt(request.getParameter("itemAddresses1"))));
		transportation.setUnloadAddress(addressService.findByAddressId(Integer.parseInt(request.getParameter("itemAddresses2"))));
		transportation.setProduct(productService.findByProductId(Integer.parseInt(request.getParameter("itemProducts"))));
		transportation.setStatus(request.getParameter("itemStatus"));
		SimpleDateFormat formatter = new SimpleDateFormat("yy-MM-dd");
		String dateInString = request.getParameter("date1");
		java.util.Date utilDate = formatter.parse(dateInString);
		Date date = new java.sql.Date(utilDate.getTime());
		SimpleDateFormat formatter2 = new SimpleDateFormat("yy-MM-dd");
		String dateInString2 = request.getParameter("date2");
		if(dateInString2.equals("")) {
			transportation.setLoadDate(date);
		}
		else {
			java.util.Date utilDate2 = formatter2.parse(dateInString2);
			Date date2 = new java.sql.Date(utilDate2.getTime());
			transportation.setUnloadDate(date2);
			transportation.setLoadDate(date);
		}
		transportationService.editTransportation(transportation);
		return "redirect:/transportation/all?page=1";
	}
	
	@RequestMapping(value="/all", method = RequestMethod.GET, params={"page","sortType"})
	public String sortAllTransportations(Model model, @RequestParam("page") int pageNumber, @RequestParam("sortType") String sortType) {
		if(pageNumber < 1) {
			pageNumber = 1;
		}
		Page<Transportation> page = transportationPageService.getTransportationPage(pageNumber);
		int current = page.getNumber() + 1;
	    int begin = Math.max(1, current - 4);
	    int end = Math.min(begin + 10, page.getTotalPages());
	    model.addAttribute("page", page);
	    model.addAttribute("beginIndex", begin);
	    model.addAttribute("endIndex", end);
	    model.addAttribute("currentIndex", current);
	    model.addAttribute("sortType", sortType);
	    DateFormat shortDF = DateFormat.getDateInstance(DateFormat.SHORT);
	    model.addAttribute("dateFormat", shortDF);
		model.addAttribute("transportations", transportationService.findAll(new PageRequest(current-1, 10, Sort.Direction.DESC, sortType)).getContent());
		return "transportation-all-sort";
	}
	
	@RequestMapping(value="/searchStatus.do", method=RequestMethod.POST)
	public String searchStatusActions(Model model, HttpServletRequest request){
		return "redirect:/transportation/all?page=1&searchBy=status&value="+request.getParameter("status");
	}
	
	@RequestMapping(value="/searchLoadDate.do", method=RequestMethod.POST)
	public String searchLoadDateActions(Model model, HttpServletRequest request){
		return "redirect:/transportation/all?page=1&searchBy=loadDate&value="+request.getParameter("date");
	}
	
	@RequestMapping(value="/searchUnLoadDate.do", method=RequestMethod.POST)
	public String searchUnLoadDateActions(Model model, HttpServletRequest request){
		return "redirect:/transportation/all?page=1&searchBy=unloadDate&value="+request.getParameter("date");
	}
	
	@RequestMapping(value="/searchCarNumber.do", method=RequestMethod.POST)
	public String searchCarNumberActions(Model model, HttpServletRequest request){
		return "redirect:/transportation/all?page=1&searchBy=carNumber&value="+request.getParameter("carNumber");
	}
	
	@RequestMapping(value="/searchPhoneNumber.do", method=RequestMethod.POST)
	public String searchPhoneNumberActions(Model model, HttpServletRequest request){
		return "redirect:/transportation/all?page=1&searchBy=phoneNumber&value="+request.getParameter("phoneNumber");
	}
	
	@RequestMapping(value="/searchProductName.do", method=RequestMethod.POST)
	public String searchProductNameActions(Model model, HttpServletRequest request){
		return "redirect:/transportation/all?page=1&searchBy=productName&value="+request.getParameter("productName");
	}
	
	@RequestMapping(value="/searchRoute.do", method=RequestMethod.POST)
	public String searchRouteActions(Model model, HttpServletRequest request){
		return "redirect:/transportation/all?page=1&searchBy=route&value="+request.getParameter("loadAddress")+","+request.getParameter("unloadAddress");
	}
	
	@RequestMapping(value="/searchLoadDateInterval.do", method=RequestMethod.POST)
	public String searchLoadDateInterval(Model model, HttpServletRequest request){
		return "redirect:/transportation/all?page=1&searchBy=loadDateInterval&value="+request.getParameter("loadDate1")+","+request.getParameter("loadDate2");
	}
	
	@RequestMapping(value="/searchDriver.do", method=RequestMethod.POST)
	public String searchDriver(Model model, HttpServletRequest request){
		return "redirect:/transportation/all?page=1&searchBy=driver&value="+request.getParameter("driver");
	}
	
	@RequestMapping(value="/all", method = RequestMethod.GET, params={"page","searchBy","value"})
	public String searchAllTransportations(Model model, @RequestParam("page") int pageNumber, @RequestParam("searchBy") String searchBy, @RequestParam("value") String value) {
		if(pageNumber < 1) {
			pageNumber = 1;
		}
		if(searchBy.equals("status")) {
		Page<Transportation> page = transportationPageService.getTransportationPageByStatus(pageNumber, value);
		int current = page.getNumber() + 1;
	    int begin = Math.max(1, current - 4);
	    int end = Math.min(begin + 10, page.getTotalPages());
	    model.addAttribute("page", page);
	    model.addAttribute("beginIndex", begin);
	    model.addAttribute("endIndex", end);
	    model.addAttribute("currentIndex", current);
	    model.addAttribute("value", value);
	    model.addAttribute("searchBy", searchBy);
		model.addAttribute("transportations", transportationService.findByStatus(value, new PageRequest(current-1, 10, Sort.Direction.DESC, "status")).getContent());
		}
		if(searchBy.equals("loadDate")) {
			Page<Transportation> page = transportationPageService.getTransportationPageByLoadDate(pageNumber, value);
			int current = page.getNumber() + 1;
		    int begin = Math.max(1, current - 4);
		    int end = Math.min(begin + 20, page.getTotalPages());
		    model.addAttribute("page", page);
		    model.addAttribute("beginIndex", begin);
		    model.addAttribute("endIndex", end);
		    model.addAttribute("currentIndex", current);
		    model.addAttribute("value", value);
		    model.addAttribute("searchBy", searchBy);
		    SimpleDateFormat formatter = new SimpleDateFormat("yy-MM-dd");
			String dateInString = value;
			java.util.Date utilDate = null;
			try {
				utilDate = formatter.parse(dateInString);
			} catch (ParseException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
			Date date = new java.sql.Date(utilDate.getTime());
			model.addAttribute("transportations", transportationService.findByLoadDate(date, new PageRequest(current-1, 10, Sort.Direction.DESC, "loadDate")).getContent());
		}
		if(searchBy.equals("unloadDate")) {
			Page<Transportation> page = transportationPageService.getTransportationPageByUnloadDate(pageNumber, value);
			int current = page.getNumber() + 1;
		    int begin = Math.max(1, current - 4);
		    int end = Math.min(begin + 10, page.getTotalPages());
		    model.addAttribute("page", page);
		    model.addAttribute("beginIndex", begin);
		    model.addAttribute("endIndex", end);
		    model.addAttribute("currentIndex", current);
		    model.addAttribute("value", value);
		    model.addAttribute("searchBy", searchBy);
		    SimpleDateFormat formatter = new SimpleDateFormat("yy-MM-dd");
			String dateInString = value;
			java.util.Date utilDate = null;
			try {
				utilDate = formatter.parse(dateInString);
			} catch (ParseException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
			Date date = new java.sql.Date(utilDate.getTime());
			model.addAttribute("transportations", transportationService.findByUnloadDate(date, new PageRequest(current-1, 10, Sort.Direction.DESC, "loadDate")).getContent());
		}
		if(searchBy.equals("carNumber")) {
			Page<Transportation> page = transportationPageService.getTransportationPageByCarNumber(pageNumber, value);
			int current = page.getNumber() + 1;
		    int begin = Math.max(1, current - 4);
		    int end = Math.min(begin + 10, page.getTotalPages());
		    model.addAttribute("page", page);
		    model.addAttribute("beginIndex", begin);
		    model.addAttribute("endIndex", end);
		    model.addAttribute("currentIndex", current);
		    model.addAttribute("value", value);
		    model.addAttribute("searchBy", searchBy);
			model.addAttribute("transportations", transportationService.findByCarCarNumber("%"+value+"%", new PageRequest(current-1, 10, Sort.Direction.DESC, "loadDate")).getContent());
		}
		if(searchBy.equals("phoneNumber")) {
			Page<Transportation> page = transportationPageService.getTransportationPageByPhoneNumber(pageNumber, value);
			int current = page.getNumber() + 1;
		    int begin = Math.max(1, current - 4);
		    int end = Math.min(begin + 10, page.getTotalPages());
		    model.addAttribute("page", page);
		    model.addAttribute("beginIndex", begin);
		    model.addAttribute("endIndex", end);
		    model.addAttribute("currentIndex", current);
		    model.addAttribute("value", value);
		    model.addAttribute("searchBy", searchBy);
			model.addAttribute("transportations", transportationService.findByPhoneNumber("%"+value+"%", new PageRequest(current-1, 10, Sort.Direction.DESC, "loadDate")).getContent());
		}
		if(searchBy.equals("productName")) {
			Page<Transportation> page = transportationPageService.getTransportationPageByProductName(pageNumber, value);
			int current = page.getNumber() + 1;
		    int begin = Math.max(1, current - 4);
		    int end = Math.min(begin + 10, page.getTotalPages());
		    model.addAttribute("page", page);
		    model.addAttribute("beginIndex", begin);
		    model.addAttribute("endIndex", end);
		    model.addAttribute("currentIndex", current);
		    model.addAttribute("value", value);
		    model.addAttribute("searchBy", searchBy);
			model.addAttribute("transportations", transportationService.findByProductName("%"+value+"%", new PageRequest(current-1, 10, Sort.Direction.DESC, "loadDate")).getContent());
		}
		if(searchBy.equals("route")) {
			String str1 = new String();
			String str2 = new String();
			char []arr = value.toCharArray();
			for(int i = 0; i < arr.length; i++) {
				if(arr[i]!=',') {
					str1 += arr[i];
				}
				else {
					for(int j = i+1; j < arr.length; j++) {
						str2 += arr[j];
					}
					break;
				}
			}
			Page<Transportation> page = transportationPageService.getTransportationPageByRoute(pageNumber, str1, str2);
			int current = page.getNumber() + 1;
		    int begin = Math.max(1, current - 4);
		    int end = Math.min(begin + 10, page.getTotalPages());
		    model.addAttribute("page", page);
		    model.addAttribute("beginIndex", begin);
		    model.addAttribute("endIndex", end);
		    model.addAttribute("currentIndex", current);
		    model.addAttribute("value", value);
		    model.addAttribute("searchBy", searchBy);
		    model.addAttribute("str1", str1);
		    model.addAttribute("str2", str2);
			model.addAttribute("transportations", transportationService.findByRoute(str1, str2, new PageRequest(current-1, 10, Sort.Direction.DESC, "loadDate")).getContent());
		}
		if(searchBy.equals("loadDateInterval")) {
			String str1 = new String();
			String str2 = new String();
			char []arr = value.toCharArray();
			for(int i = 0; i < arr.length; i++) {
				if(arr[i]!=',') {
					str1 += arr[i];
				}
				else {
					for(int j = i+1; j < arr.length; j++) {
						str2 += arr[j];
					}
					break;
				}
			}
			Page<Transportation> page = transportationPageService.getTransportationPageByLoadDateInterval(pageNumber, str1, str2);
			int current = page.getNumber() + 1;
		    int begin = Math.max(1, current - 4);
		    int end = Math.min(begin + 10, page.getTotalPages());
		    model.addAttribute("page", page);
		    model.addAttribute("beginIndex", begin);
		    model.addAttribute("endIndex", end);
		    model.addAttribute("currentIndex", current);
		    model.addAttribute("value", value);
		    model.addAttribute("searchBy", searchBy);
		    SimpleDateFormat formatter = new SimpleDateFormat("yy-MM-dd");
			String dateInString = str1;
			java.util.Date utilDate = null;
			try {
				utilDate = formatter.parse(dateInString);
			} catch (ParseException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
			Date date1 = new java.sql.Date(utilDate.getTime());
			dateInString = str2;
			try {
				utilDate = formatter.parse(dateInString);
			} catch (ParseException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
			Date date2 = new java.sql.Date(utilDate.getTime());
			model.addAttribute("transportations", transportationService.findByLoadDateInterval(date1, date2, new PageRequest(current-1, 10, Sort.Direction.DESC, "loadDate")).getContent());
		}
		if(searchBy.equals("driver")) {
			Page<Transportation> page = transportationPageService.getTransportationPageByDriverId(pageNumber, Integer.parseInt(value));
			int current = page.getNumber() + 1;
		    int begin = Math.max(1, current - 4);
		    int end = Math.min(begin + 10, page.getTotalPages());
		    model.addAttribute("page", page);
		    model.addAttribute("beginIndex", begin);
		    model.addAttribute("endIndex", end);
		    model.addAttribute("currentIndex", current);
		    model.addAttribute("value", value);
		    model.addAttribute("searchBy", searchBy);
			model.addAttribute("transportations", transportationService.findByDriverId(Integer.parseInt(value), new PageRequest(current-1, 10, Sort.Direction.DESC, "loadDate")).getContent());
		}
	    DateFormat shortDF = DateFormat.getDateInstance(DateFormat.SHORT);
	    model.addAttribute("dateFormat", shortDF);
		return "transportation-all-search";
	}
	
	@RequestMapping(value="/search", method = RequestMethod.GET, params={"page"})
	public String searchAllNullUnloadDate(Model model, @RequestParam("page") int pageNumber) {
		if(pageNumber < 1) {
			pageNumber = 1;
		}
		Page<Transportation> page = transportationPageService.getTransportationPageByNullUnloadDate(pageNumber);
		int current = page.getNumber() + 1;
	    int begin = Math.max(1, current - 4);
	    int end = Math.min(begin + 10, page.getTotalPages());
	    model.addAttribute("page", page);
	    model.addAttribute("beginIndex", begin);
	    model.addAttribute("endIndex", end);
	    model.addAttribute("currentIndex", current);
	    DateFormat shortDF = DateFormat.getDateInstance(DateFormat.SHORT);
	    model.addAttribute("dateFormat", shortDF);
		model.addAttribute("transportations", transportationService.findByNullUnloadDate(new PageRequest(current-1, 10, Sort.Direction.DESC, "loadDate")).getContent());
		return "transportation-all-search-null";
	}
	
	@RequestMapping(value="/getAllStatus", method = RequestMethod.GET)
	@ResponseBody
	public List<String> getAllStatus() {
		List<String> status = new ArrayList<String>();
		status.add("agree");
		status.add("load");
		status.add("unload");
		return status;
	}
	
	@RequestMapping(value="/getTransportationCountByLoad", method = RequestMethod.GET)
	@ResponseBody
	public int getTransportationCountByLoad(@RequestParam("loadDate1") Date loadDate1, @RequestParam("loadDate2") Date loadDate2, @RequestParam("address") String address) {
		Integer count = null;
		try {
			count = transportationService.findTransportationCountByLoad(loadDate1, loadDate2, address);
		}
		catch(NullPointerException ex) {
			return 0;
		}
		if(count.equals(null)) {
			return  0;
		}
		else {
			return count;
		}
	}
	
	@RequestMapping(value="/getTransportationCountByUnload", method = RequestMethod.GET)
	@ResponseBody
	public int getTransportationCountByUnload(@RequestParam("unloadDate1") Date unloadDate1, @RequestParam("unloadDate2") Date unloadDate2, @RequestParam("address") String address) {
		Integer count = null;
		try {
			count = transportationService.findTransportationCountByUnload(unloadDate1, unloadDate2, address);
		}
		catch(NullPointerException ex) {
			return 0;
		}
		if(count.equals(null)) {
			return  0;
		}
		else {
			return count;
		}
	}
	
	@RequestMapping(value="/count", method = RequestMethod.GET)
	public String countAllTransportations(Model model) {
		return "transportation-count";
	}
	
	@RequestMapping(value="/map", method = RequestMethod.GET)
	public String countDistanceAndCostsPetrol(Model model) {
		return "transportation-map";
	}
	
	@RequestMapping(value="/getProductSumByLoad", method = RequestMethod.GET)
	@ResponseBody
	public long getProductSumByLoad(@RequestParam("loadDate1") Date loadDate1, @RequestParam("loadDate2") Date loadDate2, @RequestParam("address") String address) {
		Long sum = null;
		try {
		sum = transportationService.findProductSumByLoad(loadDate1, loadDate2, address);
		}
		catch(NullPointerException ex) {
			return 0;
		}
		if(sum.equals(null)) {
			return  0;
		}
		else {
			return sum;
		}
	}
	
	@RequestMapping(value="/getProductSumByUnload", method = RequestMethod.GET)
	@ResponseBody
	public long getProductSumByUnload(@RequestParam("unloadDate1") Date unloadDate1, @RequestParam("unloadDate2") Date unloadDate2, @RequestParam("address") String address) {
		Long sum = null;
		try {
		sum = transportationService.findProductSumByUnload(unloadDate1, unloadDate2, address);
		}
		catch(NullPointerException ex) {
			return 0;
		}
		if(sum.equals(null)) {
			return  0;
		}
		else {
			return sum;
		}
	}
}
