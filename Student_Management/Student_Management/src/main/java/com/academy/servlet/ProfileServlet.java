package com.academy.servlet;

import com.academy.model.*;
import com.academy.dao.StudentDAO;

import javax.servlet.*;
import javax.servlet.http.*;
import java.io.IOException;

public class ProfileServlet extends HttpServlet {
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        HttpSession session = request.getSession(false);
        Student student = (Student) session.getAttribute("student");

        if (student != null) {
            String name = request.getParameter("name");
            String password = request.getParameter("password");

            student.setName(name);
            student.setPassword(password);

            StudentDAO.updateStudent(student);

            session.setAttribute("student", student);
            request.setAttribute("message", "Profile updated successfully");
        }

        request.getRequestDispatcher("profile.jsp").forward(request, response);
    }
}
