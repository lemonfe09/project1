package com.poly.dao;

import java.util.List;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;
import com.poly.entity.OrderDetail;

@Repository
public interface OrderDetailDao extends JpaRepository<OrderDetail, Integer> {
	List<OrderDetail> findByOrderOrderId(Integer orderId);}