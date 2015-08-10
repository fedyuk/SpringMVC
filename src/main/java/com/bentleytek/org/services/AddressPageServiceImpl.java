package com.bentleytek.org.services;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.PageRequest;
import org.springframework.data.domain.Sort;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.bentleytek.org.models.Address;
import com.bentleytek.org.repositories.AddressRepository;

@Service
public class AddressPageServiceImpl implements AddressPageService {

	private static final int PAGE_SIZE = 10;
	
	@Autowired
	private AddressRepository repository;
	
	@Transactional
	public Page<Address> getAddressPage(int pageNumber) {
		 PageRequest request = new PageRequest(pageNumber - 1, PAGE_SIZE, Sort.Direction.ASC, "name");
		 return repository.findAll(request);
	}
}
