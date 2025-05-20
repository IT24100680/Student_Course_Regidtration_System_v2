package com.example.demo.services;

import com.example.demo.models.Student;
import com.example.demo.utils.FileHandler;

import java.util.ArrayList;

public class StudentManager {
    private static ArrayList<Student> students = null;
    private static final String fileName = "students.txt";
    private static int ID = 0;

    public static void readStudents() {
        if (students != null)
            return;

        students = new ArrayList<>();
        String[] studentsDataArr = FileHandler.readFromFile(fileName);
        int studentID = 0;

        for (String studentData : studentsDataArr) {
            String[] studentDataArr = studentData.split(",");
            studentID = Integer.parseInt(studentDataArr[0]);
            String email = studentDataArr[1];
            String password = studentDataArr[2];
            String name = studentDataArr[3];
            String contactNo = studentDataArr[4];
            int age = Integer.parseInt(studentDataArr[5]);
            String gender = studentDataArr[6];

            Student student = new Student(studentID, email, password, name, contactNo, age, gender);
            students.add(student);
        }

        ID = studentID;
    }

    public static Student findStudent(int id) {
        for (Student student : students) {
            if (student.getID() == id) {
                return student;
            }
        }
        return null;
    }

    public static void addStudent(int id, String email, String password, String name,
                                  String contactNo, int age, String gender) {
        Student student = new Student(id, email, password, name, contactNo, age, gender);
        students.add(student);
        FileHandler.writeToFile(fileName, true, student.toString());
    }

    public static void removeStudent(int id) {
        students.remove(findStudent(id));
        saveStudentsToFile();
    }

    public static void updateStudent(int id, String email, String password, String name,
                                     String contactNo, int age, String gender) {
        Student student = findStudent(id);
        if (student != null) {
            student.setEmail(email);
            student.setPassword(password);
            student.setName(name);
            student.setContactNo(contactNo);
            student.setAge(age);
            student.setGender(gender);
        }
        saveStudentsToFile();
    }

    public static void saveStudentsToFile() {
        String studentDetails = "";
        for (Student student : students) {
            studentDetails += student.toString();
        }
        FileHandler.writeToFile(fileName, false, studentDetails);
    }

    public static int getNextID() {
        ID = ID + 1;
        return ID;
    }

    public static ArrayList<Student> getStudents() {
        return students;
    }
}
