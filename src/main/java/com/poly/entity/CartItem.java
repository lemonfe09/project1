package com.poly.entity;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;

@Data
@NoArgsConstructor
@AllArgsConstructor
@Getter@Setter
public class CartItem {
    private int id;
    private String name;
    private String image;
    private int quantity;
    private double price;

}
