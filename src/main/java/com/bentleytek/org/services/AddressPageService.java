package com.bentleytek.org.services;

import org.springframework.data.domain.Page;
import com.bentleytek.org.models.Address;

public interface AddressPageService {
	Page<Address> getAddressPage(int pageNumber);
}
