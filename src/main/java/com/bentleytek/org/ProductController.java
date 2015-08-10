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

import com.bentleytek.org.services.ProductPageService;
import com.bentleytek.org.services.ProductService;
import com.bentleytek.org.models.Product;

@EnableWebMvc
@Controller
@RequestMapping(value = "/product")
public class ProductController {
	
	@Autowired
	ProductService productService;
	
	@Autowired
	ProductPageService productPageService;
	@RequestMapping(value="/all", method = RequestMethod.GET)
	public String showhAllProducts(Model model, @RequestParam("page") int pageNumber) {
		if(pageNumber < 1) {
			pageNumber = 1;
		}
		Page<Product> page = productPageService.getProductPage(pageNumber);
		int current = page.getNumber() + 1;
	    int begin = Math.max(1, current - 4);
	    int end = Math.min(begin + 20, page.getTotalPages());
	    model.addAttribute("page", page);
	    model.addAttribute("beginIndex", begin);
	    model.addAttribute("endIndex", end);
	    model.addAttribute("currentIndex", current);
		model.addAttribute("products", productService.findAll(new PageRequest(current-1, 20, Sort.Direction.ASC, "name")).getContent());
		return "product-all";
	}
	
	@RequestMapping(value="/add", method = RequestMethod.GET)
	public String addProduct(Model model) {
		model.addAttribute("product", new Product());
		return "product-add";
	}
	
	@RequestMapping(value="/add.do", method=RequestMethod.POST)
	public String addProductActions(@ModelAttribute("product") @Validated Product product, BindingResult bindingResult, Model model){
		if(bindingResult.hasErrors()) {
			model.addAttribute("product", product);
	        return "product-add";
		}
		if(!productService.findByName(product.getName()).isEmpty()) {
			 model.addAttribute("product", product);
			 bindingResult.rejectValue("name", "error.product", "Choose another product");
			 model.addAttribute(bindingResult.getModel());
			 return "product-add";
		}
		productService.addProduct(product);
		return "redirect:/product/all?page=1";
	}
	
	@RequestMapping(value = "/delete", method = RequestMethod.GET)
	public String deleteProduct(Model model, @RequestParam(value = "productId", required = true) int id) {
		if(id > 0) {
			productService.deleteProduct(id);
		}
		return "redirect:/product/all?page=1";
	}
	
	@RequestMapping(value = "/edit", method = RequestMethod.GET)
	public String editProduct(Model model, @RequestParam(value = "productId", required = true) int id) {
		model.addAttribute("product", productService.findByProductId(id));
		return "product-edit";
	}
	
	@RequestMapping(value="/edit.do", method=RequestMethod.POST)
	public String editProductActions(@ModelAttribute("product") @Validated Product product, BindingResult bindingResult, Model model) {
		if(bindingResult.hasErrors()) {
			model.addAttribute("product", product);
	        return "product-edit";
		}
		if(!productService.findByName(product.getName()).isEmpty()) {
			 model.addAttribute("product", product);
			 bindingResult.rejectValue("name", "error.product", "Choose another product");
			 model.addAttribute(bindingResult.getModel());
			 return "product-edit";
		}
		productService.editProduct(product);
		return "redirect:/product/all?page=1";
	}

	@RequestMapping(value="/getAllProducts", method = RequestMethod.GET)
	@ResponseBody
	public List<Product> getAllProducts() {
		return productService.findAllProducts();
	}

}
