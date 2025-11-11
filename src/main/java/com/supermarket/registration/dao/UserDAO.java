package com.supermarket.registration.dao;

import com.supermarket.registration.model.Customer;
import com.supermarket.registration.model.User;

import java.sql.*;

public class UserDAO {

    public String checkIfUserExists(String userName, String phoneNumber) {
        String sql = "SELECT 1 FROM tblUser WHERE userName = ? UNION SELECT 2 FROM tblUser WHERE phoneNumber = ?";
        boolean userNameExists = false;
        boolean phoneNumberExists = false;
        
        try (Connection conn = DBConnection.getConnection();
             PreparedStatement pstmt = conn.prepareStatement(sql)) {
            pstmt.setString(1, userName);
            pstmt.setString(2, phoneNumber);
            
            try (ResultSet rs = pstmt.executeQuery()) {
                while (rs.next()) {
                    if (rs.getInt(1) == 1) userNameExists = true;
                    else if (rs.getInt(1) == 2) phoneNumberExists = true;
                }
            }
        } catch (SQLException e) {
            System.err.println("Lỗi khi kiểm tra người dùng tồn tại: " + e.getMessage());
        }
        
        if (userNameExists && phoneNumberExists) return "both";
        if (userNameExists) return "username";
        if (phoneNumberExists) return "phone";
        return "none";
    }


    public boolean saveNewCustomer(User user, Customer customer) {
        String userSql = "INSERT INTO tblUser (userName, password, fullName, email, phoneNumber) VALUES (?, ?, ?, ?, ?)";
        String customerSql = "INSERT INTO tblCustomer (address, tblUserid) VALUES (?, ?)";

        try (Connection conn = DBConnection.getConnection()) {
            conn.setAutoCommit(false);

            try (PreparedStatement userPstmt = conn.prepareStatement(userSql, Statement.RETURN_GENERATED_KEYS)) {
                userPstmt.setString(1, user.getUsername());
                userPstmt.setString(2, user.getPassword());
                userPstmt.setString(3, user.getFullname());
                userPstmt.setString(4, user.getEmail());
                userPstmt.setString(5, user.getPhoneNumber());
                
                if (userPstmt.executeUpdate() == 0) {
                    throw new SQLException("Không thể tạo user");
                }

                int userId;
                try (ResultSet rs = userPstmt.getGeneratedKeys()) {
                    if (rs.next()) {
                        userId = rs.getInt(1);
                    } else {
                        throw new SQLException("Không lấy được ID user mới.");
                    }
                }

                try (PreparedStatement customerPstmt = conn.prepareStatement(customerSql)) {
                    customerPstmt.setString(1, customer.getAddress());
                    customerPstmt.setInt(2, userId);
                    customerPstmt.executeUpdate();
                }
            }
            
            conn.commit();
            System.out.println("Thêm người dùng thành công.");
            return true;

        } catch (SQLException e) {
            System.err.println("Lỗi khi lưu thông tin khách hàng: " + e.getMessage());
            return false;
        }
    }
}
