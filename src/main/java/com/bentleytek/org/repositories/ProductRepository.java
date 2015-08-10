package com.bentleytek.org.repositories;

import java.util.List;

import org.springframework.data.domain.Page;
import org.springframework.data.domain.Pageable;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;

import com.bentleytek.org.models.Product;

public interface ProductRepository extends JpaRepository<Product, Integer> {
	
    List<Product> findAll();
	
	Page<Product> findAll(Pageable pageable);
	
	Product findByProductId(int id);
	
	List<Product> findByName(String name);
	
	@Query("select p from Product p order by p.name")
	List<Product> findAllProducts();

}
