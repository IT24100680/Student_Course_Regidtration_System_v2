package com.coursemanagement.servlet;

import com.coursemanagement.dao.CourseDAO;
import com.coursemanagement.model.Course;
import javax.servlet.*;
import javax.servlet.http.*;
import java.io.IOException;
import java.util.List;

public class CourseFormServlet extends HttpServlet {
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String action = request.getParameter("action");
        if ("edit".equals(action)) {
            int index = Integer.parseInt(request.getParameter("index"));
            List<Course> courses = CourseDAO.getAllCourses();
            request.setAttribute("course", courses.get(index));
            request.setAttribute("index", index);
        }
        request.getRequestDispatcher("course_form.jsp").forward(request, response);
    }
}
