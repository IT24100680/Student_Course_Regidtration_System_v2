package com.example.demo.controllers.student;

import com.example.demo.services.StudentManager;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

import java.io.IOException;

@WebServlet(name = "StudentUpdateServlet", value = "/student-update")
public class StudentUpdateServlet extends HttpServlet {
    public void doPost(HttpServletRequest request, HttpServletResponse response) throws IOException {
        StudentManager.readStudents();

        String email = request.getParameter("email");
        String name = request.getParameter("name");
        String password = request.getParameter("password");
        String gender = request.getParameter("gender");
        String contactNo = request.getParameter("contact-no");
        int age = Integer.parseInt(request.getParameter("age"));
        int id  = Integer.parseInt(request.getParameter("student-id"));

        StudentManager.updateStudent(id, email, password, name, contactNo, age, gender);


        response.sendRedirect("pages/student/student-profile.jsp");
    }
}


