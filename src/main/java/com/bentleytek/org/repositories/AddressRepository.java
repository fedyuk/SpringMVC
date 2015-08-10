package com.bentleytek.org.repositories;

import java.util.List;

import org.springframework.data.domain.Page;
import org.springframework.data.domain.Pageable;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;

import com.bentleytek.org.models.Address;

public interface AddressRepository extends JpaRepository<Address, Integer> {

    List<Address> findByName(String name);
	
	List<Address> findAll();
	
	Page<Address> findAll(Pageable pageable);
	
	Address findByAddressId(int id);
	
	@Query("select a from Address a order by a.name")
	List<Address> findAllAddresses();
}
