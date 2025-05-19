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
            List<Payment> payments = PaymentDAO.getAllPayments();

            request.setAttribute("payments", payments);

            RequestDispatcher dispatcher = request.getRequestDispatcher("/history.jsp");
            dispatcher.forward(request, response);

        } catch (Exception e) {
            e.printStackTrace();
            response.sendError(HttpServletResponse.SC_INTERNAL_SERVER_ERROR,
                    "Error retrieving payment history: " + e.getMessage());
        }
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        doGet(request, response);
    }
}