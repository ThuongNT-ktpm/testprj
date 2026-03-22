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

/**
 *
 * @author LEGION
 */
public class CategoryDAO extends util.DBContext {

    public List<Category> getAllCate() {
        String sql = "SELECT * FROM Categories ";
        List<Category> list = new ArrayList<>();
        try {
            PreparedStatement ps = conn.prepareStatement(sql);
            ResultSet rs = ps.executeQuery();
            while (rs.next()) {
                Integer cateId = rs.getInt("id");
                String cateName = rs.getString("name");
                String cateDes = rs.getString("description");

                Category cate = new Category(cateId, cateName, cateDes);
                list.add(cate);
            }
        } catch (SQLException e) {
        }
        return list;

    }

    public static void main(String[] args) {
        CategoryDAO dao = new CategoryDAO();
        List<Category> list = dao.getAllCate();
        for (Category u : list) {
            System.out.println(u.toString());
        }
    }

    public Boolean insert(String cateName, String cateDes) {
        String sql = "INSERT INTO Categories(name,description)\n"
                + "VALUES (?,?);";
        try {
            PreparedStatement ps = conn.prepareStatement(sql);
            ps.setString(1, cateName);
            ps.setString(2, cateDes);
            int row = ps.executeUpdate();
        } catch (SQLException e) {
        }
        return false;

    }

    public Category getCateById(int id) {
    String sql ="SELECT * FROM Categories WHERE id =?";
        try {
            PreparedStatement ps = conn.prepareStatement(sql);
            ps.setInt(1, id);
            ResultSet rs = ps.executeQuery();
            if(rs.next()){
                String cateName = rs.getString("name");
                String cateDes = rs.getString("description");
                Category c = new Category(id, cateName, cateDes);
                return c;
            }
        } catch (SQLException e) {
        }
        return null;
    }

    public Boolean update(String cateName, String cateDes, Integer cateId) {
        String sql = "UPDATE Categories \n"
                + "SET name = ?, description=? WHERE id = ?";
        try {
            PreparedStatement ps = conn.prepareStatement(sql);
            ps.setString(1, cateName);
            ps.setString(2, cateDes);
            ps.setInt(3, cateId);
            int row = ps.executeUpdate();
            return row >0;
        } catch (SQLException e) {
        }
    
        return false;
    }

    public boolean delete(int id) {
   String sql = "DELETE FROM Categories WHERE id = ?";
        try {
            PreparedStatement ps = conn.prepareStatement(sql);
            ps.setInt(1, id);
            return ps.executeUpdate()>0;
        } catch (SQLException e) {
        }
        return false;
    
    }

    public int getTotalCategories() {
        String sql = "SELECT COUNT(*) FROM Categories";
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
