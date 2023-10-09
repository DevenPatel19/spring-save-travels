package com.codingdojo.springsavetravels.models;




import java.util.Date;

import org.springframework.format.annotation.DateTimeFormat;

import jakarta.persistence.Column;
import jakarta.persistence.Entity;
import jakarta.persistence.GeneratedValue;
import jakarta.persistence.GenerationType;
import jakarta.persistence.Id;
import jakarta.persistence.PrePersist;
import jakarta.persistence.PreUpdate;
import jakarta.persistence.Table;
import jakarta.validation.constraints.Min;
import jakarta.validation.constraints.NotNull;
import jakarta.validation.constraints.Size;

@Entity
@Table(name="expenses")
public class Expense {
	@Id
	@GeneratedValue(strategy=GenerationType.IDENTITY)
	private Long Id;
	
	@NotNull
	@Size(min=1, max=255, message="Expense name must be at least 1 character")
	private String name;
	
	@NotNull
	@Size(min=1, max=255, message="Vendor name must be at least 1 character")
	private String vendor;
	
	@NotNull
	@Min(0)
	private Long amount;
	
	@NotNull
	@Size(min=1, max=255, message="Description must not be empty")
	private String description;
	
	public @NotNull @Min(0) Long getAmount() {
		return amount;
	}

	public void setAmount(@NotNull @Min(0) Long amount) {
		this.amount = amount;
	}

	@Column(updatable=false)
	@DateTimeFormat(pattern="yy-MM-dd")
	private Date createdAt;
	
	@DateTimeFormat(pattern="yy-MM-dd")
	private Date updateAt;
	
	@PrePersist
	protected void onCreate() {
		this.createdAt = new Date();
	}	
	
	@PreUpdate
	protected void onUpdate() {
		this.updateAt = new Date();
	}


	public Expense() {};
	
	public Expense(String name,String vendor,@NotNull @Min(0) Long amount,String description) {
		
		this.name = name;
		this.vendor = vendor;
		this.amount = amount;
		this.description = description;
		
		
	}

	public Long getId() {
		return Id;
	}

	public void setId(Long id) {
		Id = id;
	}

	public String getName() {
		return name;
	}

	public void setName(String name) {
		this.name = name;
	}

	public String getVendor() {
		return vendor;
	}

	public void setVendor(String vendor) {
		this.vendor = vendor;
	}

	public Long getRating() {
		return amount;
	}

	public void setRating(@NotNull @Min(0) Long amount) {
		this.amount= amount;
	}

	public String getDescription() {
		return description;
	}

	public void setDescription(String description) {
		this.description = description;
	}
	
	
	
	
}
