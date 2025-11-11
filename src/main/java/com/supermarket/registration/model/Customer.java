package com.supermarket.registration.model;

public class Customer {
    private int id;
    private String address;

    public Customer() {
    }

    public Customer(int id, String address, String purchaseHistory) {
        this.id = id;
        this.address = address;
    }

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
