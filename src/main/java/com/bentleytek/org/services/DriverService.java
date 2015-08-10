package com.bentleytek.org.services;

import java.util.List;

import org.springframework.data.domain.Page;
import org.springframework.data.domain.Pageable;

import com.bentleytek.org.models.Driver;

public interface DriverService {
	void addDriver(Driver driver);
	void deleteDriver(Integer id);
	Driver editDriver(Driver driver);
    List<Driver> findAll();
	Page<Driver> findAll(Pageable pageable);
	Driver findByDriverId(int id);
	List<Driver> findByLastName(String lastName);
	List<Driver> findByFirstName(String firstName);
	List<Driver> findAllDrivers();
	List<Driver> findAllDriversDetails();
}
