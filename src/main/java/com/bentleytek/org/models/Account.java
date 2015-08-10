package com.bentleytek.org.models;


import javax.persistence.*;



@Entity
@Table(name="Account")
public class Account{
	
	/**
	 * 
	 */
	@GeneratedValue(strategy=GenerationType.IDENTITY)
	@Id
	@Column(name="accountId")
	private int accountId;
	
	@Column(name="email")
	private String email;
	
	@Column(name="password")
	private String password;
	
	public Account() {
	}
	
	public Account(String email, String password) {
		this.email = email;
		this.password = password;
	}

	public int getAccountId() {
		return accountId;
	}

	public void setAccountId(int accountId) {
		this.accountId = accountId;
	}

	public String getEmail() {
		return email;
	}

	public void setEmail(String email) {
		this.email = email;
	}

	public String getPassword() {
		return password;
	}

	public void setPassword(String password) {
		this.password = password;
	}

}
