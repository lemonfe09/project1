package com.poly.controller;

import com.poly.dao.CategoryDao;
import com.poly.entity.Admin;
import com.poly.entity.Category;

import jakarta.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;

import java.util.List;

@Controller
public class CategoryController {

	@Autowired
	private CategoryDao dao; // Ensure you have the DAO implementation

	@GetMapping("admin/categoryM")
	public String showCategoryList(Model model, HttpSession session) {
		Admin admin = (Admin) session.getAttribute("admin");
		if (admin == null) {
			return "Admin/loginAdmin";
		}
		List<Category> categories = dao.findAll();
		model.addAttribute("categories", categories);
		model.addAttribute("category", new Category());
		model.addAttribute("newCategory", new Category()); // Separate attribute for the add form
		return "Admin/manage_category"; // Make sure this is the correct path to your JSP
	}

	@PostMapping("/categoryM/add")
	public String addCategory(Model model, @ModelAttribute("newCategory") Category category) {
		dao.save(category);
		return "redirect:/admin/categoryM"; // Corrected the redirect path
	}

	@PostMapping("/categoryM/update")
	public String updateCategory(Model model, @ModelAttribute("category") Category category) {
		dao.save(category);
		return "redirect:/admin/categoryM"; // Corrected the redirect path
	}

	@GetMapping("/categoryM/delete/{id}")
	public String deleteCategory(@PathVariable("id") Integer id) {
		dao.deleteById(id);
		return "redirect:/admin/categoryM"; // Corrected the redirect path
	}

	@GetMapping("/categoryM/edit/{id}")
	public String editCategory(@PathVariable("id") Integer id, Model model) {
		Category category = dao.findById(id).get();
		model.addAttribute("category", category);
//		List<Category> categories = dao.findAll();
//		model.addAttribute("categories", categories);
		return "Admin/UpdateCategory";
	}

	
	

}