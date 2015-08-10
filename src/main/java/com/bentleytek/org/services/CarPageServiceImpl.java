package com.bentleytek.org.services;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.PageRequest;
import org.springframework.data.domain.Sort;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.bentleytek.org.models.Car;
import com.bentleytek.org.repositories.CarRepository;

@Service
public class CarPageServiceImpl implements CarPageService {

    private static final int PAGE_SIZE = 10;
	
	@Autowired
	private CarRepository repository;
	
	@Transactional
	public Page<Car> getCarPage(int pageNumber) {
		PageRequest request = new PageRequest(pageNumber - 1, PAGE_SIZE, Sort.Direction.ASC, "carId");
		return repository.findAll(request);
	}

}
