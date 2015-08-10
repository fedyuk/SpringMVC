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
@Table(name="Address")
public class Address {
	
	public Address() {
	}
	
	public Address(String name) {
		this.name = name;
	}
	
	@GeneratedValue(strategy=GenerationType.IDENTITY)
	@Id
	@Column(name="addressId")
	private int addressId;

	@Column(name="name")
	private String name;

	@OneToMany(mappedBy="loadAddress", cascade=CascadeType.ALL)
	private List<Transportation> loadTransportations;
	
	@OneToMany(mappedBy="unloadAddress", cascade=CascadeType.ALL)
	private List<Transportation> unloadTransportations;
	
	public String getName() {
		return name;
	}

	public void setName(String name) {
		this.name = name;
	}
	
	@JsonIgnore
	public List<Transportation> getLoadTransportations() {
		return loadTransportations;
	}

	public void setLoadTransportations(List<Transportation> loadTransportations) {
		this.loadTransportations = loadTransportations;
	}
	
	@JsonIgnore
	public List<Transportation> getUnloadTransportations() {
		return unloadTransportations;
	}

	public void setUnloadTransportations(List<Transportation> unloadTransportations) {
		this.unloadTransportations = unloadTransportations;
	}

	public int getAddressId() {
		return addressId;
	}

	public void setAddressId(int addressId) {
		this.addressId = addressId;
	}
}
