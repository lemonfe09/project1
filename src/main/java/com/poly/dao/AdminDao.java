package com.poly.dao;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;
import com.poly.entity.Admin;

@Repository
	public interface AdminDao extends JpaRepository<Admin, Integer> {
    Admin findByUsername(String username);
}