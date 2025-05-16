package com.coursemanagement.dao;

import com.coursemanagement.model.Course;
import java.io.*;
import java.util.*;

public class CourseDAO {
    private static final String FILE_PATH = "C:\\Users\\ASUS\\OneDrive\\Desktop\\Course Management\\src\\main\\resources\\courses.txt";

    public static List<Course> getAllCourses() {
        List<Course> courses = new ArrayList<>();
        try (BufferedReader br = new BufferedReader(new FileReader(FILE_PATH))) {
            String line;
            while ((line = br.readLine()) != null) {
                String[] arr = line.split("\\|");
                if (arr.length == 8) {
                    courses.add(new Course(
                            arr[0], arr[1], arr[2], arr[3],
                            Integer.parseInt(arr[4]), Integer.parseInt(arr[5]),
                            arr[6], arr[7]
                    ));
                }
            }
        } catch (IOException e) {
            e.printStackTrace();
        }
        return courses;
    }

    public static void saveAllCourses(List<Course> courses) {
        try (BufferedWriter bw = new BufferedWriter(new FileWriter(FILE_PATH))) {
            for (Course c : courses) {
                bw.write(String.join("|",
                        c.getName(), c.getType(), c.getDescription(), c.getInstructor(),
                        String.valueOf(c.getCredits()), String.valueOf(c.getCapacity()),
                        c.getPlatform(), c.getMeetingLink()
                ));
                bw.newLine();
            }
        } catch (IOException e) {
            e.printStackTrace();
        }
    }

    public static void addCourse(Course course) {
        List<Course> courses = getAllCourses();
        courses.add(course);
        saveAllCourses(courses);
    }

    public static void updateCourse(int index, Course course) {
        List<Course> courses = getAllCourses();
        courses.set(index, course);
        saveAllCourses(courses);
    }

    public static void deleteCourse(int index) {
        List<Course> courses = getAllCourses();
        courses.remove(index);
        saveAllCourses(courses);
    }
}
