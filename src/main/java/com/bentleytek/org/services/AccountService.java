package com.bentleytek.org.services;

import java.util.List;

import org.springframework.data.domain.Page;
import org.springframework.data.domain.Pageable;

import com.bentleytek.org.models.Account;

public interface AccountService {
	void addAccount(Account account);
	void deleteAccount(Integer id);
	List<Account> findByEmail(String email);
	List<Account> findAll();
	Page<Account> findAll(Pageable pageable);
	Account findByAccountId(int id);
	Account editAccount(Account account);
}
