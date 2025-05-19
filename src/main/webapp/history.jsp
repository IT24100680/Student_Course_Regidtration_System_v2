<%@ page contentType="text/html; charset=UTF-8" language="java" %>
<%@ page import="java.io.*, java.util.*, com.studentcourse.model.Payment" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>Payment History</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@4.5.2/dist/css/bootstrap.min.css" rel="stylesheet">
    <style>
        body {
            background-color: #f8f9fa;
            font-family: Arial, sans-serif;
        }
        .container {
            max-width: 900px;
            margin-top: 50px;
        }
        .table th, .table td {
            text-align: center;
        }
    </style>
</head>
<body>
<div class="container">
    <h2 class="text-center">Payment History</h2>
    <table class="table table-striped table-bordered">
        <thead class="thead-dark">
        <tr>
            <th>Student ID</th>
            <th>Amount</th>
            <th>Payment Method</th>
            <th>Date</th>
        </tr>
        </thead>
        <tbody>
        <%
            // Initialize the list to hold payment records
            List<Payment> payments = new ArrayList<>();

            // File path where payment records are stored
            String filePath = application.getRealPath("/") + "WEB-INF/payments.txt";

            try (BufferedReader reader = new BufferedReader(new FileReader(filePath))) {
                String line;
                while ((line = reader.readLine()) != null) {
                    // Parse each line into a Payment object
                    Payment payment = Payment.fromCSV(line);
                    payments.add(payment);
                }
            } catch (IOException e) {
                out.println("<tr><td colspan='4' class='text-center text-danger'>Error loading payment records.</td></tr>");
            }

            // Iterate over the list of payments and display them in the table
            for (Payment payment : payments) {
        %>
        <tr>
            <td><%= payment.getStudentID() %></td>
            <td><%= payment.getAmount() %></td>
            <td><%= payment.getMethod() %></td>
            <td><%= payment.getDate() %></td>
        </tr>
        <%
            }
        %>
        </tbody>
    </table>
    <a href="checkout.jsp" class="btn btn-primary">Make a Payment</a>
</div>
<script src="https://code.jquery.com/jquery-3.5.1.slim.min.js"></script>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@4.5.2/dist/js/bootstrap.bundle.min.js"></script>
</body>
</html>
