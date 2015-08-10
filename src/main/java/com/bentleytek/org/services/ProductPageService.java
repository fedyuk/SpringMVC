package com.bentleytek.org.services;

import org.springframework.data.domain.Page;

import com.bentleytek.org.models.Product;

public interface ProductPageService {
	Page<Product> getProductPage(int pageNumber);

}
