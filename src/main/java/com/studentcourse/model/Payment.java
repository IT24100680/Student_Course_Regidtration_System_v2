package com.studentcourse.model;

import java.io.Serializable;

public class Payment implements Serializable {
    private static final long serialVersionUID = 1L;

    private String studentId;
    private double amount;
    private String method;
    private String date;

    public Payment(String studentId, double amount, String method, String date) {
        this.studentId = studentId;
        this.amount = amount;
        this.method = method;
        this.date = date;
    }


    public String getStudentId() {

        return studentId;
    }

    public void setStudentId(String studentId) {

        this.studentId = studentId;
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
        return studentId + "," + amount + "," + method + "," + date;
    }

    public static Payment fromCSV(String csvLine) {
        String[] fields = csvLine.split(",");
        return new Payment(fields[0], Double.parseDouble(fields[1]), fields[2], fields[3]);
    }
}
