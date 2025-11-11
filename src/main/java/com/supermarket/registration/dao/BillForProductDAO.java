package com.supermarket.registration.dao;

import com.supermarket.registration.model.BillDetail;

import java.sql.*;
import java.util.ArrayList;
import java.util.List;

public class BillForProductDAO {

    public List<BillDetail> getBillForProduct(int productId, Date startDate, Date endDate) {
        List<BillDetail> billDetails = new ArrayList<>();
        String sql = "SELECT " +
                "    bd.id, " +
                "    bd.tblBillId as billId, " +
                "    b.date as billDate, " +
                "    bd.tblProductId as productId, " +
                "    p.name as productName, " +
                "    bd.quantity, " +
                "    bd.unitPrice, " +
                "    bd.lineTotal " +
                "FROM tblBillDetail bd " +
                "INNER JOIN tblProduct p ON bd.tblProductId = p.id " +
                "INNER JOIN tblBill b ON bd.tblBillId = b.id " +
                "WHERE bd.tblProductId = ? " +
                "  AND b.date BETWEEN ? AND ? " +
                "ORDER BY b.date DESC, bd.id DESC";

        try (Connection conn = DBConnection.getConnection();
             PreparedStatement stmt = conn.prepareStatement(sql)) {

            stmt.setInt(1, productId);
            stmt.setDate(2, startDate);
            stmt.setDate(3, endDate);

            try (ResultSet rs = stmt.executeQuery()) {
                while (rs.next()) {
                    BillDetail detail = new BillDetail();
                    detail.setId(rs.getInt("id"));
                    detail.setBillId(rs.getInt("billId"));
                    detail.setBillDate(rs.getDate("billDate"));
                    detail.setProductId(rs.getInt("productId"));
                    detail.setProductName(rs.getString("productName"));
                    detail.setQuantity(rs.getInt("quantity"));
                    detail.setUnitPrice(rs.getInt("unitPrice"));
                    detail.setLineTotal(rs.getInt("lineTotal"));
                    billDetails.add(detail);
                }
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }

        return billDetails;
    }
}
