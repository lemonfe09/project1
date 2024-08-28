package com.poly.controller;

import org.springframework.data.domain.Page;
import org.springframework.data.domain.PageRequest;
import org.springframework.data.domain.Pageable;

import java.util.List;
import java.util.Optional;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.poly.dao.ProductDao;
import com.poly.entity.Product;

@Controller
public class ProductController {
	List<Product> lProducts;

	@Autowired
	ProductDao dao;

//	@GetMapping("/product")
//    public String p(Model model) {
//    	List<Product> lProducts = dao.findAll();
//		model.addAttribute("products",lProducts);
//        return "Customer/product";
//    }

	@GetMapping("/product")
	public String p(Model model, @RequestParam(defaultValue = "0") int page) {
		Pageable pageable = PageRequest.of(page, 8);
		Page<Product> productPage = dao.findAll(pageable);
		lProducts = productPage.getContent();
		model.addAttribute("products", lProducts);
		model.addAttribute("pages", productPage);
		return "Customer/product";
	}

	@PostMapping("/product/filter/name")
    public String p2(Model model, @RequestParam(defaultValue = "") String name) {
        List<Product> productPage;
        if (name.isBlank()) {
            productPage = dao.findAll();
        } else {
            productPage = dao.findByNameContaining(name);
        }
        model.addAttribute("products", productPage); 
        return "Customer/product";
    }
	
	@PostMapping("/product/filter/category")
	public String filterCategory(@RequestParam("cat") Integer cat, Model model) {
		 if(cat==null)
			 lProducts = dao.findAll();
		 else
			 lProducts = dao.findAllByCategoryCategoryId(cat);
		 model.addAttribute("products", lProducts);
		 return "Customer/product";
	 }

    @GetMapping("/product/top10")
    public String top10(Model model) {
    	lProducts = dao.findTop10ByOrderByPriceDesc();
        model.addAttribute("products", lProducts);
        return "Customer/product";
    }
    
    @GetMapping("/product/detail/{id}")
    public String findProduct(@PathVariable("id") Integer id, Model model) {
        Optional<Product> lProduct = dao.findById(id);
        if (lProduct.isPresent()) {
            Product product = lProduct.get();
            model.addAttribute("product", product);
            List<Product> pd = dao.findTop4ByCategoryIdAndProductIdNot(id);
            model.addAttribute("products", pd);
            return "Customer/product-detail";
        } else {
            return "redirect:/error";
        }
    }
   
}
