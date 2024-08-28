package com.poly.entity;

import java.io.Serializable;
import java.util.List;

import jakarta.persistence.CascadeType;
import jakarta.persistence.Column;
import jakarta.persistence.Entity;
import jakarta.persistence.GeneratedValue;
import jakarta.persistence.GenerationType;
import jakarta.persistence.Id;
import jakarta.persistence.JoinColumn;
import jakarta.persistence.ManyToOne;
import jakarta.persistence.OneToMany;
import jakarta.persistence.Table;
import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;
import lombok.AllArgsConstructor;

@Entity
@Table(name = "Customers")
@Data
@NoArgsConstructor
public class Customer implements Serializable{
	 @Id
	    @GeneratedValue(strategy = GenerationType.IDENTITY)
	    private Integer customerId;
	    
	    @Column(name = "nameUs", nullable = false, columnDefinition = "nvarchar(50)")
	    private String name;
	    
	    @Column(nullable = true)
	    private String image;
	    
	    @Column(name = "username", nullable = false, columnDefinition = "nvarchar(50)")
	    private String username; 
	    
	    @Column(nullable = false, unique = true, columnDefinition = "nvarchar(50)")
	    private String email;
	    
	    @Column(nullable = false, columnDefinition = "nvarchar(50)")
	    private String password;
	    
	    @Column(columnDefinition = "nvarchar(50)")
	    private String phone;
	    
	    @OneToMany(mappedBy = "customer")
	    private List<Order> orders;
}
