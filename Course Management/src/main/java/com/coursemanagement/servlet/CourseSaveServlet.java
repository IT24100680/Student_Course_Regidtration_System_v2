package com.coursemanagement.servlet;

import com.coursemanagement.dao.CourseDAO;
import com.coursemanagement.model.Course;
import javax.servlet.*;
import javax.servlet.http.*;
import java.io.IOException;

public class CourseSaveServlet extends HttpServlet {
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String name = request.getParameter("name");
        String type = request.getParameter("type");
        String description = request.getParameter("description");
        String instructor = request.getParameter("instructor");
        int credits = Integer.parseInt(request.getParameter("credits"));
        int capacity = Integer.parseInt(request.getParameter("capacity"));
        String platform = request.getParameter("platform");
        String meetingLink = request.getParameter("meetingLink");

        Course course = new Course(name, type, description, instructor, credits, capacity, platform, meetingLink);

        String indexStr = request.getParameter("index");
        if (indexStr != null && !indexStr.isEmpty()) {
            int index = Integer.parseInt(indexStr);
            CourseDAO.updateCourse(index, course);
        } else {
            CourseDAO.addCourse(course);
        }
        response.sendRedirect("courses");
    }
}
