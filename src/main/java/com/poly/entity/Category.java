package com.poly.entity;

import java.io.Serializable;
import java.util.List;

import jakarta.persistence.CascadeType;
import jakarta.persistence.Column;
import jakarta.persistence.Entity;
import jakarta.persistence.GeneratedValue;
import jakarta.persistence.GenerationType;
import jakarta.persistence.Id;
import jakarta.persistence.OneToMany;
import jakarta.persistence.Table;
import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;
import lombok.AllArgsConstructor;

@Data @NoArgsConstructor @AllArgsConstructor
@Entity
@Table(name = "Categories")
public class Category implements Serializable{
	 	@Id
		@GeneratedValue(strategy = GenerationType.IDENTITY)
	    private Integer categoryId;
	    
	    @Column(nullable = false, columnDefinition = "nvarchar(50)")
	    private String name;
	    
	    @Column(columnDefinition = "nvarchar(50)")
	    private String description;
	    
	    @OneToMany(mappedBy = "category")
	    private List<Product> products;
}
