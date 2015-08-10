package com.bentleytek.org.services;

import org.springframework.data.domain.Page;

import com.bentleytek.org.models.Driver;
public interface DriverPageService {
	Page<Driver> getDriverPage(int pageNumber);
}
