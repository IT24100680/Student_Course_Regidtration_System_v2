package com.academy.dao;

import com.academy.model.*;

import java.io.*;
import java.util.*;

public class StudentDAO {
    private static final String FILE_PATH = "C:\\Users\\pubud\\OneDrive\\Desktop\\sliit\\oop project - student course registration system\\Student_Management\\Student_Management\\src\\main\\resources\\students.txt";

    // CREATE student
    public static void addStudent(Student student) {
        try (BufferedWriter writer = new BufferedWriter(new FileWriter(FILE_PATH, true))) {
            writer.write(student.toString());
            writer.newLine();
        } catch (IOException e) {
            e.printStackTrace();
        }
    }

    // READ all students
    public static List<Student> getAllStudents() {
        List<Student> students = new ArrayList<>();

        try (BufferedReader reader = new BufferedReader(new FileReader(FILE_PATH))) {
            String line;

            while ((line = reader.readLine()) != null) {
                String[] data = line.split(",");
                String id = data[0];
                String name = data[1];
                String email = data[2];
                String password = data[3];
                String type = data[4];

                Student student;

                switch (type) {
                    case "Undergraduate":
                        student = new UndergraduateStudent(id, name, email, password);
                        break;
                    case "Graduate":
                        student = new GraduateStudent(id, name, email, password);
                        break;
                    default:
                        student = new Student(id, name, email, password);
                        break;
                }

                students.add(student);
            }
        } catch (IOException e) {
            e.printStackTrace();
        }

        return students;
    }

    // READ by email and password (Login)
    public static Student validateLogin(String email, String password) {
        for (Student student : getAllStudents()) {
            if (student.getEmail().equals(email) && student.getPassword().equals(password)) {
                return student;
            }
        }
        return null;
    }

    // UPDATE student profile
    public static void updateStudent(Student updatedStudent) {
        List<Student> students = getAllStudents();

        try (BufferedWriter writer = new BufferedWriter(new FileWriter(FILE_PATH))) {
            for (Student student : students) {
                if (student.getId().equals(updatedStudent.getId())) {
                    writer.write(updatedStudent.toString());
                } else {
                    writer.write(student.toString());
                }
                writer.newLine();
            }
        } catch (IOException e) {
            e.printStackTrace();
        }
    }

    // DELETE student by ID
    public static void deleteStudent(String id) {
        List<Student> students = getAllStudents();

        try (BufferedWriter writer = new BufferedWriter(new FileWriter(FILE_PATH))) {
            for (Student student : students) {
                if (!student.getId().equals(id)) {
                    writer.write(student.toString());
                    writer.newLine();
                }
            }
        } catch (IOException e) {
            e.printStackTrace();
        }
    }
}
