package com.bentleytek.org.services;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.Pageable;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.bentleytek.org.models.Product;
import com.bentleytek.org.repositories.ProductRepository;

@Service
public class ProductServiceImpl implements ProductService {

	@Autowired 
	ProductRepository repository;
	
	@Transactional
	public void addProduct(Product product) {
		repository.save(product);

	}

	@Transactional
	public void deleteProduct(Integer id) {
		repository.delete(id);

	}

	@Transactional
	public Product editProduct(Product product) {
		return repository.saveAndFlush(product);
	}

	@Transactional
	public List<Product> findAll() {
		return repository.findAll();
	}

	@Transactional
	public Page<Product> findAll(Pageable pageable) {
		return repository.findAll(pageable);
	}

	@Transactional
	public Product findByProductId(int id) {
		return repository.findByProductId(id);
	}
	
	@Transactional
	public List<Product> findByName(String name) {
		return repository.findByName(name);
	}
	
	@Transactional
	public List<Product> findAllProducts() {
		return repository.findAllProducts();
	}

}
