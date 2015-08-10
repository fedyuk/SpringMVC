package com.bentleytek.org.repositories;

import java.util.List;

import org.springframework.data.domain.Page;
import org.springframework.data.domain.Pageable;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;

import com.bentleytek.org.models.Driver;
public interface DriverRepository extends JpaRepository<Driver, Integer> {

    List<Driver> findAll();
	
	Page<Driver> findAll(Pageable pageable);
	
	Driver findByDriverId(int id);
	
	List<Driver> findByLastName(String lastName);
	
	List<Driver> findByFirstName(String firstName);
	
	@Query("select d from Driver d order by d.lastName")
	List<Driver> findAllDrivers();
	
	@Query("select d.driverId, d.lastName, d.firstName, d.middleName from Driver d order by d.lastName")
	List<Driver> findAllDriversDetails();

}
