package com.bentleytek.org.services;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.Pageable;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.bentleytek.org.models.Address;
import com.bentleytek.org.repositories.AddressRepository;

@Service
public class AddressServiceImpl implements AddressService {

	@Autowired
	AddressRepository  repository;
	
	@Transactional
	public void addAddress(Address address) {
		repository.save(address);

	}

	@Transactional
	public void deleteAddress(Integer id) {
		repository.delete(id);

	}

	@Transactional
	public Address editAddress(Address address) {
		return repository.saveAndFlush(address);
	}

	@Transactional
	public List<Address> findByName(String name) {
		return repository.findByName(name);
	}

	@Transactional
	public List<Address> findAll() {
		return repository.findAll();
	}

	@Transactional
	public Page<Address> findAll(Pageable pageable) {
		return repository.findAll(pageable);
	}

	@Transactional
	public Address findByAddressId(int id) {
		return repository.findByAddressId(id);
	}

	@Transactional
	public List<Address> findAllAddresses() {
		return repository.findAllAddresses();
	}

}
