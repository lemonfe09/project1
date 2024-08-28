package com.poly.controller;

import java.util.List;
import java.util.Optional;


import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.domain.Sort;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.poly.dao.AdminDao;
import com.poly.dao.CategoryDao;
import com.poly.dao.CustomerDao;
import com.poly.dao.OrderDao;
import com.poly.dao.ProductDao;
import com.poly.entity.Admin;
import com.poly.entity.Category;
import com.poly.entity.Customer;
import com.poly.entity.Product;
import com.poly.services.CookieService;
import com.poly.services.ParamService;
import com.poly.services.SessionService;

//import jakarta.servlet.http.Cookie;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;

@Controller
public class AdminController {
	 	@Autowired
	    CookieService cookieService;

	    @Autowired
	    ParamService paramService;

	    @Autowired
	    SessionService sessionService;
	
	    @Autowired
		ProductDao dao;
	    
		@Autowired
	    private AdminDao adminDao;
	    
	    @Autowired
		CustomerDao CDao;
	    
	    @Autowired
		CategoryDao Catedao;
	    
	@GetMapping("/admin/login")
	public String login() {
		return "Admin/loginAdmin";
	}

    @PostMapping("/admin/login")
    public String login(@RequestParam("user") String user, @RequestParam("password") String password, Model model,
                        HttpServletResponse response) {
        Admin existingAdmin = adminDao.findByUsername(user);
        if (user.isBlank() || password.isBlank()) {
            model.addAttribute("message", "Không được để trống");
            return "Admin/loginAdmin";
        } else {
            if (existingAdmin == null) {
                model.addAttribute("message", "Tài khoản hoặc mật khẩu sai");
                return "Admin/loginAdmin";
            } else {
                if (existingAdmin.getUsername().equals(user) && existingAdmin.getPassword().equals(password)) {
                	sessionService.set("admin", existingAdmin);
                	return "Admin/indexAdmin";
                } else {
                    model.addAttribute("message", "Tài khoản hoặc mật khẩu sai");
                    return "Admin/loginAdmin";
                }
            }
        }
    }
	
	@GetMapping("/admin/index")
	public String index() {
		return "Admin/indexAdmin";
	}
	
	@GetMapping("/admin/logout")
	public String logout(HttpSession session) {
		sessionService.remove("admin");
		return "Admin/loginAdmin";
	}
	
	@GetMapping("/admin/customers")
    public String customers(Model model, HttpSession session) {
		Admin admin = (Admin) session.getAttribute("admin");
		if (admin == null) {
			return "Admin/loginAdmin";
		}
		
       List<Customer> lCustomer = CDao.findAll();
       model.addAttribute("customers", lCustomer);

        return "Admin/manage_customers";
    }
	
	
	@GetMapping("/admin/product")
    public String product(Model model, HttpSession session) {
		Admin admin = (Admin) session.getAttribute("admin");
		if (admin == null) {
			return "Admin/loginAdmin";
		}
		List<Product> lProducts = dao.findAll();
		List<Category> category = Catedao.findAll();
		model.addAttribute("category", category);
        model.addAttribute("products", lProducts);
        model.addAttribute("product", new Product());
        model.addAttribute("newProduct", new Product());

        return "Admin/manage_product";
    }
	
	@GetMapping("/admin/product/{field}")
    public String sortProducts(Model model, @PathVariable String field, @RequestParam(required = false) String direction) {
        Sort.Direction sortDirection = (direction == null || direction.equalsIgnoreCase("asc")) ? Sort.Direction.ASC : Sort.Direction.DESC;
        List<Product> lProducts = dao.findAll(Sort.by(sortDirection, field));
        model.addAttribute("products", lProducts);
        model.addAttribute("currentField", field);
        model.addAttribute("currentDirection", sortDirection == Sort.Direction.ASC ? "asc" : "desc");
        return "Admin/manage_product";
	}
	
	@PostMapping("/productM/add")
	public String addProduct(Model model, @ModelAttribute("newProduct") Product product, @RequestParam("categoryId") Integer categoryId) {
	    Category category = Catedao.findById(categoryId).orElse(null);
	    if (category != null) {
	        product.setCategory(category);
	    }
	    dao.save(product);
	    return "redirect:/admin/product";
	}

	@GetMapping("/productM/edit/{id}")
	public String editProduct(@PathVariable Integer id, Model model) {
	    Product product = dao.findById(id).orElse(null);
	    List<Category> category = Catedao.findAll();
	    model.addAttribute("category", category);
	    model.addAttribute("product", product);
	    return "Admin/UpdateProduct";
	}

	@PostMapping("/productM/update")
	public String updateProduct(Model model, @ModelAttribute("product") Product product, @RequestParam("categoryId") Integer categoryId) {
	    Category category = Catedao.findById(categoryId).orElse(null);
	    if (category != null) {
	        product.setCategory(category);
	    }
	    dao.save(product);
	    return "redirect:/admin/product";
	}

    @GetMapping("/productM/delete/{id}")
    public String deleteProduct(@PathVariable Integer id) {
        dao.deleteById(id);
        return "redirect:/admin/product";
    }

	
	@GetMapping("/admin/banners")
	public String banners(HttpSession session) {
		Admin admin = (Admin) session.getAttribute("admin");
		if (admin == null) {
			return "Admin/loginAdmin";
		}
		return "Admin/manage_banners";
	}
	



}
