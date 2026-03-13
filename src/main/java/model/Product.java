/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package model;

/**
 *
 * @author LEGION
 */
public class Product {
    Integer proId;
    String proName;
    Double proPrice;
    Integer proQuantity;
    Category cateId;

    public Product() {
    }

    public Product(Integer proId, String proName, Double proPrice, Integer proQuantity, Category cateId) {
        this.proId = proId;
        this.proName = proName;
        this.proPrice = proPrice;
        this.proQuantity = proQuantity;
        this.cateId = cateId;
    }

    public Integer getProId() {
        return proId;
    }

    public void setProId(Integer proId) {
        this.proId = proId;
    }

    public String getProName() {
        return proName;
    }

    public void setProName(String proName) {
        this.proName = proName;
    }

    public Double getProPrice() {
        return proPrice;
    }

    public void setProPrice(Double proPrice) {
        this.proPrice = proPrice;
    }

    public Integer getProQuantity() {
        return proQuantity;
    }

    public void setProQuantity(Integer proQuantity) {
        this.proQuantity = proQuantity;
    }

    public Category getCateId() {
        return cateId;
    }

    public void setCateId(Category cateId) {
        this.cateId = cateId;
    }
    
    
}
