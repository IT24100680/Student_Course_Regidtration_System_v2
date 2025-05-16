package com.coursemanagement.servlet;

import com.coursemanagement.dao.CourseDAO;
import com.coursemanagement.model.Course;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.*;
import java.io.IOException;
import java.util.ArrayList;
import java.util.List;


public class CourseListServlet extends HttpServlet {
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        String search = request.getParameter("search");
        List<Course> allCourses = CourseDAO.getAllCourses();
        List<Course> filteredCourses = new ArrayList<>();

        if (search != null && !search.trim().isEmpty()) {
            String lowerSearch = search.toLowerCase();
            for (Course c : allCourses) {
                if (c.getName().toLowerCase().contains(lowerSearch) ||
                        c.getInstructor().toLowerCase().contains(lowerSearch) ||
                        c.getType().toLowerCase().contains(lowerSearch)) {
                    filteredCourses.add(c);
                }
            }
        } else {
            filteredCourses = allCourses;
        }

        request.setAttribute("courses", filteredCourses);
        request.getRequestDispatcher("courses.jsp").forward(request, response);
    }
}
