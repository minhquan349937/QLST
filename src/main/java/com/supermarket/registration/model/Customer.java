package com.supermarket.registration.model;

/**
 * Model class for Customer
 * Maps to tblCustomer:
 * - id (tblCustomer.id)
 * - address (tblCustomer.address)
 * 
 * Linked to tblUser through customer registration process
 */
public class Customer {
    private int id;                  // từ tblCustomer.id
    private String address;          // từ tblCustomer.address

    public Customer() {
    }

    public Customer(int id, String address, String purchaseHistory) {
        this.id = id;
        this.address = address;
    }

    // Getters and Setters
    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    public String getAddress() {
        return address;
    }

    public void setAddress(String address) {
        this.address = address;
    }

    @Override
    public String toString() {
        return "Customer{" +
                "id=" + id +
                ", address='" + address + '\'' +
                '}';
    }
}
