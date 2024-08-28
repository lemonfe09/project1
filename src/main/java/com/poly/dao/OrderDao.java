package com.poly.dao;

import java.util.List;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.query.Param;
import org.springframework.stereotype.Repository;
import com.poly.entity.Order;

@Repository
public interface OrderDao extends JpaRepository<Order, Integer> {
	 @Query("SELECT o FROM Order o WHERE o.customer.customerId = :customerId ORDER BY o.orderId DESC")
	    List<Order> findByCustomerId(@Param("customerId") Integer customerId);
}