package com.bentleytek.org.models;

import java.util.List;

import javax.persistence.CascadeType;
import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.FetchType;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;
import javax.persistence.OneToMany;
import javax.persistence.Table;
import javax.validation.constraints.Min;

import org.codehaus.jackson.annotate.JsonIgnore;
import org.springframework.format.annotation.NumberFormat;
import org.springframework.format.annotation.NumberFormat.Style;

@Entity
@Table(name="Driver")
public class Driver {

	@GeneratedValue(strategy=GenerationType.IDENTITY)
	@Id
	@Column(name="driverId")
	private int driverId;
	
	@Column(name="lastName")
	private String lastName;
	
	@Column(name="firstName")
	private String firstName;
	
	@Column(name="middleName")
	private String middleName;
	
	@NumberFormat(style = Style.NUMBER) @Min(1)
	@Column(name="phoneNumber")
	private String phoneNumber;
	
	@ManyToOne(fetch = FetchType.EAGER)
	@JoinColumn(name="carId")
    private Car car;
	
	@OneToMany(mappedBy="driver", cascade=CascadeType.ALL)
	private List<Transportation> transportations;

	public String getLastName() {
		return lastName;
	}

	public void setLastName(String lastName) {
		this.lastName = lastName;
	}

	public String getFirstName() {
		return firstName;
	}

	public void setFirstName(String firstName) {
		this.firstName = firstName;
	}

	public String getMiddleName() {
		return middleName;
	}

	public void setMiddleName(String middleName) {
		this.middleName = middleName;
	}

	public String getPhoneNumber() {
		return phoneNumber;
	}

	public void setPhoneNumber(String phoneNumber) {
		this.phoneNumber = phoneNumber;
	}
	
	@JsonIgnore
	public Car getCar() {
		return car;
	}

	public void setCar(Car car) {
		this.car = car;
	}
	
	@JsonIgnore
	public List<Transportation> getTransportations() {
		return transportations;
	}

	public void setTransportations(List<Transportation> transportations) {
		this.transportations = transportations;
	}

	public int getDriverId() {
		return driverId;
	}

	public void setDriverId(int driverId) {
		this.driverId = driverId;
	}
}
