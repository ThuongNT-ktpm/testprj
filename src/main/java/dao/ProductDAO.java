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
import model.Product;

/**
 *
 * @author LEGION
 */
public class ProductDAO extends util.DBContext {

    public List<Product> getAllProduct() {

        String sql = "SELECT   Products.id, Products.name, Products.price, Products.quantity, Categories.id AS CategoryId, Categories.name AS categoryName, Categories.description AS categoryDes\n"
                + "FROM         Categories INNER JOIN\n"
                + "                         Products ON Categories.id = Products.category_id";
        List<Product> list = new ArrayList<>();

        try {
            PreparedStatement ps = conn.prepareStatement(sql);
            ResultSet rs = ps.executeQuery();
            while (rs.next()) {
                Integer proId = rs.getInt("id");
                String proName = rs.getString("name");
                Double proPrice = rs.getDouble("price");
                Integer proQuantity = rs.getInt("quantity");

                Integer cateId = rs.getInt("CategoryId");
                String cateName = rs.getString("categoryName");
                String cateDes = rs.getString("categoryDes");

                Category cate = new Category(cateId, cateName, cateDes);
                Product pro = new Product(proId, proName, proPrice, proQuantity, cate);
                list.add(pro);

            }

        } catch (SQLException e) {
        }
        return list;

    }

    public static void main(String[] args) {
        ProductDAO dao = new ProductDAO();
        List<Product> list = dao.getAllProduct();
        for (Product u : list) {
            System.out.println(u.toString());
        }

    }

    public boolean insert(String proName, double proPrice, Integer proQuantity, String cateName) {

        String sql = "INSERT INTO Products(name, price, quantity, category_id) "
                + "VALUES (?, ?, ?, (SELECT id FROM Categories WHERE name = ?))";
        try {
            PreparedStatement ps = conn.prepareStatement(sql);
            ps.setString(1, proName);
            ps.setDouble(2, proPrice);
            ps.setInt(3, proQuantity);
            ps.setString(4, cateName);
            int row = ps.executeUpdate();
            return row > 0;

        } catch (SQLException e) {
        }
        return false;

    }

    public Boolean update(String proName, double proPrice, int proQuantity, String cateName, int proID) {
        String sql = "UPDATE Products\n"
                + "SET name =?, price=?,quantity=?,category_id=(SELECT id FROM Categories WHERE name=?)\n"
                + "WHERE id = ?";

        try {
            PreparedStatement ps = conn.prepareStatement(sql);
            ps.setString(1, proName);
            ps.setDouble(2, proPrice);
            ps.setInt(3, proQuantity);
            ps.setString(4, cateName);
            ps.setInt(5, proID);
            int row = ps.executeUpdate();
            return row > 0;
        } catch (SQLException e) {
        }
        return false;

    }

    public Product getProById(int id) {
        String sql = "  SELECT* FROM Products WHERE id=?";
        try {
            PreparedStatement ps = conn.prepareStatement(sql);
            ps.setInt(1, id);
            ResultSet rs = ps.executeQuery();
            if (rs.next()) {
                String proName = rs.getString("name");
                double proPrice = rs.getDouble("price");
                int proQuantity = rs.getInt("quantity");

                int cateId = rs.getInt("category_id");
                Category cate = new Category();
                cate.setCateId(cateId);
                Product u = new Product(id, proName, proPrice, proQuantity, cate);
                return u;
            }
        } catch (SQLException e) {
        }

        return null;

    }

    public boolean delete(int id) {
        String sql = "DELETE FROM Products WHERE id = ?";
        try {
            PreparedStatement ps = conn.prepareStatement(sql);
            ps.setInt(1, id);
            return ps.executeUpdate() > 0;
        } catch (SQLException e) {
        }
        return false;
    }

    public int getTotalProducts() {
        String sql = "SELECT COUNT(*) FROM Products";
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
