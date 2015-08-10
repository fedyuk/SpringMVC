package com.bentleytek.org.repositories;

import java.sql.Date;
import java.util.List;

import org.springframework.data.domain.Page;
import org.springframework.data.domain.Pageable;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.query.Param;

import com.bentleytek.org.models.Transportation;

public interface TransportationRepository extends JpaRepository<Transportation, Integer> {
    
	List<Transportation> findAll();
	
	Page<Transportation> findAll(Pageable pageable);
	
	Transportation findByTransportationId(int id);
	
	List<Transportation> findByStatus(String status);
	
	Page<Transportation> findByStatus(String status, Pageable pageable);
	
    List<Transportation> findByLoadDate(Date date);
	
	Page<Transportation> findByLoadDate(Date date, Pageable pageable);
	
    List<Transportation> findByUnloadDate(Date date);
	
	Page<Transportation> findByUnloadDate(Date date, Pageable pageable);
	
	@Query("select t from Transportation t inner join t.driver d inner join d.car c where c.carNumber LIKE :number")
    List<Transportation> findByCarCarNumber(@Param("number") String carNumber);
	
	@Query("select t from Transportation t inner join t.driver d inner join d.car c where c.carNumber LIKE :number")
    Page<Transportation> findByCarCarNumber(@Param("number") String carNumber, Pageable pageable);
	
	@Query("select t from Transportation t inner join t.driver d where d.phoneNumber LIKE :number")
    List<Transportation> findByPhoneNumber(@Param("number") String phoneNumber);
	
	@Query("select t from Transportation t inner join t.driver d where d.phoneNumber LIKE :number")
    Page<Transportation> findByPhoneNumber(@Param("number") String phoneNumber, Pageable pageable);
	
	@Query("select t from Transportation t inner join t.product p where p.name LIKE :name")
    List<Transportation> findByProductName(@Param("name") String productName);
	
	@Query("select t from Transportation t inner join t.product p where p.name LIKE :name")
    Page<Transportation> findByProductName(@Param("name") String productName, Pageable pageable);
	
	@Query("select t from Transportation t inner join t.loadAddress la inner join t.unloadAddress ua where la.name=:loadAddress and ua.name=:unloadAddress")
    List<Transportation> findByRoute(@Param("loadAddress") String loadAddress, @Param("unloadAddress") String unloadAddress);
	
	@Query("select t from Transportation t inner join t.loadAddress la inner join t.unloadAddress ua where la.name=:loadAddress and ua.name=:unloadAddress")
    Page<Transportation> findByRoute(@Param("loadAddress") String loadAddress, @Param("unloadAddress") String unloadAddress, Pageable pageable);
	
	@Query("select t from Transportation t where t.loadDate between :loadDate1 and :loadDate2")
    List<Transportation> findByLoadDateInterval(@Param("loadDate1") Date loadDate1, @Param("loadDate2") Date loadDate2);
	
	@Query("select t from Transportation t where t.loadDate between :loadDate1 and :loadDate2")
    Page<Transportation> findByLoadDateInterval(@Param("loadDate1") Date loadDate1, @Param("loadDate2") Date loadDate2, Pageable pageable);
	
	@Query("select t from Transportation t inner join t.driver d where d.driverId = :id")
    List<Transportation> findByDriverId(@Param("id") int driverId);
	
	@Query("select t from Transportation t inner join t.driver d where d.driverId = :id")
    Page<Transportation> findByDriverId(@Param("id") int driverId, Pageable pageable);
	
	@Query("select t from Transportation t where t.unloadDate is null")
    List<Transportation> findByNullUnloadDate();
	
	@Query("select t from Transportation t where t.unloadDate is null")
    Page<Transportation> findByNullUnloadDate(Pageable pageable);
	
	@Query("select count(t) from Transportation t inner join t.loadAddress la where t.loadDate between :loadDate1 and :loadDate2 and la.name=:address and t.status!='agree'")
	int findTransportationCountByLoad(@Param("loadDate1") Date loadDate1, @Param("loadDate2") Date loadDate2, @Param("address") String address);
	
	@Query("select count(t) from Transportation t inner join t.unloadAddress ua where t.unloadDate between :unloadDate1 and :unloadDate2 and ua.name=:address and t.status='unload'")
	int findTransportationCountByUnload(@Param("unloadDate1") Date unloadDate1, @Param("unloadDate2") Date unloadDate2, @Param("address") String address);
	
	@Query("select sum(t.countOfUnits) from Transportation t inner join t.loadAddress la where t.loadDate between :loadDate1 and :loadDate2 and la.name=:address and t.status!='agree' ")
	long findProductSumByLoad(@Param("loadDate1") Date loadDate1, @Param("loadDate2") Date loadDate2, @Param("address") String address);
	
	@Query("select sum(t.countOfUnits) from Transportation t inner join t.unloadAddress ua where t.loadDate between :unloadDate1 and :unloadDate2 and ua.name=:address and t.status='unload' ")
	long findProductSumByUnload(@Param("unloadDate1") Date unloadDate1, @Param("unloadDate2") Date unloadDate2, @Param("address") String address);
}
