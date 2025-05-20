package com.academy.model;

public class Payment {
    private String studentId;
    private String courseId;
    private double amountPaid;

    // Constructor
    public Payment(String studentId, String courseId, double amountPaid) {
        this.studentId = studentId;
        this.courseId = courseId;
        this.amountPaid = amountPaid;
    }

    // Getters and Setters
    public String getStudentId() {
        return studentId;
    }

    public void setStudentId(String studentId) {
        this.studentId = studentId;
    }

    public String getCourseId() {
        return courseId;
    }

    public void setCourseId(String courseId) {
        this.courseId = courseId;
    }

    public double getAmountPaid() {
        return amountPaid;
    }

    public void setAmountPaid(double amountPaid) {
        this.amountPaid = amountPaid;
    }

    @Override
    public String toString() {
        return "Payment{" +
                "studentId='" + studentId + '\'' +
                ", courseId='" + courseId + '\'' +
                ", amountPaid=" + amountPaid +
                '}';
    }
}

