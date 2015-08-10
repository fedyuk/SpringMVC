package com.bentleytek.org.services;

import java.util.List;

import org.springframework.data.domain.Page;
import org.springframework.data.domain.Pageable;

import com.bentleytek.org.models.Product;

public interface ProductService {
	void addProduct(Product product);
	void deleteProduct(Integer id);
	Product editProduct(Product product);
    List<Product> findAll();
	Page<Product> findAll(Pageable pageable);
	Product findByProductId(int id);
	List<Product> findByName(String name);
	List<Product> findAllProducts();
}
