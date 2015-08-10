package com.bentleytek.org.services;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.Pageable;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.bentleytek.org.models.Car;
import com.bentleytek.org.repositories.CarRepository;

@Service
public class CarServiceImpl implements CarService {
	
	@Autowired
	CarRepository repository;
	
	@Transactional
	public void addCar(Car car) {
		repository.save(car);

	}

	@Transactional
	public void deleteCar(Integer id) {
		repository.delete(id);

	}

	@Transactional
	public Car editCar(Car car) {
		return repository.saveAndFlush(car);
	}

	@Transactional
	public List<Car> findByBrand(String brand) {
		return repository.findByBrand(brand);
	}

	@Override
	public List<Car> findByCarNumber(String carNumber) {
		return repository.findByCarNumber(carNumber);
	}

	@Transactional
	public List<Car> findAll() {
		return repository.findAll();
	}

	@Transactional
	public Page<Car> findAll(Pageable pageable) {
		return repository.findAll(pageable);
	}

	@Transactional
	public Car findByCarId(int id) {
		return repository.findByCarId(id);
	}

	@Transactional
	public List<Car> findAllBrands() {
		return repository.findAllBrands();
	}

	@Transactional
	public List<Car> findAllCarNumbers() {
		return repository.findAllCarNumbers();
	}
	
	@Transactional
	public List<Car> findAllCarNumbersAndBrands() {
		return repository.findAllCarNumbersAndBrands();
	}

}
