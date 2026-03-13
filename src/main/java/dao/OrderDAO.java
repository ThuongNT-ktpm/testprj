/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package dao;

/**
 *
 * @author LEGION
 */
public class OrderDAO extends util.DBContext {

    public java.util.List<model.Order> getAll() {
        java.util.List<model.Order> list = new java.util.ArrayList<>();
        String sql = "SELECT o.*, c.cusName, c.cusPhone, c.cusEmail FROM [Orders] o JOIN [Customer] c ON o.cusId = c.cusId";
        try {
            java.sql.PreparedStatement st = conn.prepareStatement(sql);
            java.sql.ResultSet rs = st.executeQuery();
            while (rs.next()) {
                model.Order o = new model.Order();
                o.setOrderID(rs.getInt("orderID"));
                o.setOrderDate(rs.getString("orderDate"));
                o.setOrderTotal_price(rs.getDouble("orderTotal_price"));
                o.setOrderStatus(rs.getString("orderStatus"));
                
                model.Customer c = new model.Customer();
                c.setCusId(rs.getInt("cusId"));
                c.setCusName(rs.getString("cusName"));
                c.setCusPhone(rs.getString("cusPhone"));
                c.setCusEmail(rs.getString("cusEmail"));
                o.setCusId(c);
                
                list.add(o);
            }
        } catch (java.sql.SQLException e) {
            e.printStackTrace();
        }
        return list;
    }

    public model.Order getById(int id) {
        String sql = "SELECT o.*, c.cusName, c.cusPhone, c.cusEmail FROM [Orders] o JOIN [Customer] c ON o.cusId = c.cusId WHERE o.orderID = ?";
        try {
            java.sql.PreparedStatement st = conn.prepareStatement(sql);
            st.setInt(1, id);
            java.sql.ResultSet rs = st.executeQuery();
            if (rs.next()) {
                model.Order o = new model.Order();
                o.setOrderID(rs.getInt("orderID"));
                o.setOrderDate(rs.getString("orderDate"));
                o.setOrderTotal_price(rs.getDouble("orderTotal_price"));
                o.setOrderStatus(rs.getString("orderStatus"));
                
                model.Customer c = new model.Customer();
                c.setCusId(rs.getInt("cusId"));
                c.setCusName(rs.getString("cusName"));
                c.setCusPhone(rs.getString("cusPhone"));
                c.setCusEmail(rs.getString("cusEmail"));
                o.setCusId(c);
                
                return o;
            }
        } catch (java.sql.SQLException e) {
            e.printStackTrace();
        }
        return null;
    }

    public void insert(model.Order o) {
        String sql = "INSERT INTO [Orders] (orderDate, orderTotal_price, orderStatus, cusId) VALUES (?, ?, ?, ?)";
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
        String sql = "UPDATE [Orders] SET orderDate = ?, orderTotal_price = ?, orderStatus = ?, cusId = ? WHERE orderID = ?";
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
        String sql = "DELETE FROM [Orders] WHERE orderID = ?";
        try {
            java.sql.PreparedStatement st = conn.prepareStatement(sql);
            st.setInt(1, id);
            st.executeUpdate();
        } catch (java.sql.SQLException e) {
            e.printStackTrace();
        }
    }
}
