package com.bentleytek.org.models;

import java.math.BigDecimal;
import java.sql.Date;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.FetchType;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;
import javax.persistence.Table;
import javax.validation.constraints.DecimalMax;
import javax.validation.constraints.DecimalMin;

import org.springframework.format.annotation.NumberFormat;

@Entity
@Table(name="Transportation")
public class Transportation {

	@GeneratedValue(strategy=GenerationType.IDENTITY)
	@Id
	@Column(name="transportationId")
	private int transportationId;
	
	@Column(name="loadDate")
	private Date loadDate;
	
	@ManyToOne(fetch = FetchType.EAGER)
	@JoinColumn(name="loadAddressId")
    private Address loadAddress;
	
	@ManyToOne(fetch = FetchType.EAGER)
	@JoinColumn(name="unloadAddressId")
    private Address unloadAddress;
	
	@ManyToOne(fetch = FetchType.EAGER)
	@JoinColumn(name="productId")
    private Product product;
	
	@Column(name="countOfUnits")
	@NumberFormat(style = NumberFormat.Style.NUMBER)
	private long countOfUnits;
	
	@Column(name="weight", columnDefinition ="NUMERIC(7,2)")
	@DecimalMax(value = "9999999.99", message = "The decimal value can not be more than 9999999.99 ")
    @DecimalMin(value = "0.00", message = "The decimal value can not be less than 0.00 digit ")
	@NumberFormat(style = NumberFormat.Style.CURRENCY)
	private BigDecimal weight;
	
	@ManyToOne(fetch = FetchType.EAGER)
	@JoinColumn(name="driverId")
    private Driver driver;
	
	@Column(name="unloadDate")
	private Date unloadDate;
	
	@Column(name="status")
	private String status;
	
	@Column(name="totalPrice", columnDefinition ="NUMERIC(7,2)")
	@DecimalMax(value = "9999999.99", message = "The decimal value can not be more than 9999999.99 ")
    @DecimalMin(value = "0.00", message = "The decimal value can not be less than 0.00 digit ")
	@NumberFormat(style = NumberFormat.Style.CURRENCY)
	private BigDecimal totalPrice;
	
	@Column(name="note")
	private String note;
	
	public Date getLoadDate() {
		return loadDate;
	}

	public void setLoadDate(Date loadDate) {
		this.loadDate = loadDate;
	}

	public Address getLoadAddress() {
		return loadAddress;
	}

	public void setLoadAddress(Address loadAddress) {
		this.loadAddress = loadAddress;
	}

	public Address getUnloadAddress() {
		return unloadAddress;
	}

	public void setUnloadAddress(Address unloadAddress) {
		this.unloadAddress = unloadAddress;
	}

	public Product getProduct() {
		return product;
	}

	public void setProduct(Product product) {
		this.product = product;
	}

	public long getCountOfUnits() {
		return countOfUnits;
	}

	public void setCountOfUnits(long countOfUnits) {
		this.countOfUnits = countOfUnits;
	}

	public BigDecimal getWeight() {
		return weight;
	}

	public void setWeight(BigDecimal weight) {
		this.weight = weight;
	}

	public Driver getDriver() {
		return driver;
	}

	public void setDriver(Driver driver) {
		this.driver = driver;
	}

	public Date getUnloadDate() {
		return unloadDate;
	}

	public void setUnloadDate(Date unloadDate) {
		this.unloadDate = unloadDate;
	}

	public String getStatus() {
		return status;
	}

	public void setStatus(String status) {
		this.status = status;
	}

	public BigDecimal getTotalPrice() {
		return totalPrice;
	}

	public void setTotalPrice(BigDecimal totalPrice) {
		this.totalPrice = totalPrice;
	}

	public int getTransportationId() {
		return transportationId;
	}

	public void setTransportationId(int transportationId) {
		this.transportationId = transportationId;
	}

	public String getNote() {
		return note;
	}

	public void setNote(String note) {
		this.note = note;
	}
	
}
