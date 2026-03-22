/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package dao;

import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;
import model.Category;
import model.Customer;

/**
 *
 * @author LEGION
 */
public class CustomerDAO extends util.DBContext {

    public List<Customer> getAllCustomer() {

        String sql = "SELECT * FROM Customers WHERE is_active = 1";
        List<Customer> list = new ArrayList<>();
        try {
            PreparedStatement ps = conn.prepareStatement(sql);
            ResultSet rs = ps.executeQuery();
            while (rs.next()) {

                int id = rs.getInt("id");
                String name = rs.getString("name");
                String phome = rs.getString("phone");
                String address = rs.getString("address");
                String email = rs.getString("email");
                Customer c = new Customer(id, name, phome, address, email);
                list.add(c);
            }
        } catch (SQLException e) {
        }

        return list;
    }

    public static void main(String[] args) {
        CustomerDAO dao = new CustomerDAO();
        List<Customer> list = dao.getAllCustomer();
        for (Customer u : list) {
            System.out.println(u.toString());
        }

    }

    public Boolean insert(String cusName, String cusPhone, String cusAddress, String cusEmail) {
        String sql = "INSERT INTO Customers (name,phone,address,email)\n"
                + "VALUES (?,?,?,?)";
        try {
            PreparedStatement ps = conn.prepareStatement(sql);
            ps.setString(1, cusName);
            ps.setString(2, cusPhone);
            ps.setString(3, cusAddress);
            ps.setString(4, cusEmail);
            int row = ps.executeUpdate();
            return row > 0;
        } catch (SQLException e) {
        }
        return false;

    }

    public boolean delete(int id) {
        String sql = "UPDATE Customers SET is_active = 0 WHERE id = ?";
        try {
            PreparedStatement ps = conn.prepareStatement(sql);
            ps.setInt(1, id);
            return ps.executeUpdate() > 0;
        } catch (SQLException e) {
        }
        return false;
    }

    public boolean update(String cusName, String cusPhone, String cusAddress, String cusEmail, int cusId) {
        String sql = "UPDATE Customers \n"
                + "SET name=?,phone=? ,address=?,email=?\n"
                + "WHERE id =?";
        try {
            PreparedStatement ps = conn.prepareStatement(sql);
            ps.setString(1, cusName);
            ps.setString(2, cusPhone);
            ps.setString(3, cusAddress);
            ps.setString(4, cusEmail);
            ps.setInt(5, cusId);
            int row = ps.executeUpdate();
            return row > 0;
        } catch (SQLException e) {
        }
        return false;
    }

    public Customer getCustomerById(int id) {
        String sql = "  SELECT* FROM Customers WHERE id=?";
        try {
            PreparedStatement ps = conn.prepareStatement(sql);
            ps.setInt(1, id);
            ResultSet rs = ps.executeQuery();
            if (rs.next()) {
                String cusName = rs.getString("name");
                String cusPhone = rs.getString("phone");
                String cusAddress = rs.getString("address");
                String cusEmail = rs.getString("email");
                Customer c = new Customer(id, cusName, cusPhone, cusAddress, cusEmail);
                return c;
            }
        } catch (SQLException e) {
        }
        return null;

    }

    public int getTotalCustomers() {
        String sql = "SELECT COUNT(*) FROM Customers WHERE is_active = 1";
        try {
            PreparedStatement ps = conn.prepareStatement(sql);
            ResultSet rs = ps.executeQuery();
            if (rs.next()) {
                return rs.getInt(1);
            }
        } catch (SQLException e) {
        }
        return 0;
    }
}
