package com.academy.servlet;

import com.academy.model.*;
import com.academy.dao.StudentDAO;

import javax.servlet.*;
import javax.servlet.http.*;
import java.io.IOException;

public class RegisterServlet extends HttpServlet {
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String id = request.getParameter("id");
        String name = request.getParameter("name");
        String email = request.getParameter("email");
        String password = request.getParameter("password");
        String type = request.getParameter("type");

        Student student;
        if ("Undergraduate".equals(type)) {
            student = new UndergraduateStudent(id, name, email, password);
        } else if ("Graduate".equals(type)) {
            student = new GraduateStudent(id, name, email, password);
        } else {
            student = new Student(id, name, email, password);
        }

        StudentDAO.addStudent(student);

        response.sendRedirect("login.jsp");
    }
}
