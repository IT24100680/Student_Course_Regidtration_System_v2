package com.academy.model;

public class Course {
    private String courseId;
    private String courseName;
    private double fee;

    public Course(String courseId, String courseName, double fee) {
        this.courseId = courseId;
        this.courseName = courseName;
        this.fee = fee;
    }

    public String getCourseId() { return courseId; }
    public String getCourseName() { return courseName; }
    public double getFee() { return fee; }

    @Override
    public String toString() {
        return courseId + "," + courseName + "," + fee;
    }

    public boolean getId() {
        return false;
    }

    public Object getName() {
        return courseName;
    }
}
