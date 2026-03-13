/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package dao;

/**
 *
 * @author LEGION
 */
public class CustomerDAO extends util.DBContext {
    public java.util.List<model.Customer> getAll() {
        java.util.List<model.Customer> list = new java.util.ArrayList<>();
        String sql = "SELECT * FROM [Customer]";
        try {
            java.sql.PreparedStatement st = conn.prepareStatement(sql);
            java.sql.ResultSet rs = st.executeQuery();
            while (rs.next()) {
                model.Customer c = new model.Customer();
                c.setCusId(rs.getInt("cusId"));
                c.setCusName(rs.getString("cusName"));
                c.setCusPhone(rs.getString("cusPhone"));
                c.setCusEmail(rs.getString("cusEmail"));
                list.add(c);
            }
        } catch (java.sql.SQLException e) {
            e.printStackTrace();
        }
        return list;
    }
}
