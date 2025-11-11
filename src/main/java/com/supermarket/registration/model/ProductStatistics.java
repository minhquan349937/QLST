package com.supermarket.registration.model;

public class ProductStatistics {
    private int productId;
    private String productName;
    private int totalQuantity;
    private double totalRevenue;
    private int transactionCount;

    public ProductStatistics() {
    }

    public ProductStatistics(int productId, String productName, int totalQuantity, 
                           double totalRevenue, int transactionCount) {
        this.productId = productId;
        this.productName = productName;
        this.totalQuantity = totalQuantity;
        this.totalRevenue = totalRevenue;
        this.transactionCount = transactionCount;
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

    public int getTotalQuantity() {
        return totalQuantity;
    }

    public void setTotalQuantity(int totalQuantity) {
        this.totalQuantity = totalQuantity;
    }

    public double getTotalRevenue() {
        return totalRevenue;
    }

    public void setTotalRevenue(double totalRevenue) {
        this.totalRevenue = totalRevenue;
    }

    public int getTransactionCount() {
        return transactionCount;
    }

    public void setTransactionCount(int transactionCount) {
        this.transactionCount = transactionCount;
    }

    @Override
    public String toString() {
        return "ProductStatistics{" +
                "productId=" + productId +
                ", productName='" + productName + '\'' +
                ", totalQuantity=" + totalQuantity +
                ", totalRevenue=" + totalRevenue +
                ", transactionCount=" + transactionCount +
                '}';
    }
}
