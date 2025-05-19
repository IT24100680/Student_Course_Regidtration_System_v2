package com.studentcourse.servlet;

import com.studentcourse.dao.PaymentDAO;

import javax.servlet.*;
import javax.servlet.http.*;
import java.io.*;

public class RefundServlet extends HttpServlet {
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String studentId = request.getParameter("studentId");

        // Logic to process refund
        // For simplicity, let's assume we remove the payment record
        // In a real-world scenario, you'd need to handle this more carefully

        PaymentDAO.getAllPayments().removeIf(payment -> payment.getStudentId().equals(studentId));
        response.sendRedirect("history.jsp");
    }
}
