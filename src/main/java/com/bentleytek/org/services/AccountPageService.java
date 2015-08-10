package com.bentleytek.org.services;

import org.springframework.data.domain.Page;

import com.bentleytek.org.models.Account;

public interface AccountPageService {
	Page<Account> getAccountPage(int pageNumber);

}
