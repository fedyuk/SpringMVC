package com.bentleytek.org.repositories;

import java.util.List;

import org.springframework.data.domain.Page;
import org.springframework.data.domain.Pageable;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;
import com.bentleytek.org.models.Car;

public interface CarRepository extends JpaRepository<Car, Integer> {

    List<Car> findByBrand(String brand);
	
    List<Car> findByCarNumber(String carNumber);
	
	List<Car> findAll();
	
	Page<Car> findAll(Pageable pageable);
	
	Car findByCarId(int id);
	
	@Query("select brand from Car order by brand")
	List<Car> findAllBrands();
	
	@Query("select carNumber from Car order by carNumber")
	List<Car> findAllCarNumbers();
	
	@Query("select c from Car c order by c.brand")
	List<Car> findAllCarNumbersAndBrands();
}
