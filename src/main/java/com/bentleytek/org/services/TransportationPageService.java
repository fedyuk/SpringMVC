package com.bentleytek.org.services;

import org.springframework.data.domain.Page;

import com.bentleytek.org.models.Transportation;

public interface TransportationPageService {
	Page<Transportation> getTransportationPage(int pageNumber);
	Page<Transportation> getTransportationPageByStatus(int pageNumber, String status);
	Page<Transportation> getTransportationPageByLoadDate(int pageNumber, String date);
	Page<Transportation> getTransportationPageByUnloadDate(int pageNumber, String date);
	Page<Transportation> getTransportationPageByCarNumber(int pageNumber, String carNumber);
	Page<Transportation> getTransportationPageByPhoneNumber(int pageNumber, String phoneNumber);
	Page<Transportation> getTransportationPageByProductName(int pageNumber, String productName);
	Page<Transportation> getTransportationPageByRoute(int pageNumber, String loadAddress, String unloadAddress);
	Page<Transportation> getTransportationPageByLoadDateInterval(int pageNumber, String loadDate1, String loadDate2);
	Page<Transportation> getTransportationPageByDriverId(int pageNumber, int driverId);
	Page<Transportation> getTransportationPageByNullUnloadDate(int pageNumber);
}
