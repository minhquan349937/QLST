package com.supermarket.registration.model;

import java.util.Date;

public class BillForProduct {
    private int billId;
    private Date billDate;
    private int quantity;
    private double unitPrice;
    private double lineTotal;
    private String productName;

    public BillForProduct() {
    }

    public BillForProduct(int billId, Date billDate, int quantity, double unitPrice, double lineTotal, String productName) {
        this.billId = billId;
        this.billDate = billDate;
        this.quantity = quantity;
        this.unitPrice = unitPrice;
        this.lineTotal = lineTotal;
        this.productName = productName;
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

    public int getQuantity() {
        return quantity;
    }

    public void setQuantity(int quantity) {
        this.quantity = quantity;
    }

    public double getUnitPrice() {
        return unitPrice;
    }

    public void setUnitPrice(double unitPrice) {
        this.unitPrice = unitPrice;
    }

    public double getLineTotal() {
        return lineTotal;
    }

    public void setLineTotal(double lineTotal) {
        this.lineTotal = lineTotal;
    }

    public String getProductName() {
        return productName;
    }

    public void setProductName(String productName) {
        this.productName = productName;
    }

    @Override
    public String toString() {
        return "BillForProduct{" +
                "billId=" + billId +
                ", billDate=" + billDate +
                ", quantity=" + quantity +
                ", unitPrice=" + unitPrice +
                ", lineTotal=" + lineTotal +
                ", productName='" + productName + '\'' +
                '}';
    }
}
