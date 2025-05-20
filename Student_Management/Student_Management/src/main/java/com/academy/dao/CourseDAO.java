package com.academy.dao;

import com.academy.model.Course;

import java.io.*;
import java.util.ArrayList;
import java.util.List;

public class CourseDAO {
    private static final String FILE_PATH = "C:\\Users\\pubud\\OneDrive\\Desktop\\sliit\\oop project - student course registration system\\Student_Management\\Student_Management\\src\\main\\resources\\courses.txt";

    // Read all courses
    public List<Course> getAllCourses() {
        List<Course> courses = new ArrayList<>();
        try (BufferedReader br = new BufferedReader(new FileReader(FILE_PATH))) {
            String line;
            while ((line = br.readLine()) != null) {
                String[] parts = line.split(",");
                if (parts.length == 3) {
                    Course course = new Course(parts[0], parts[1], Double.parseDouble(parts[2]));
                    courses.add(course);
                }
            }
        } catch (IOException e) {
            e.printStackTrace();
        }
        return courses;
    }

    // Get course by ID
    public Course getCourseById(String courseId) {
        for (Course course : getAllCourses()) {
            if (course.getId()) {
                return course;
            }
        }
        return null;
    }

    // Save a new course (admin side use)
    public void saveCourse(Course course) {
        try (BufferedWriter bw = new BufferedWriter(new FileWriter(FILE_PATH, true))) {
            bw.write(course.getId() + "," + course.getName() + "," + course.getFee());
            bw.newLine();
        } catch (IOException e) {
            e.printStackTrace();
        }
    }
}
