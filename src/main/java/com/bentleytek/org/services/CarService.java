package com.bentleytek.org.services;

import java.util.List;

import org.springframework.data.domain.Page;
import org.springframework.data.domain.Pageable;
import org.springframework.data.repository.query.Param;
import com.bentleytek.org.models.Car;

public interface CarService {
	void addCar(Car car);
	void deleteCar(Integer id);
	Car editCar(Car car);
	List<Car> findByBrand(@Param("name") String brand);
	List<Car> findByCarNumber(@Param("name") String carNumber);
	List<Car> findAll();	
    Page<Car> findAll(Pageable pageable);
    Car findByCarId(int id);
    List<Car> findAllBrands();
    List<Car> findAllCarNumbers();
    List<Car> findAllCarNumbersAndBrands();
}
