package com.bentleytek.org.services;

import java.sql.Date;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.Pageable;
import org.springframework.stereotype.Service;

import com.bentleytek.org.models.Transportation;
import com.bentleytek.org.repositories.TransportationRepository;

@Service
public class TransportationServiceImpl implements TransportationService {

	@Autowired
	TransportationRepository repository;
	@Override
	public void addTransportation(Transportation transportation) {
		repository.save(transportation);

	}

	@Override
	public void deleteTransportation(int id) {
		repository.delete(id);

	}

	@Override
	public Transportation editTransportation(Transportation transportation) {
		return repository.saveAndFlush(transportation);
	}

	@Override
	public List<Transportation> findAll() {
		return repository.findAll();
	}

	@Override
	public Page<Transportation> findAll(Pageable pageable) {
		return repository.findAll(pageable);
	}

	@Override
	public Transportation findByTransportationId(int id) {
		return repository.findByTransportationId(id);
	}
	
	@Override
	public List<Transportation> findByStatus(String status) {
		return repository.findByStatus(status);
	}
	
	@Override
	public Page<Transportation> findByStatus(String status, Pageable pageable) {
		return repository.findByStatus(status, pageable);
	}
	
	@Override
	public List<Transportation> findByLoadDate(Date date) {
		return repository.findByLoadDate(date);
	}
	
	@Override
	public Page<Transportation> findByLoadDate(Date date, Pageable pageable) {
		return repository.findByLoadDate(date, pageable);
	}
	
	@Override
	public List<Transportation> findByUnloadDate(Date date) {
		return repository.findByUnloadDate(date);
	}
	
	@Override
	public Page<Transportation> findByUnloadDate(Date date, Pageable pageable) {
		return repository.findByUnloadDate(date, pageable);
	}
	
	@Override
	public List<Transportation> findByCarCarNumber(String carNumber) {
		return repository.findByCarCarNumber(carNumber);
	}
	
	@Override
	public Page<Transportation> findByCarCarNumber(String carNumber, Pageable pageable) {
		return repository.findByCarCarNumber(carNumber, pageable);
	}
	
	@Override
	public List<Transportation> findByPhoneNumber(String phoneNumber) {
		return repository.findByCarCarNumber(phoneNumber);
	}
	
	@Override
	public Page<Transportation> findByPhoneNumber(String phoneNumber, Pageable pageable) {
		return repository.findByPhoneNumber(phoneNumber, pageable);
	}

	@Override
	public List<Transportation> findByProductName(String productName) {
		return repository.findByPhoneNumber(productName);
	}
	
	@Override
	public Page<Transportation> findByProductName(String productName, Pageable pageable) {
		return repository.findByProductName(productName, pageable);
	}
	
	@Override
	public List<Transportation> findByRoute(String loadAddress, String unloadAddress) {
		return repository.findByRoute(loadAddress, unloadAddress);
	}
	
	@Override
	public Page<Transportation> findByRoute(String loadAddress, String unloadAddress, Pageable pageable) {
		return repository.findByRoute(loadAddress, unloadAddress, pageable);
	}
	
	@Override
	public List<Transportation> findByLoadDateInterval(Date  loadDate1, Date loadDate2) {
		return repository.findByLoadDateInterval(loadDate1, loadDate2);
	}
	
	@Override
	public Page<Transportation> findByLoadDateInterval(Date  loadDate1, Date loadDate2, Pageable pageable) {
		return repository.findByLoadDateInterval(loadDate1, loadDate2, pageable);
	}
	
	@Override
	public List<Transportation> findByDriverId(int driverId) {
		return repository.findByDriverId(driverId);
	}
	
	@Override
	public Page<Transportation> findByDriverId(int driverId, Pageable pageable) {
		return repository.findByDriverId(driverId, pageable);
	}
	
	@Override
	public List<Transportation> findByNullUnloadDate() {
		return repository.findByNullUnloadDate();
	}
	
	@Override
	public Page<Transportation> findByNullUnloadDate(Pageable pageable) {
		return repository.findByNullUnloadDate(pageable);
	}
	
	@Override
	public int findTransportationCountByLoad(Date loadDate1, Date loadDate2, String address) {
		return repository.findTransportationCountByLoad(loadDate1, loadDate2, address);
	}
	
	@Override
	public int findTransportationCountByUnload(Date unloadDate1, Date unloadDate2, String address) {
		return repository.findTransportationCountByUnload(unloadDate1, unloadDate2, address);
	}
	
	@Override
	public long findProductSumByLoad(Date loadDate1, Date loadDate2, String address) {
		return repository.findProductSumByLoad(loadDate1, loadDate2, address);
	}
	
	@Override
	public long findProductSumByUnload(Date unloadDate1, Date unloadDate2, String address) {
		return repository.findProductSumByUnload(unloadDate1, unloadDate2, address);
	}
}
