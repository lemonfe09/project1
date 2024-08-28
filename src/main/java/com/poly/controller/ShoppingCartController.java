package com.poly.controller;

import java.sql.Date;
import java.util.ArrayList;
import java.util.Collection;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.poly.dao.OrderDao;
import com.poly.dao.ProductDao;
import com.poly.entity.CartItem;
import com.poly.entity.Customer;
import com.poly.entity.Order;
import com.poly.entity.OrderDetail;
import com.poly.entity.Product;
import com.poly.services.MailerService;
import com.poly.services.MailerServiceImpl;
import com.poly.services.ShoppingCartService;

import jakarta.servlet.http.HttpSession;

@Controller
public class ShoppingCartController {

	@Autowired
	MailerService mailerService;
	
	@Autowired
	MailerServiceImpl serviceImpl;
    
	@Autowired
    private ShoppingCartService cartService;

    @Autowired
    private ProductDao productDao;
    
    @Autowired
    private OrderDao orderDao;

    @GetMapping("/cart")
    public String showCart(Model model, HttpSession session) {
    	Customer customer = (Customer) session.getAttribute("customer");
        if (customer == null) {
            return "redirect:/login";
        }
        model.addAttribute("cartItems", cartService.getCartItems());
        model.addAttribute("totalAmount", cartService.getAmount());
        return "Customer/cart";
    }

    @PostMapping("/cart/add/{productId}")
    public String addToCart(@PathVariable Integer productId, @RequestParam Integer quantity, HttpSession session) {
    	Customer customer = (Customer) session.getAttribute("customer");
        if (customer == null) {
            return "redirect:/login"; 
        }
        Product product = productDao.findById(productId).orElseThrow();
        CartItem item = new CartItem(product.getProductId(), product.getName(), product.getImageUrl(), quantity, product.getPrice());
        cartService.add(item);
        return "redirect:/cart";
    }

    @PostMapping("/cart/update/{productId}")
    public String updateCart(@PathVariable Integer productId, @RequestParam Integer quantity) {	
    	 Product product = productDao.findById(productId).orElseThrow();
    	    int currentStock = product.getStockQuantity();
    	    if (currentStock >= quantity) {
    	        cartService.update(productId, quantity);
    	    }
    	    else {
    	    	 cartService.update(productId, currentStock);
    	    }
    	    return "redirect:/cart";
    }

    @PostMapping("/cart/remove/{productId}")
    public String removeFromCart(@PathVariable Integer productId) {
        cartService.remove(productId);
        return "redirect:/cart";
    }

    @PostMapping("/cart/clear")
    public String clearCart() {
        cartService.clear();
        return "redirect:/cart";
    }
    
//    @PostMapping("/cart/buy")
//    public String buyItems() {
//        Collection<CartItem> cartItems = cartService.getCartItems();
//        
//        for (CartItem item : cartItems) {
//            Product product = productDao.findById(item.getId()).orElse(null);
//            if (product != null) {
//                int currentStock = product.getStockQuantity();
//                int requestedQuantity = item.getQuantity();
//                if (currentStock >= requestedQuantity) {
//                    product.setStockQuantity(currentStock - requestedQuantity);
//                    productDao.save(product);
//                }
//            }
//        }
//        cartService.clear();
//        return "redirect:/cart";
//    }
    
    @PostMapping("/cart/buy")
    public String buyItems(HttpSession session) {
        // Get customer from session
        Customer customer = (Customer) session.getAttribute("customer");
        if (customer == null) {
            return "redirect:/login"; // redirect to login if customer is not found in session
        }

        // Create a new Order object
        Order order = new Order();
        order.setCustomer(customer);
        order.setOrderDate(new Date(System.currentTimeMillis())); // Set java.sql.Date
        order.setStatus("Pending"); // or any initial status you prefer
        order.setTotalAmount(0.0); // will be calculated below

        // Get cart items
        Collection<CartItem> cartItems = cartService.getCartItems();

        List<OrderDetail> orderDetails = new ArrayList<>();
        double totalAmount = 0.0;

        for (CartItem item : cartItems) {
            Product product = productDao.findById(item.getId()).orElse(null);
            if (product != null) {
                int currentStock = product.getStockQuantity();
                int requestedQuantity = item.getQuantity();
                if (currentStock >= requestedQuantity) {
                    // Update product stock
                    product.setStockQuantity(currentStock - requestedQuantity);
                    productDao.save(product);

                    // Create an OrderDetail object
                    OrderDetail orderDetail = new OrderDetail();
                    orderDetail.setOrder(order);
                    orderDetail.setProduct(product);
                    orderDetail.setQuantity(requestedQuantity);
                    orderDetail.setPrice(product.getPrice()); // assuming product has a price field
                    orderDetails.add(orderDetail);

                    // Calculate total amount
                    totalAmount += requestedQuantity * product.getPrice();
                }
            }
        }
        
        // Set total amount for the order
        order.setTotalAmount(totalAmount);
        order.setOrderDetails(orderDetails);
        try {
        	mailerService.send(customer.getEmail(),"Shop xịn nhất Việt Nam" ,"Quý khách " + customer.getName() + " đã đặt hàng thành công."+
        "\n"+"Tổng số tiền hoá đơn là: " + order.getTotalAmount().toString()+"$ "+". Làm ơn hãy để ý điện thoại vào khoảng 3 - 5 ngày tới. Xin cảm ơn.");
		} catch (Exception e) {
			return e.getMessage();
		}
        // Save the order (which will also save the orderDetails due to cascade)
        orderDao.save(order);

        // Clear the cart
        cartService.clear();

        return "redirect:/cart";
    }
}
