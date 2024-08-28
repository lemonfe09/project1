
package com.poly.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import com.poly.dao.CustomerDao;
import com.poly.entity.Customer;
import com.poly.services.SessionService;

import jakarta.servlet.http.HttpSession;

@Controller
@RequestMapping("/customer")
public class CustomerController {

	@Autowired
	private CustomerDao customerDao;

	@Autowired
	private SessionService sessionService;

	@GetMapping("/new")
	public String showCreateCustomerForm(Model model) {
	    model.addAttribute("customer", new Customer());
	    return "Customer/new";
	}

	@PostMapping("/new")
	public String createCustomer(@ModelAttribute("customer") Customer customer, Model model) {
	    if (customerDao.findByUsername(customer.getUsername()) != null) {
	        model.addAttribute("error", "Username already exists");
	        return "Customer/new";
	    }
	    
	    customerDao.save(customer);
	    sessionService.set("customer", customer);
	    return "redirect:/customer/profile";
	}
	
	@GetMapping("/login")
	public String showLoginForm() {
		return "Customer/login";
	}
	
	@GetMapping("/logout")
	public String showLoginForm2() {
		sessionService.remove("customer");
		return "Customer/login";
	}

	@PostMapping("/login")
	public String loginCustomer(@ModelAttribute("customer") Customer customer, Model model) {
		Customer existingCustomer = customerDao.findByUsername(customer.getUsername());

		if (existingCustomer == null) {
			model.addAttribute("error", "Tài khoản không tồn tại");
			return "redirect:/login";
		}

		if (!existingCustomer.getPassword().equals(customer.getPassword())) {
			model.addAttribute("error", "Mật khẩu không đúng");
			return "redirect:/login";
		}

		sessionService.set("customer", existingCustomer);
		return "Customer/index";
	}
	
	@GetMapping("/profile")
	public String profile(Model model, HttpSession session) {
	    Customer customer = (Customer) session.getAttribute("customer");
	    if (customer == null) {
	        return "redirect:/login";
	    }
	    model.addAttribute("customer", customer); // Add 'customer' to the model
	    return "Customer/profile";
	}

	
	@PostMapping("/profile/update")
	public String updateCustomer(@ModelAttribute("customer") Customer customer, HttpSession session) {
		customerDao.save(customer);
		Customer updatedCustomer = customerDao.findById(customer.getCustomerId()).orElse(null);
		session.setAttribute("customer", updatedCustomer);
		return "redirect:/customer/profile?success=true";
	}
}