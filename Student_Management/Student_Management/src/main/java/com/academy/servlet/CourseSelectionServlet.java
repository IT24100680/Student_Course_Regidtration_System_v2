package com.academy.servlet;

import com.academy.model.Course;

import javax.servlet.*;
import javax.servlet.http.*;
import java.io.*;
import java.util.*;

public class CourseSelectionServlet extends HttpServlet {
    private static final String COURSE_FILE = "C:\\Users\\pubud\\OneDrive\\Desktop\\sliit\\oop project - student course registration system\\Student_Management\\Student_Management\\src\\main\\resources\\courses.txt";

    // Load all courses from file
    private List<Course> loadCourses() {
        List<Course> courses = new ArrayList<>();

        try (BufferedReader reader = new BufferedReader(new FileReader(COURSE_FILE))) {
            String line;
            while ((line = reader.readLine()) != null) {
                String[] data = line.split(",");
                String id = data[0];
                String name = data[1];
                double fee = Double.parseDouble(data[2]);

                courses.add(new Course(id, name, fee));
            }
        } catch (IOException e) {
            e.printStackTrace();
        }

        return courses;
    }

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        List<Course> courses = loadCourses();
        request.setAttribute("courses", courses);
        RequestDispatcher dispatcher = request.getRequestDispatcher("courseSelection.jsp");
        dispatcher.forward(request, response);
    }

    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String courseId = request.getParameter("courseId");
        HttpSession session = request.getSession(false);

        if (session != null && courseId != null) {
            session.setAttribute("selectedCourseId", courseId);
            response.sendRedirect("payment.jsp");
        } else {
            response.sendRedirect("courseSelection.jsp");
        }
    }
}
