<%@ page session="true" %>
<%@ page import="com.academy.model.Student" %>
<%
    Student student = (Student) session.getAttribute("student");
    String courseId = (String) session.getAttribute("selectedCourseId");

    if (student == null || courseId == null) {
        response.sendRedirect("login.jsp");
        return;
    }
%>
<html>
<head>
    <title>Payment | Student Portal</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css" rel="stylesheet">
    <style>
        .payment-card { border-radius: 15px; box-shadow: 0 4px 6px rgba(0,0,0,0.1); }
        .payment-details { background: #f8f9fa; border-radius: 10px; }
    </style>
</head>
<body>
<nav class="navbar navbar-expand-lg navbar-dark bg-primary mb-4">
    <div class="container">
        <a class="navbar-brand" href="#">Student Portal</a>
        <div class="d-flex align-items-center">
            <span class="text-white me-3"><%= student.getName() %></span>
            <a href="profile.jsp" class="btn btn-light">Back to Profile</a>
        </div>
    </div>
</nav>

<div class="container">
    <div class="row justify-content-center">
        <div class="col-lg-6">
            <div class="card payment-card">
                <div class="card-body">
                    <h2 class="card-title mb-4">Payment Confirmation</h2>

                    <div class="payment-details p-4 mb-4">
                        <div class="row mb-3">
                            <div class="col-6">
                                <strong>Student Name:</strong>
                            </div>
                            <div class="col-6">
                                <%= student.getName() %>
                            </div>
                        </div>
                        <div class="row mb-3">
                            <div class="col-6">
                                <strong>Student ID:</strong>
                            </div>
                            <div class="col-6">
                                <%= student.getId() %>
                            </div>
                        </div>
                        <div class="row">
                            <div class="col-6">
                                <strong>Course ID:</strong>
                            </div>
                            <div class="col-6">
                                <%= courseId %>
                            </div>
                        </div>
                    </div>

                    <div class="alert alert-warning">
                        Please confirm the amount matches the course fee listed in courses.txt
                    </div>

                    <form action="payment" method="post">
                        <div class="d-grid gap-2">
                            <button type="submit" class="btn btn-success btn-lg">
                                Confirm Payment <i class="bi bi-check2"></i>
                            </button>
                            <a href="profile.jsp" class="btn btn-outline-danger">Cancel Payment</a>
                        </div>
                    </form>
                </div>
            </div>
        </div>
    </div>
</div>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js"></script>
</body>
</html>