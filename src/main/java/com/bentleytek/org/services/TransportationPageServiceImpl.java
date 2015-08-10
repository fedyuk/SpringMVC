package com.bentleytek.org.services;

import java.sql.Date;
import java.text.ParseException;
import java.text.SimpleDateFormat;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.PageRequest;
import org.springframework.data.domain.Sort;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.bentleytek.org.models.Transportation;
import com.bentleytek.org.repositories.TransportationRepository;

@Service
public class TransportationPageServiceImpl implements TransportationPageService {

	private static final int PAGE_SIZE = 10;
	
	@Autowired
	TransportationRepository repository;
	
	@Transactional
	public Page<Transportation> getTransportationPage(int pageNumber) {
		PageRequest request = new PageRequest(pageNumber - 1, PAGE_SIZE, Sort.Direction.DESC, "loadDate");
		return repository.findAll(request);
	}
	
	@Transactional
	public Page<Transportation> getTransportationPageByStatus(int pageNumber, String status) {
		PageRequest request = new PageRequest(pageNumber - 1, PAGE_SIZE, Sort.Direction.DESC, "loadDate");
		return repository.findByStatus(status, request);
	}
	
	@Transactional
	public Page<Transportation> getTransportationPageByLoadDate(int pageNumber, String date) {
		PageRequest request = new PageRequest(pageNumber - 1, PAGE_SIZE, Sort.Direction.DESC, "loadDate");
		 SimpleDateFormat formatter = new SimpleDateFormat("yyyy-MM-dd");
			String dateInString = date;
			java.util.Date utilDate = null;
			try {
				utilDate = formatter.parse(dateInString);
			} catch (ParseException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
			Date searchDate = new java.sql.Date(utilDate.getTime());
		return repository.findByLoadDate(searchDate, request);
	}
	
	@Transactional
	public Page<Transportation> getTransportationPageByUnloadDate(int pageNumber, String date) {
		PageRequest request = new PageRequest(pageNumber - 1, PAGE_SIZE, Sort.Direction.DESC, "loadDate");
		 SimpleDateFormat formatter = new SimpleDateFormat("yyyy-MM-dd");
			String dateInString = date;
			java.util.Date utilDate = null;
			try {
				utilDate = formatter.parse(dateInString);
			} catch (ParseException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
			Date searchDate = new java.sql.Date(utilDate.getTime());
		return repository.findByUnloadDate(searchDate, request);
	}
	
	@Transactional
	public Page<Transportation> getTransportationPageByCarNumber(int pageNumber, String carNumber) {
		PageRequest request = new PageRequest(pageNumber - 1, PAGE_SIZE, Sort.Direction.DESC, "loadDate");
		return repository.findByCarCarNumber("%"+carNumber+"%", request);
	}
	
	@Transactional
	public Page<Transportation> getTransportationPageByPhoneNumber(int pageNumber, String phoneNumber) {
		PageRequest request = new PageRequest(pageNumber - 1, PAGE_SIZE, Sort.Direction.DESC, "loadDate");
		return repository.findByPhoneNumber("%"+phoneNumber+"%", request);
	}
	
	@Transactional
	public Page<Transportation> getTransportationPageByProductName(int pageNumber, String productName) {
		PageRequest request = new PageRequest(pageNumber - 1, PAGE_SIZE, Sort.Direction.DESC, "loadDate");
		return repository.findByProductName("%"+productName+"%", request);
	}

	@Transactional
	public Page<Transportation> getTransportationPageByRoute(int pageNumber, String loadAddress, String unloadAddress) {
		PageRequest request = new PageRequest(pageNumber - 1, PAGE_SIZE, Sort.Direction.DESC, "loadDate");
		return repository.findByRoute(loadAddress, unloadAddress, request);
	}
	
	@Transactional
	public Page<Transportation> getTransportationPageByLoadDateInterval(int pageNumber, String loadDate1, String loadDate2) {
		PageRequest request = new PageRequest(pageNumber - 1, PAGE_SIZE, Sort.Direction.DESC, "loadDate");
		 SimpleDateFormat formatter = new SimpleDateFormat("yyyy-MM-dd");
			String dateInString = loadDate1;
			java.util.Date utilDate = null;
			try {
				utilDate = formatter.parse(dateInString);
			} catch (ParseException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
			Date searchDate = new java.sql.Date(utilDate.getTime());
			dateInString = loadDate2;
			try {
				utilDate = formatter.parse(dateInString);
			} catch (ParseException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
			Date searchDate2 = new java.sql.Date(utilDate.getTime());
		return repository.findByLoadDateInterval(searchDate, searchDate2, request);
	}
	
	@Transactional
	public Page<Transportation> getTransportationPageByDriverId(int pageNumber, int driverId) {
		PageRequest request = new PageRequest(pageNumber - 1, PAGE_SIZE, Sort.Direction.DESC, "loadDate");
		return repository.findByDriverId(driverId, request);
	}
	
	@Transactional
	public Page<Transportation> getTransportationPageByNullUnloadDate(int pageNumber) {
		PageRequest request = new PageRequest(pageNumber - 1, PAGE_SIZE, Sort.Direction.DESC, "loadDate");
		return repository.findByNullUnloadDate(request);
	}
}
