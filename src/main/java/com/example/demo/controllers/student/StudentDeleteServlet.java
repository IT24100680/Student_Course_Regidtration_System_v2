package com.example.demo.controllers.student;
import com.example.demo.services.StudentManager;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

import java.io.IOException;

@WebServlet(name = "StudentDeleteServlet", value = "/delete-student")
public class StudentDeleteServlet extends HttpServlet {
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        StudentManager.readStudents();

        int id = Integer.parseInt(request.getParameter("student-id"));

        StudentManager.removeStudent(id);

        response.sendRedirect("pages/student/student-admin-view.jsp");
    }
}
