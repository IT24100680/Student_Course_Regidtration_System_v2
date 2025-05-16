package com.coursemanagement.servlet;

import com.coursemanagement.dao.CourseDAO;
import javax.servlet.*;
import javax.servlet.http.*;
import java.io.IOException;

public class CourseDeleteServlet extends HttpServlet {
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        int index = Integer.parseInt(request.getParameter("index"));
        CourseDAO.deleteCourse(index);
        response.sendRedirect("courses");
    }
}
