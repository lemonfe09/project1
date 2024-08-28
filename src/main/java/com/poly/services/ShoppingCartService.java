package com.poly.services;

import java.util.Collection;

import com.poly.entity.CartItem;

public interface ShoppingCartService {

	void add(CartItem item);

    void remove(int id);

    Collection<CartItem> getCartItems();

    void clear();

    void update(int id, int quantity);

    double getAmount();

    int getCount();

}
