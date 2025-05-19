package com.studentcourse.servlet;

import com.studentcourse.dao.PaymentDAO;
import com.studentcourse.model.Payment;
import javax.servlet.*;
import javax.servlet.http.*;
import java.io.IOException;
import java.util.List;

public class HistoryServlet extends HttpServlet {

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        try {
            // 1. Get all payments from DAO
            List<Payment> payments = PaymentDAO.getAllPayments();

            // 2. Set payments as request attribute
            request.setAttribute("payments", payments);

            // 3. Forward to history.jsp
            RequestDispatcher dispatcher = request.getRequestDispatcher("/history.jsp");
            dispatcher.forward(request, response);

        } catch (Exception e) {
            // 4. Handle errors
            e.printStackTrace();
            response.sendError(HttpServletResponse.SC_INTERNAL_SERVER_ERROR,
                    "Error retrieving payment history: " + e.getMessage());
        }
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        // Redirect GET requests to maintain clean URLs
        doGet(request, response);
    }
}