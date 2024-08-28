package com.poly.controller;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;

import com.poly.entity.Customer;

import jakarta.servlet.http.HttpSession;


@Controller
public class MyController {
    
	@GetMapping("/")
    public String home() {
        return "Customer/index";
    }
	
    @GetMapping("/home")
    public String index() {
        return "Customer/index";
    }

    @GetMapping("/about")
    public String about() {
        return "Customer/about";
    }

    @GetMapping("/services")
    public String services() {
        return "Customer/services";
    }
    
    @GetMapping("/checkout")
    public String checkout() {
        return "Customer/checkout";
    }
    
    @GetMapping("/login")
	public String login(Model model, HttpSession session) {
		Customer customer = (Customer) session.getAttribute("customer");
		if (customer == null) {
			return "Customer/login";
		}
		return "Customer/profile";
	}

    @GetMapping("/blog")
    public String blog() {
        return "Customer/blog";
    }
    
    @GetMapping("/contact")
    public String contact() {
        return "Customer/contact";
    }
    

}
