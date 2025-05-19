package com.studentcourse.servlet;

import com.studentcourse.dao.PaymentDAO;

import javax.servlet.*;
import javax.servlet.http.*;
import java.io.*;

public class RefundServlet extends HttpServlet {
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String studentId = request.getParameter("studentId");

        PaymentDAO.getAllPayments().removeIf(payment -> payment.getStudentID().equals(studentId));
        response.sendRedirect("history.jsp");
    }
}
