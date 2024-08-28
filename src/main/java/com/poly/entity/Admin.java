package com.poly.entity;

import java.io.Serializable;

import jakarta.persistence.Column;
import jakarta.persistence.Entity;
import jakarta.persistence.GeneratedValue;
import jakarta.persistence.GenerationType;
import jakarta.persistence.Id;
import jakarta.persistence.Table;
import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;
import lombok.AllArgsConstructor;

@Entity
@Table(name = "Admins")
@Data @NoArgsConstructor @AllArgsConstructor
public class Admin implements Serializable{
	@Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private Integer adminId;
    
    @Column(nullable = false, unique = true, columnDefinition = "nvarchar(50)")
    private String username;
    
    @Column(nullable = false, columnDefinition = "nvarchar(50)")
    private String password;
    
    @Column(nullable = false, unique = true, columnDefinition = "nvarchar(50)")
    private String email;
}
