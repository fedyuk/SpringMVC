package com.bentleytek.org.services;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.PageRequest;
import org.springframework.data.domain.Sort;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.bentleytek.org.models.Product;
import com.bentleytek.org.repositories.ProductRepository;

@Service
public class ProductPageServiceImpl implements ProductPageService {

	private static final int PAGE_SIZE = 10;
	
	@Autowired
	ProductRepository repository;
	
	@Transactional
	public Page<Product> getProductPage(int pageNumber) {
		PageRequest request = new PageRequest(pageNumber - 1, PAGE_SIZE, Sort.Direction.ASC, "productId");
		return repository.findAll(request);
	}

}
