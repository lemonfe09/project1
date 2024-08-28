package com.poly.dao;

import java.util.Optional;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;
import com.poly.entity.Customer;

@Repository
public interface CustomerDao extends JpaRepository<Customer, Integer> {
    Customer findByUsername(String username);
}