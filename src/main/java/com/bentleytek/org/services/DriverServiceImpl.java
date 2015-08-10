package com.bentleytek.org.services;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.Pageable;
import org.springframework.stereotype.Service;

import com.bentleytek.org.models.Driver;
import com.bentleytek.org.repositories.DriverRepository;

@Service
public class DriverServiceImpl implements DriverService {

	@Autowired
	DriverRepository repository;
	
	@Override
	public void addDriver(Driver driver) {
		repository.save(driver);

	}

	@Override
	public void deleteDriver(Integer id) {
		repository.delete(id);

	}

	@Override
	public Driver editDriver(Driver driver) {
		return repository.saveAndFlush(driver);
	}

	@Override
	public List<Driver> findAll() {
		return repository.findAll();
	}

	@Override
	public Page<Driver> findAll(Pageable pageable) {
		return repository.findAll(pageable);
	}

	@Override
	public Driver findByDriverId(int id) {
		return repository.findByDriverId(id);
	}
	
	@Override
	public List<Driver> findByLastName(String lastName) {
		return repository.findByLastName(lastName);
	}
	
	@Override
	public List<Driver> findByFirstName(String firstName) {
		return repository.findByFirstName(firstName);
	}
	
	@Override
	public List<Driver> findAllDrivers() {
		return repository.findAllDrivers();
	}
	
	@Override
	public List<Driver> findAllDriversDetails() {
		return repository.findAllDriversDetails();
	}

}
