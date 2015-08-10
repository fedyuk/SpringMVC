package com.bentleytek.org.repositories;

import java.util.List;

import org.springframework.data.domain.Page;
import org.springframework.data.domain.Pageable;
import org.springframework.data.jpa.repository.JpaRepository;

import com.bentleytek.org.models.Account;

public interface AccountRepository extends JpaRepository<Account, Integer> {
	
	List<Account> findByEmail(String email);
	
	List<Account> findAll();
	
	Page<Account> findAll(Pageable pageable);
	
	Account findByAccountId(int id);
}

