package com.example.demo.controllers.student;

import java.io.*;

import com.example.demo.models.Student;
import com.example.demo.services.StudentManager;
import jakarta.servlet.http.*;
import jakarta.servlet.annotation.*;

@WebServlet(name = "helloServlet", value = "/student-register")
public class StudentRegisterServlet extends HttpServlet {
    public void doPost(HttpServletRequest request, HttpServletResponse response) throws IOException {
        StudentManager.readStudents();

        String email = request.getParameter("email");
        String name = request.getParameter("name");
        String password = request.getParameter("password");
        String gender = request.getParameter("gender");
        String contactNo = request.getParameter("contact-no");
        int age = Integer.parseInt(request.getParameter("age"));
        int id  = StudentManager.getNextID();

        HttpSession session = request.getSession();
        for(Student student : StudentManager.getStudents()) {
            if(student.getEmail().equals(email)) {
                session.setAttribute("email-already-used" , "This email is already in use..!");
                response.sendRedirect("pages/student/student-register.jsp");
                return;
            }
        }

        StudentManager.addStudent(id,email,password,name,contactNo,age,gender);

        session.setAttribute("registration-success", "Registration Successful..!");
        response.sendRedirect("pages/student/student-register.jsp");
    }
}


