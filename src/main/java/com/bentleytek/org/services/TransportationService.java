package com.bentleytek.org.services;

import java.sql.Date;
import java.util.List;

import org.springframework.data.domain.Page;
import org.springframework.data.domain.Pageable;

import com.bentleytek.org.models.Transportation;

public interface TransportationService {
	void addTransportation(Transportation transportation);
	void deleteTransportation(int id);
	Transportation editTransportation(Transportation transportation);
    List<Transportation> findAll();
	Page<Transportation> findAll(Pageable pageable);
	Transportation findByTransportationId(int id);
	List<Transportation> findByStatus(String status);
	Page<Transportation> findByStatus(String status, Pageable pageable);
	List<Transportation> findByLoadDate(Date date);
	Page<Transportation> findByLoadDate(Date date, Pageable pageable);
	List<Transportation> findByUnloadDate(Date date);
	Page<Transportation> findByUnloadDate(Date date, Pageable pageable);
	List<Transportation> findByCarCarNumber(String carNumber);
	Page<Transportation> findByCarCarNumber(String carNumber, Pageable pageable);
	List<Transportation> findByPhoneNumber(String phoneNumber);
	Page<Transportation> findByPhoneNumber(String phoneNumber, Pageable pageable);
	List<Transportation> findByProductName(String productName);
	Page<Transportation> findByProductName(String productName, Pageable pageable);
	List<Transportation> findByRoute(String loadAddress, String unloadAddress);
	Page<Transportation> findByRoute(String loadAddress, String unloadAddress, Pageable pageable);
	List<Transportation> findByLoadDateInterval(Date loadDate1, Date loadDate2);
	Page<Transportation> findByLoadDateInterval(Date loadDate1, Date loadDate2, Pageable pageable);
	List<Transportation> findByDriverId(int driverId);
	Page<Transportation> findByDriverId(int driverId, Pageable pageable);
	List<Transportation> findByNullUnloadDate();
	Page<Transportation> findByNullUnloadDate(Pageable pageable);
	int findTransportationCountByLoad(Date loadDate1, Date loadDate2, String address);
	int findTransportationCountByUnload(Date unloadDate1, Date unloadDate2, String address);
	long findProductSumByLoad(Date loadDate1, Date loadDate2, String address);
	long findProductSumByUnload(Date unloadDate1, Date unloadDate2, String address);
}
