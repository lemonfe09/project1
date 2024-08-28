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
@Table(name = "OrderDetails")
@Data
@NoArgsConstructor
public class OrderDetail implements Serializable{
	 @Id
	    @GeneratedValue(strategy = GenerationType.IDENTITY)
	    private Integer orderDetailId;
	    
	    @ManyToOne
	    @JoinColumn(name = "order_id")
	    private Order order;
	    
	    @ManyToOne
	    @JoinColumn(name = "product_id")
	    private Product product;
	    
	    @Column(nullable = false)
	    private Integer quantity;
	    
	    @Column(nullable = false)
	    private Double price;
}
