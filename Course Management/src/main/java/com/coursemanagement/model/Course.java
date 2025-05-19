package com.coursemanagement.model;

public class Course {
    private String name;
    private String type;
    private String description;
    private String instructor;
    private int credits;
    private int capacity;
    private String platform;
    private String meetingLink;

    public Course() {}

    public Course(String name, String type, String description, String instructor, int credits, int capacity, String platform, String meetingLink) {
        this.name = name;
        this.type = type;
        this.description = description;
        this.instructor = instructor;
        this.credits = credits;
        this.capacity = capacity;
        this.platform = platform;
        this.meetingLink = meetingLink;
    }

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }

    public String getType() {
        return type;
    }

    public void setType(String type) {
        this.type = type;
    }

    public String getDescription() {
        return description;
    }

    public void setDescription(String description) {
        this.description = description;
    }

    public int getCapacity() {
        return capacity;
    }

    public void setCapacity(int capacity) {
        this.capacity = capacity;
    }

    public int getCredits() {
        return credits;
    }

    public void setCredits(int credits) {
        this.credits = credits;
    }

    public String getInstructor() {
        return instructor;
    }

    public void setInstructor(String instructor) {
        this.instructor = instructor;
    }

    public String getPlatform() {
        return platform;
    }

    public void setPlatform(String platform) {
        this.platform = platform;
    }

    public String getMeetingLink() {
        return meetingLink;
    }

    public void setMeetingLink(String meetingLink) {
        this.meetingLink = meetingLink;
    }
}
