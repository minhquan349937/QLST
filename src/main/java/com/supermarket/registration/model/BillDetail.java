package com.supermarket.registration.model;

import java.sql.Date;

/**
 * Model class for Bill Detail
 * Maps to 3 tables:
 * - tblBillDetail (bảng chính: id, billId, productId, quantity, unitPrice, lineTotal)
 * - tblBill (lấy billDate từ tblBill.date)
 * - tblProduct (lấy productName từ tblProduct.name)
 */
public class BillDetail {
    private int id;                  // từ tblBillDetail.id
    private int billId;              // từ tblBillDetail.tblBillId
    private Date billDate;           // từ tblBill.date
    private int productId;           // từ tblBillDetail.tblProductId
    private String productName;      // từ tblProduct.name
    private int quantity;            // từ tblBillDetail.quantity
    private int unitPrice;           // từ tblBillDetail.unitPrice
    private int lineTotal;           // từ tblBillDetail.lineTotal

    public BillDetail() {
    }

    public BillDetail(int id, int billId, Date billDate, int productId, 
                     String productName, int quantity, int unitPrice, int lineTotal) {
        this.id = id;
        this.billId = billId;
        this.billDate = billDate;
        this.productId = productId;
        this.productName = productName;
        this.quantity = quantity;
        this.unitPrice = unitPrice;
        this.lineTotal = lineTotal;
    }

    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    public int getBillId() {
        return billId;
    }

    public void setBillId(int billId) {
        this.billId = billId;
    }

    public Date getBillDate() {
        return billDate;
    }

    public void setBillDate(Date billDate) {
        this.billDate = billDate;
    }

    public int getProductId() {
        return productId;
    }

    public void setProductId(int productId) {
        this.productId = productId;
    }

    public String getProductName() {
        return productName;
    }

    public void setProductName(String productName) {
        this.productName = productName;
    }

    public int getQuantity() {
        return quantity;
    }

    public void setQuantity(int quantity) {
        this.quantity = quantity;
    }

    public int getUnitPrice() {
        return unitPrice;
    }

    public void setUnitPrice(int unitPrice) {
        this.unitPrice = unitPrice;
    }

    public int getLineTotal() {
        return lineTotal;
    }

    public void setLineTotal(int lineTotal) {
        this.lineTotal = lineTotal;
    }

    @Override
    public String toString() {
        return "BillDetail{" +
                "id=" + id +
                ", billId=" + billId +
                ", billDate=" + billDate +
                ", productId=" + productId +
                ", productName='" + productName + '\'' +
                ", quantity=" + quantity +
                ", unitPrice=" + unitPrice +
                ", lineTotal=" + lineTotal +
                '}';
    }
}
