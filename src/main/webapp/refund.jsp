<%@ page contentType="text/html; charset=UTF-8" language="java" %>
<%@ page import="java.util.*, com.studentcourse.model.Payment" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>Refund Request</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@4.5.2/dist/css/bootstrap.min.css" rel="stylesheet">
    <style>
        body {
            background-color: #f8f9fa;
            font-family: Arial, sans-serif;
        }
        .container {
            max-width: 600px;
            margin-top: 50px;
        }
        .form-group label {
            font-weight: bold;
        }
        .btn-primary {
            width: 100%;
        }
    </style>
</head>
<body>
<div class="container">
    <h2 class="text-center">Refund Request</h2>
    <form action="processRefund" method="post">
        <div class="form-group">
            <label for="studentId">Student ID</label>
            <input type="text" class="form-control" id="studentId" name="studentId" placeholder="Enter Student ID" required>
        </div>
        <div class="form-group">
            <label for="amount">Refund Amount</label>
            <input type="number" class="form-control" id="amount" name="amount" placeholder="Enter Refund Amount" required>
        </div>
        <div class="form-group">
            <label for="reason">Reason for Refund</label>
            <textarea class="form-control" id="reason" name="reason" rows="4" placeholder="Enter Reason for Refund" required></textarea>
        </div>
        <button type="submit" class="btn btn-primary">Submit Refund Request</button>
    </form>
</div>

<script src="https://code.jquery.com/jquery-3.5.1.slim.min.js"></script>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@4.5.2/dist/js/bootstrap.bundle.min.js"></script>
</body>
</html>
