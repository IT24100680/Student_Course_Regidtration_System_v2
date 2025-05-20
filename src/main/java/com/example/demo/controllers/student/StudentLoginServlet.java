package com.example.demo.controllers.student;
import com.example.demo.models.Student;

import com.example.demo.services.StudentManager;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;

import java.io.IOException;

@WebServlet(name = "StudentLoginServlet", value = "/student-login")
public class StudentLoginServlet extends HttpServlet {
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        StudentManager.readStudents();

        String email = request.getParameter("email");
        String password = request.getParameter("password");

        /*
        Student login auth going here
        */
        Student loggedStudent = null;
        for (Student student : StudentManager.getStudents()) {
            if (student.getEmail().equals(email) &&  student.getPassword().equals(password)) {
                loggedStudent = student;
            }
        }

        HttpSession session = request.getSession();
        if (loggedStudent == null){
            session.setAttribute("email-password-incorrect", "Email or password incorrect..!");
            response.sendRedirect("pages/student/student-login.jsp");
            return;
        }

        session.setAttribute("logged-student", loggedStudent);
        response.sendRedirect("pages/student/student-profile.jsp");
    }
}
