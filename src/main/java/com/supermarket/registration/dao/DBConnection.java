package com.supermarket.registration.dao;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.SQLException;

public class DBConnection {
    private static final String URL = "jdbc:mysql://127.0.0.1:3306/supermarket_db";
    private static final String USER = "root";
    private static final String PASSWORD = "123456";

    public static Connection getConnection() throws SQLException {
        try {
            Class.forName("com.mysql.cj.jdbc.Driver");
        } catch (ClassNotFoundException e) {
            e.printStackTrace();
        }
        return DriverManager.getConnection(URL, USER, PASSWORD);
    }

    public static boolean testConnection() {
        try {
            Connection conn = getConnection();
            if (conn != null) {
                System.out.println("Kết nối database thành công!");
                conn.close();
                return true;
            }
        } catch (SQLException e) {
            System.out.println("Kết nối database thất bại!");
            e.printStackTrace();
        }
        return false;
    }

    public static void main(String[] args) {
        testConnection();
    }
}
