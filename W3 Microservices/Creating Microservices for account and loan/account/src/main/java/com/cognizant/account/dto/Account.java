package com.cognizant.account.dto;

public class Account {
    private String number;
    private String type;
    private double balance;

    // Default constructor for serialization/deserialization
    public Account() {
    }

    // Parametric constructor to populate mock data
    public Account(String number, String type, double balance) {
        this.number = number;
        this.type = type;
        this.balance = balance;
    }

    // Getters and Setters
    public String getNumber() {
        return number;
    }

    public void setNumber(String number) {
        this.number = number;
    }

    public String getType() {
        return type;
    }

    public void setType(String type) {
        this.type = type;
    }

    public double getBalance() {
        return balance;
    }

    public void setBalance(double balance) {
        this.balance = balance;
    }
}
