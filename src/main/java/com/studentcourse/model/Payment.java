package com.studentcourse.model;

import java.io.Serializable;

public class Payment implements Serializable {
    private static final long serialVersionUID = 1L;

    private String studentID;
    private double amount;
    private String method;
    private String date;

    public Payment(String studentID, double amount, String method, String date) {
        this.studentID = studentID;
        this.amount = amount;
        this.method = method;
        this.date = date;
    }


    public String getStudentID() {

        return studentID;
    }

    public void setStudentID(String studentID) {

        this.studentID = studentID;
    }

    public double getAmount() {
        return amount;
    }

    public void setAmount(double amount) {

        this.amount = amount;
    }

    public String getMethod() {

        return method;
    }

    public void setMethod(String method) {

        this.method = method;
    }

    public String getDate() {

        return date;
    }

    public void setDate(String date) {

        this.date = date;
    }

    @Override
    public String toString() {
        return studentID + "," + amount + "," + method + "," + date;
    }

    public static Payment fromCSV(String csvLine) {
        String[] fields = csvLine.split(",");
        return new Payment(fields[0], Double.parseDouble(fields[1]), fields[2], fields[3]);
    }
}
