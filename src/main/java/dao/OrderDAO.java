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
import model.Customer;
import model.Order;

/**
 *
 * @author LEGION
 */
public class OrderDAO extends util.DBContext {

    public List<Order> getAll() {
        List<Order> list = new ArrayList<>();

        String sql = "SELECT o.id AS order_id, c.id AS customer_id, c.name, "
                + "o.order_date, o.total_price, o.status "
                + "FROM Orders o JOIN Customers c ON o.customer_id = c.id";

        try {
            PreparedStatement st = conn.prepareStatement(sql);
            ResultSet rs = st.executeQuery();

            while (rs.next()) {
                Order o = new Order();
                o.setOrderID(rs.getInt("order_id"));
                o.setOrderDate(rs.getString("order_date"));
                o.setOrderTotal_price(rs.getDouble("total_price"));
                o.setOrderStatus(rs.getString("status"));

                Customer c = new Customer();
                c.setCusId(rs.getInt("customer_id"));
                c.setCusName(rs.getString("name"));
                o.setCusId(c);

                list.add(o);
            }
        } catch (SQLException e) {
          
        }

        return list;
    }

    public static void main(String[] args) {
        OrderDAO dao = new OrderDAO();
        List<Order> list = dao.getAll();
        for (Order u : list) {
            System.out.println(u.toString());
        }

    }

    public model.Order getById(int id) {
        String sql = "SELECT o.id AS order_id, o.order_date, o.total_price, o.status, c.id AS customer_id, c.name, c.phone, c.email "
                   + "FROM Orders o JOIN Customers c ON o.customer_id = c.id WHERE o.id = ?";
        try {
            java.sql.PreparedStatement st = conn.prepareStatement(sql);
            st.setInt(1, id);
            java.sql.ResultSet rs = st.executeQuery();
            if (rs.next()) {
                model.Order o = new model.Order();
                o.setOrderID(rs.getInt("order_id"));
                o.setOrderDate(rs.getString("order_date"));
                o.setOrderTotal_price(rs.getDouble("total_price"));
                o.setOrderStatus(rs.getString("status"));

                model.Customer c = new model.Customer();
                c.setCusId(rs.getInt("customer_id"));
                c.setCusName(rs.getString("name"));
                c.setCusPhone(rs.getString("phone"));
                c.setCusEmail(rs.getString("email"));
                o.setCusId(c);

                return o;
            }
        } catch (java.sql.SQLException e) {
            e.printStackTrace();
        }
        return null;
    }

    public void insert(model.Order o) {
        String sql = "INSERT INTO Orders (order_date, total_price, status, customer_id) VALUES (?, ?, ?, ?)";
        try {
            java.sql.PreparedStatement st = conn.prepareStatement(sql);
            st.setString(1, o.getOrderDate());
            st.setDouble(2, o.getOrderTotal_price());
            st.setString(3, o.getOrderStatus());
            st.setInt(4, o.getCusId().getCusId());
            st.executeUpdate();
        } catch (java.sql.SQLException e) {
            e.printStackTrace();
        }
    }

    public void update(model.Order o) {
        String sql = "UPDATE Orders SET order_date = ?, total_price = ?, status = ?, customer_id = ? WHERE id = ?";
        try {
            java.sql.PreparedStatement st = conn.prepareStatement(sql);
            st.setString(1, o.getOrderDate());
            st.setDouble(2, o.getOrderTotal_price());
            st.setString(3, o.getOrderStatus());
            st.setInt(4, o.getCusId().getCusId());
            st.setInt(5, o.getOrderID());
            st.executeUpdate();
        } catch (java.sql.SQLException e) {
            e.printStackTrace();
        }
    }

    public void delete(int id) {
        String sql = "DELETE FROM Orders WHERE id = ?";
        try {
            java.sql.PreparedStatement st = conn.prepareStatement(sql);
            st.setInt(1, id);
            st.executeUpdate();
        } catch (java.sql.SQLException e) {
            e.printStackTrace();
        }
    }

    public int getTotalOrders() {
        String sql = "SELECT COUNT(*) FROM Orders";
        try {
            java.sql.PreparedStatement st = conn.prepareStatement(sql);
            java.sql.ResultSet rs = st.executeQuery();
            if (rs.next()) {
                return rs.getInt(1);
            }
        } catch (java.sql.SQLException e) {
            e.printStackTrace();
        }
        return 0;
    }
}
