package com.bentleytek.org.services;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.Pageable;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;



//import com.jpa.test.dao.UserDao;
import com.bentleytek.org.models.Account;
import com.bentleytek.org.repositories.AccountRepository;


@Service
public class AccountServiceImpl implements AccountService {
	
	@Autowired
	private AccountRepository repository;
	
	
	@Transactional
	public void addAccount(Account account)
	{
		repository.save(account);
	}
	@Transactional
	public void deleteAccount(Integer id)
	{
		repository.delete(id);
	}
	@Transactional
	public List<Account> findByEmail(String email)
	{
		return repository.findByEmail(email);
	}
	@Transactional
	public List<Account> findAll()
	{
		return repository.findAll();
	}
	
	@Transactional
	public Page<Account> findAll(Pageable pageable)
	{
		return repository.findAll(pageable);
	}
	
	@Transactional
	public Account findByAccountId(int id)
	{
		return repository.findByAccountId(id);
	}
	@Transactional
	public Account editAccount(Account account)
	{
		return repository.saveAndFlush(account);
	}
}
