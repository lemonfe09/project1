package com.poly.entity;

import java.io.Serializable;
import java.sql.Date;

import jakarta.persistence.Column;
import jakarta.persistence.Entity;
import jakarta.persistence.GeneratedValue;
import jakarta.persistence.GenerationType;
import jakarta.persistence.Id;
import jakarta.persistence.JoinColumn;
import jakarta.persistence.ManyToOne;
import jakarta.persistence.Table;
import lombok.Data;
import lombok.NoArgsConstructor;
import lombok.AllArgsConstructor;

@Entity
@Table(name = "Reports")
@Data @NoArgsConstructor @AllArgsConstructor

public class Report implements Serializable{
	@Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private Integer reportId;
    
    @ManyToOne
    @JoinColumn(name = "admin_id", nullable = false)
    private Admin admin;
    
    @Column(nullable = false)
    private Date reportDate;
    
    @Column(nullable = false, columnDefinition = "nvarchar(50)")
    private String reportType;
    
    @Column(nullable = false, columnDefinition = "nvarchar(50)")
    private String reportDetails;
    
    @Column(nullable = false, columnDefinition = "nvarchar(50)")
    private String status;
}
