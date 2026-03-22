/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package model;

/**
 *
 * @author LEGION
 */
public class Order {
    Integer orderID;
    String orderDate;
    Double orderTotal_price;
    String orderStatus;
    Customer cusId;

    public Order() {
    }

    public Integer getOrderID() {
        return orderID;
    }

    public void setOrderID(Integer orderID) {
        this.orderID = orderID;
    }

    public String getOrderDate() {
        return orderDate;
    }

    public void setOrderDate(String orderDate) {
        this.orderDate = orderDate;
    }

    public Double getOrderTotal_price() {
        return orderTotal_price;
    }

    public void setOrderTotal_price(Double orderTotal_price) {
        this.orderTotal_price = orderTotal_price;
    }

    public String getOrderStatus() {
        return orderStatus;
    }

    public void setOrderStatus(String orderStatus) {
        this.orderStatus = orderStatus;
    }

    public Customer getCusId() {
        return cusId;
    }

    public void setCusId(Customer cusId) {
        this.cusId = cusId;
    }

    @Override
    public String toString() {
        return "Order{" + "orderID=" + orderID + ", orderDate=" + orderDate + ", orderTotal_price=" + orderTotal_price + ", orderStatus=" + orderStatus + ", cusId=" + cusId + '}';
    }
    
    
}
