package com.poly.services;

import java.util.Collection;
import java.util.HashMap;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.poly.entity.CartItem;

@Service
public class ShoppingCartServiceImplement implements ShoppingCartService {

    private static final String CART_SESSION_KEY = "cart";

    @Autowired
    private SessionService sessionService;

    @SuppressWarnings("unchecked")
    private Map<Integer, CartItem> getCartFromSession() {
        Map<Integer, CartItem> cartItems = (Map<Integer, CartItem>) sessionService.get(CART_SESSION_KEY);
        if (cartItems == null) {
            cartItems = new HashMap<>();
            sessionService.set(CART_SESSION_KEY, cartItems);
        }
        return cartItems;
    }

    @Override
    public void add(CartItem item) {
        Map<Integer, CartItem> cartItems = getCartFromSession();
        CartItem existingItem = cartItems.get(item.getId());
        if (existingItem != null) {
            existingItem.setQuantity(existingItem.getQuantity() + item.getQuantity());
        } else {
            cartItems.put(item.getId(), item);
        }
        sessionService.set(CART_SESSION_KEY, cartItems);
    }

    @Override
    public void remove(int id) {
        Map<Integer, CartItem> cartItems = getCartFromSession();
        cartItems.remove(id);
        sessionService.set(CART_SESSION_KEY, cartItems);
    }

    @Override
    public Collection<CartItem> getCartItems() {
        return getCartFromSession().values();
    }

    @Override
    public void clear() {
        sessionService.remove(CART_SESSION_KEY);
    }

    @Override
    public void update(int id, int quantity) {
        Map<Integer, CartItem> cartItems = getCartFromSession();
        CartItem existingItem = cartItems.get(id);
        if (existingItem != null) {
            existingItem.setQuantity(quantity);
        }
        sessionService.set(CART_SESSION_KEY, cartItems);
    }

    @Override
    public double getAmount() {
        return getCartFromSession().values().stream()
                .mapToDouble(item -> item.getPrice() * item.getQuantity())
                .sum();
    }

    @Override
    public int getCount() {
        return getCartFromSession().values().stream()
                .mapToInt(CartItem::getQuantity)
                .sum();
    }
}
