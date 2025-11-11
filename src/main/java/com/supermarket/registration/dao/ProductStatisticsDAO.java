package com.supermarket.registration.dao;

import com.supermarket.registration.model.ProductStatistics;

import java.sql.*;
import java.util.ArrayList;
import java.util.List;

/**
 * DAO for Product Revenue Statistics
 * Aggregates data from tblBillDetail
 */
public class ProductStatisticsDAO {

    /**
     * Get product revenue statistics for a date range
     * @param startDate Start date
     * @param endDate End date
     * @return List of ProductStatistics
     */
    public List<ProductStatistics> getProductRevenueStats(Date startDate, Date endDate) {
        List<ProductStatistics> stats = new ArrayList<>();
        String sql = "SELECT " +
                "    p.id as productId, " +
                "    p.name as productName, " +
                "    SUM(bd.quantity) as totalQuantity, " +
                "    SUM(bd.lineTotal) as totalRevenue, " +
                "    COUNT(DISTINCT bd.tblBillId) as transactionCount " +
                "FROM tblBillDetail bd " +
                "INNER JOIN tblProduct p ON bd.tblProductId = p.id " +
                "INNER JOIN tblBill b ON bd.tblBillId = b.id " +
                "WHERE b.date BETWEEN ? AND ? " +
                "GROUP BY p.id, p.name " +
                "ORDER BY totalRevenue DESC";

        try (Connection conn = DBConnection.getConnection();
             PreparedStatement stmt = conn.prepareStatement(sql)) {

            stmt.setDate(1, startDate);
            stmt.setDate(2, endDate);

            try (ResultSet rs = stmt.executeQuery()) {
                while (rs.next()) {
                    ProductStatistics stat = new ProductStatistics();
                    stat.setProductId(rs.getInt("productId"));
                    stat.setProductName(rs.getString("productName"));
                    stat.setTotalQuantity(rs.getInt("totalQuantity"));
                    stat.setTotalRevenue(rs.getDouble("totalRevenue"));
                    stat.setTransactionCount(rs.getInt("transactionCount"));
                    stats.add(stat);
                }
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }

        return stats;
    }
}
