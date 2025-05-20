package com.academy.servlet;

import com.academy.model.Student;

import javax.servlet.*;
import javax.servlet.http.*;
import java.io.*;

public class PaymentServlet extends HttpServlet {
    private static final String PAYMENT_FILE = "C:\\Users\\ASUS\\OneDrive\\Desktop\\Student_Management\\src\\main\\resources\\payments.txt";

    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        HttpSession session = request.getSession(false);

        if (session != null) {
            Student student = (Student) session.getAttribute("student");
            String courseId = (String) session.getAttribute("selectedCourseId");

            if (student != null && courseId != null) {
                try (BufferedWriter writer = new BufferedWriter(new FileWriter(PAYMENT_FILE, true))) {
                    writer.write(student.getId() + "," + courseId + ",paid=true");
                    writer.newLine();
                } catch (IOException e) {
                    e.printStackTrace();
                }

                request.setAttribute("message", "Payment successful for course " + courseId + "!");
                request.getRequestDispatcher("profile.jsp").forward(request, response);
            } else {
                response.sendRedirect("courseSelection.jsp");
            }
        } else {
            response.sendRedirect("login.jsp");
        }
    }
}
