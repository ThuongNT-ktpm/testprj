/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package model;

/**
 *
 * @author LEGION
 */
public class User {
    Integer userId;
    String userName;
    String userPass;
    String userEmail;
    String userRole;

    public User() {
    }

    public User(Integer userId, String userName, String userPass, String userEmail, String userRole) {
        this.userId = userId;
        this.userName = userName;
        this.userPass = userPass;
        this.userEmail = userEmail;
        this.userRole = userRole;
    }

    @Override
    public String toString() {
        return "User{" + "userId=" + userId + ", userName=" + userName + ", userPass=" + userPass + ", userEmail=" + userEmail + ", userRole=" + userRole + '}';
    }

    public Integer getUserId() {
        return userId;
    }

    public void setUserId(Integer userId) {
        this.userId = userId;
    }

    public String getUserName() {
        return userName;
    }

    public void setUserName(String userName) {
        this.userName = userName;
    }

    public String getUserPass() {
        return userPass;
    }

    public void setUserPass(String userPass) {
        this.userPass = userPass;
    }

    public String getUserEmail() {
        return userEmail;
    }

    public void setUserEmail(String userEmail) {
        this.userEmail = userEmail;
    }

    public String getUserRole() {
        return userRole;
    }

    public void setUserRole(String userRole) {
        this.userRole = userRole;
    }
    
    
}
