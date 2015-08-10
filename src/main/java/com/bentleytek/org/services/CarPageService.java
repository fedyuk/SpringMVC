package com.bentleytek.org.services;

import org.springframework.data.domain.Page;
import com.bentleytek.org.models.Car;

public interface CarPageService {
	Page<Car> getCarPage(int pageNumber);
}
