package com.poly.controller;

import com.poly.dao.OrderDao;
import com.poly.dao.OrderDetailDao;
import com.poly.entity.Admin;
import com.poly.entity.Order;
import com.poly.entity.OrderDetail;

import jakarta.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;

import java.util.List;

@Controller
public class OrderController {

	@Autowired
	OrderDao dao;
	
	@Autowired
	OrderDetailDao Dao;
	
	@GetMapping("/admin/order")
   public String p(Model model, HttpSession session) {
		Admin admin = (Admin) session.getAttribute("admin");
		if (admin == null) {
			return "Admin/loginAdmin";
		}
  	List<Order> lProducts = dao.findAll();
		model.addAttribute("orders",lProducts);
      return "Admin/manage_oder";
   }
	
	@GetMapping("orderAdmin/{orderId}")
	public String getOrderDetailByOrderId2(@PathVariable Integer orderId, Model model) {
	    List<OrderDetail> orderDetails = Dao.findByOrderOrderId(orderId);
	    model.addAttribute("orderDetails", orderDetails);
	    return "Admin/OrderDetailAdmin";
	}

	@GetMapping("/order/{customerId}")
    public String bookedBills(@PathVariable Integer customerId, Model model) {
        List<Order> customerOrders = dao.findByCustomerId(customerId);
        model.addAttribute("customerOrders", customerOrders);
        return "Customer/bookedBill"; 
    }
	
	@GetMapping("/order/{orderId}/orderDetail")
	public String getOrderDetailByOrderId(@PathVariable Integer orderId, Model model) {
	    List<OrderDetail> orderDetails = Dao.findByOrderOrderId(orderId);
	    model.addAttribute("orderDetails", orderDetails);
	    return "Customer/orderDetailContent";
	}

}
