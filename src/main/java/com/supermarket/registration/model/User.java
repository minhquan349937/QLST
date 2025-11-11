package com.supermarket.registration.model;

/**
 * Model class for User
 * Maps to tblUser:
 * - id (tblUser.id)
 * - username (tblUser.userName)
 * - password (tblUser.passWord)
 * - fullname (tblUser.fullName)
 * - email (tblUser.email)
 * - phoneNumber (tblUser.phoneNumber)
 * 
 * User information is saved when customer registers
 */
public class User {
    private int id;                  // từ tblUser.id
    private String username;         // từ tblUser.userName
    private String password;         // từ tblUser.passWord
    private String fullname;         // từ tblUser.fullName
    private String email;            // từ tblUser.email
    private String phoneNumber;      // từ tblUser.phoneNumber

    public User() {
    }

    public User(String username, String password, String fullname, String email, String phoneNumber) {
        this.username = username;
        this.password = password;
        this.fullname = fullname;
        this.email = email;
        this.phoneNumber = phoneNumber;
    }

    // Getters and Setters
    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    public String getUsername() {
        return username;
    }

    public void setUsername(String username) {
        this.username = username;
    }

    public String getPassword() {
        return password;
    }

    public void setPassword(String password) {
        this.password = password;
    }

    public String getFullname() {
        return fullname;
    }

    public void setFullname(String fullname) {
        this.fullname = fullname;
    }

    public String getEmail() {
        return email;
    }

    public void setEmail(String email) {
        this.email = email;
    }

    public String getPhoneNumber() {
        return phoneNumber;
    }

    public void setPhoneNumber(String phoneNumber) {
        this.phoneNumber = phoneNumber;
    }

    @Override
    public String toString() {
        return "User{" +
                "id=" + id +
                ", username='" + username + '\'' +
                ", password='" + password + '\'' +
                ", fullname='" + fullname + '\'' +
                ", email='" + email + '\'' +
                ", phoneNumber='" + phoneNumber + '\'' +
                '}';
    }
}

