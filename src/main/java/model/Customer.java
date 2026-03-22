/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package model;

/**
 *
 * @author LEGION
 */
public class Customer {

    Integer cusId;
    String cusName;
    String cusPhone;
    String cusAddress;
    String cusEmail;

    public Customer() {
    }

    public Customer(Integer cusId, String cusName, String cusPhone, String cusAddress, String cusEmail) {
        this.cusId = cusId;
        this.cusName = cusName;
        this.cusPhone = cusPhone;
        this.cusAddress = cusAddress;
        this.cusEmail = cusEmail;
    }

    public Integer getCusId() {
        return cusId;
    }

    public void setCusId(Integer cusId) {
        this.cusId = cusId;
    }

    public String getCusName() {
        return cusName;
    }

    public void setCusName(String cusName) {
        this.cusName = cusName;
    }

    public String getCusPhone() {
        return cusPhone;
    }

    public void setCusPhone(String cusPhone) {
        this.cusPhone = cusPhone;
    }

    public String getCusAddress() {
        return cusAddress;
    }

    public void setCusAddress(String cusAddress) {
        this.cusAddress = cusAddress;
    }

    public String getCusEmail() {
        return cusEmail;
    }

    public void setCusEmail(String cusEmail) {
        this.cusEmail = cusEmail;
    }

    @Override
    public String toString() {
        return "Customer{" + "cusId=" + cusId + ", cusName=" + cusName + ", cusPhone=" + cusPhone + ", cusAddress=" + cusAddress + ", cusEmail=" + cusEmail + '}';
    }

}
