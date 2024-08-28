package com.poly.dao;

import org.springframework.data.domain.Page;
import org.springframework.data.domain.Pageable;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.query.Param;
import org.springframework.stereotype.Repository;
import com.poly.entity.Product;

import java.util.List;
import java.util.Optional;

@Repository
public interface ProductDao extends JpaRepository<Product, Integer> {
    List<Product> findAllByCategoryCategoryId(Integer categoryId); // Corrected method
    Optional<Product> findById(Integer id);
    void deleteById(Integer id); // Changed return type to void
    Page<Product> findByNameLike(String keywords, Pageable pageable);
    Page<Product> findByCategoryCategoryId(Integer categoryId, Pageable pageable); // Corrected method
    Page<Product> findByPriceBetween(double a, double b, Pageable pageable);	
    
    List<Product> findByNameContaining(String name);
    List<Product> findTop10ByOrderByPriceDesc();
    
    @Query("SELECT p2 FROM Product p1 JOIN Product p2 ON p1.category.categoryId = p2.category.categoryId WHERE p1.id = :id AND p2.id != :id")
    List<Product> findTop4ByCategoryIdAndProductIdNot(@Param("id") Integer id);
}
