/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package dao;

import java.security.MessageDigest;
import java.security.NoSuchAlgorithmException;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;
import model.User;

/**
 *
 * @author LEGION
 */
public class UserDAO extends util.DBContext {

    public List<User> getAllUser() {
        String sql = "SELECT* FROM Users";
        List<User> list = new ArrayList<>();

        try {
            PreparedStatement ps = conn.prepareStatement(sql);
            ResultSet rs = ps.executeQuery();
            while (rs.next()) {
                Integer userID = rs.getInt("id");
                String userName = rs.getString("username");
                String pass = rs.getString("password");
                String email = rs.getString("email");
                String role = rs.getString("role");
                User u = new User(userID, userName, pass, email, role);
                list.add(u);
            }
        } catch (SQLException e) {
        }
        return list;

    }

    // public static void main(String[] args) {
    //
    // UserDAO dao = new UserDAO();
    // List<User> list = dao.getAllUser();
    //
    // for (User u : list) {
    // System.out.println(
    // u.getUserId() + " - "
    // + u.getUserName() + " - "
    // + u.getUserEmail() + " - "
    // + u.getUserPass() + " - "
    // + u.getUserRole()
    // );
    // }
    //
    // }
    public Boolean insert(String userName, String password, String email, String role) {

        String sql = "INSERT INTO Users (username,password,email,role)\n"
                + "VALUES (?,?,?,?)";

        try {
            PreparedStatement ps = conn.prepareStatement(sql);
            ps.setString(1, userName);
            ps.setString(2, hashMD5(password));
            ps.setString(3, email);
            ps.setString(4, role);
            int row = ps.executeUpdate();
            return row > 0;
        } catch (SQLException e) {
        }

        return false;

    }

    public Boolean updateUser(String userName, String pass, String email, String role, int id) {

        // Check if password has changed (if it equals the existing hash, do not hash it
        // again)
        User existingUser = getUserById(id);
        String finalPassword = pass;
        if (existingUser != null && !pass.equals(existingUser.getUserPass())) {
            finalPassword = hashMD5(pass);
        }

        String sql = "UPDATE Users\n"
                + "  SET username= ?,password=?,email=?,role=?\n"
                + "  Where id = ?";

        try {
            PreparedStatement ps = conn.prepareStatement(sql);
            ps.setString(1, userName);
            ps.setString(2, finalPassword);
            ps.setString(3, email);
            ps.setString(4, role);
            ps.setInt(5, id);
            int row = ps.executeUpdate();
            return row > 0;

        } catch (SQLException e) {
        }
        return false;

    }

    public User getUserById(int id) {

        String sql = "  SELECT* FROM Users WHERE id=?";
        try {
            PreparedStatement ps = conn.prepareStatement(sql);
            ps.setInt(1, id);
            ResultSet rs = ps.executeQuery();
            if (rs.next()) {

                String userName = rs.getString("username");
                String pass = rs.getString("password");
                String email = rs.getString("email");
                String role = rs.getString("role");
                User u = new User(id, userName, pass, email, role);
                return u;
            }
        } catch (SQLException e) {
        }
        return null;

    }

    public boolean delete(int id) {

        String sql = "DELETE FROM Users WHERE id = ?";
        try {
            PreparedStatement ps = conn.prepareStatement(sql);
            ps.setInt(1, id);
            return ps.executeUpdate() > 0;
        } catch (SQLException e) {
        }

        return false;
    }

    public String hashMD5(String password) {
        try {
            MessageDigest md = MessageDigest.getInstance("MD5");
            byte[] hashBytes = md.digest(password.getBytes());
            StringBuilder sb = new StringBuilder();
            for (byte b : hashBytes) {
                sb.append(String.format("%02x", b));
            }
            return sb.toString();

        } catch (NoSuchAlgorithmException e) {
            throw new RuntimeException(e);
        }
    }

    public User login(String user, String pass) {
        User u = null;
        String sql = "SELECT* FROM Users WHERE username=? and password=?";
        try {
            PreparedStatement ps = conn.prepareStatement(sql);
            ps.setString(1, user);
            ps.setString(2, hashMD5(pass));
            ResultSet rs = ps.executeQuery();
            if (rs.next()) {
                u = new User();
                u.setUserId(rs.getInt("id"));
                u.setUserName(rs.getString("username"));
                u.setUserPass(rs.getString("password"));
                u.setUserEmail(rs.getString("email"));
                u.setUserRole(rs.getString("role"));
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return u;

    }

    public static void main(String[] args) {
        UserDAO dao = new UserDAO();
        System.out.println(dao.login("tankhang", "123"));
    }
}
