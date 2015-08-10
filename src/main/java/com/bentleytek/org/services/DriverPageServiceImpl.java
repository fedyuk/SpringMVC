package com.bentleytek.org.services;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.PageRequest;
import org.springframework.data.domain.Sort;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.bentleytek.org.models.Driver;

import com.bentleytek.org.repositories.DriverRepository;

@Service
public class DriverPageServiceImpl implements DriverPageService {

    private static final int PAGE_SIZE = 10;
	
	@Autowired
	private DriverRepository repository;
	
	@Transactional
	public Page<Driver> getDriverPage(int pageNumber) {
		 PageRequest request = new PageRequest(pageNumber - 1, PAGE_SIZE, Sort.Direction.ASC, "driverId");
		return repository.findAll(request);
	}

}
