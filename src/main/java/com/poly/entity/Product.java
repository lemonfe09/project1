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

@Data @NoArgsConstructor @AllArgsConstructor
@Entity
@Table(name = "Products")
public class Product implements Serializable{
	@Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private Integer productId;
    
    @Column(name = "name", nullable = false, columnDefinition = "nvarchar(50)")
    private String name;
    
    @Column(columnDefinition = "nvarchar(50)")
    private String description;
    
    @Column(nullable = false)
    private Double price;
    
    @Column(nullable = false)
    private Integer stockQuantity;
    
    @Column(name = "image_url", columnDefinition = "nvarchar(255)")
    private String imageUrl;
    
    @ManyToOne
    @JoinColumn(name = "category_id")
    private Category category;
    
    @OneToMany(mappedBy = "product")
    private List<OrderDetail> orderDetails;
    
    public void setCategory(Category category) {
        this.category = category;
    }

    public Category getCategory() {
        return category;
    }

}