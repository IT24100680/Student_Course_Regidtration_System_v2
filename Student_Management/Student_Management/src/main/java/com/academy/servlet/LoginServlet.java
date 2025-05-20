package com.academy.servlet;

import com.academy.model.*;
import com.academy.dao.StudentDAO;

import javax.servlet.*;
import javax.servlet.http.*;
import java.io.IOException;

public class LoginServlet extends HttpServlet {
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String email = request.getParameter("email");
        String password = request.getParameter("password");

        Student student = StudentDAO.validateLogin(email, password);

        if (student != null) {
            HttpSession session = request.getSession();
            session.setAttribute("student", student);
            response.sendRedirect("profile.jsp");
        } else {
            request.setAttribute("error", "Invalid email or password");
            request.getRequestDispatcher("login.jsp").forward(request, response);
        }
    }
}
