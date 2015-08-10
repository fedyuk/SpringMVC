package com.bentleytek.org.services;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.PageRequest;
import org.springframework.data.domain.Sort;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.bentleytek.org.models.Account;
import com.bentleytek.org.repositories.AccountRepository;

@Service
public class AccountPageServiceImpl implements AccountPageService {

	private static final int PAGE_SIZE = 10;
	
	@Autowired
	private AccountRepository repository;
	
	@Transactional
	public Page<Account> getAccountPage(int pageNumber) {
		 PageRequest request = new PageRequest(pageNumber - 1, PAGE_SIZE, Sort.Direction.ASC, "accountId");
		return repository.findAll(request);
	}

}
