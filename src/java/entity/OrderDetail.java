/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package entity;

public class OrderDetail {
    private int id;
    private int orderId;
    private Book book;
    private double price;
    private int quantity;

    public OrderDetail(int id, int orderId, Book book, double price, int quantity) {
        this.id = id;
        this.orderId = orderId;
        this.book = book;
        this.price = price;
        this.quantity = quantity;
    }

    public void setId(int id) {
        this.id = id;
    }

    public void setOrderId(int orderId) {
        this.orderId = orderId;
    }

    public void setBook(Book book) {
        this.book = book;
    }

    public void setPrice(double price) {
        this.price = price;
    }

    public void setQuantity(int quantity) {
        this.quantity = quantity;
    }

    public int getId() {
        return id;
    }

    public int getOrderId() {
        return orderId;
    }

    public Book getBook() {
        return book;
    }

    public double getPrice() {
        return price;
    }

    public int getQuantity() {
        return quantity;
    }
    
    
    
}
