package com.bentleytek.org.services;

import java.util.List;

import org.springframework.data.domain.Page;
import org.springframework.data.domain.Pageable;
import org.springframework.data.repository.query.Param;

import com.bentleytek.org.models.Address;

public interface AddressService {
	void addAddress(Address address);
	void deleteAddress(Integer id);
	Address editAddress(Address address);
	List<Address> findByName(@Param("name") String name);
	List<Address> findAll();
	Page<Address> findAll(Pageable pageable);
	Address findByAddressId(int id);
	List<Address> findAllAddresses();
}
