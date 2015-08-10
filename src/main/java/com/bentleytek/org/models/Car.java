package com.bentleytek.org.models;

import java.util.List;

import javax.persistence.CascadeType;
import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.OneToMany;
import javax.persistence.Table;

import org.codehaus.jackson.annotate.JsonIgnore;

@Entity
@Table(name="Car")
public class Car {
	
	@GeneratedValue(strategy=GenerationType.IDENTITY)
	@Id
	@Column(name="carId")
	private int carId;
	
	@Column(name="brand")
	private String brand;
	
	@Column(name="carNumber")
	private String carNumber;
	
	@Column(name="trailerNumber")
	private String trailerNumber;
	
	@Column(name="directorPhoneNumber")
	private String directorPhoneNumber;
	
	@OneToMany(mappedBy="car", cascade=CascadeType.ALL)
	private List<Driver> drivers;
	
	public Car() {
	}
	
	public Car(String brand, String carNumber) {
		this.brand = brand;
		this.carNumber = carNumber;
	}

	public String getBrand() {
		return brand;
	}

	public void setBrand(String brand) {
		this.brand = brand;
	}

	public String getCarNumber() {
		return carNumber;
	}

	public void setCarNumber(String carNumber) {
		this.carNumber = carNumber;
	}
	
	@JsonIgnore
	public List<Driver> getDrivers() {
		return drivers;
	}

	public void setDrivers(List<Driver> drivers) {
		this.drivers = drivers;
	}

	public int getCarId() {
		return carId;
	}

	public void setCarId(int carId) {
		this.carId = carId;
	}

	public String getTrailerNumber() {
		return trailerNumber;
	}

	public void setTrailerNumber(String trailerNumber) {
		this.trailerNumber = trailerNumber;
	}

	public String getDirectorPhoneNumber() {
		return directorPhoneNumber;
	}

	public void setDirectorPhoneNumber(String directorPhoneNumber) {
		this.directorPhoneNumber = directorPhoneNumber;
	}

}
