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
@Table(name="Product")
public class Product {
	
	@GeneratedValue(strategy=GenerationType.IDENTITY)
	@Id
	@Column(name="productId")
	private int productId;
	
	@Column(name="name")
	private String name;
	
	@OneToMany(mappedBy="product", cascade=CascadeType.ALL)
	private List<Transportation> transportations;
	
	public Product() {
	}
	
	public Product(String name) {
		this.name = name;
	}

	public String getName() {
		return name;
	}

	public void setName(String name) {
		this.name = name;
	}
	
	@JsonIgnore
	public List<Transportation> getTransportations() {
		return transportations;
	}

	public void setTransportations(List<Transportation> transportations) {
		this.transportations = transportations;
	}

	public int getProductId() {
		return productId;
	}

	public void setProductId(int productId) {
		this.productId = productId;
	}

}
