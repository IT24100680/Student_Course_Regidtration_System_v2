package com.studentcourse.servlet;

import com.studentcourse.dao.PaymentDAO;
import com.studentcourse.model.Payment;

import javax.servlet.*;
import javax.servlet.http.*;
import java.io.*;
import java.util.*;

public class PaymentServlet extends HttpServlet {
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String studentId = request.getParameter("studentId");
        double amount = Double.parseDouble(request.getParameter("amount"));
        String method = request.getParameter("method");
        String date = request.getParameter("date");

        Payment payment = new Payment(studentId, amount, method, date);
        PaymentDAO.addPayment(payment);

        response.sendRedirect("history.jsp");
    }
}
