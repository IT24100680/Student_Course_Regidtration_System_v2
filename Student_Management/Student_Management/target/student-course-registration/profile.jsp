<%@ page import="com.academy.model.Student" %>
<%@ page session="true" %>
<%
    Student student = (Student) session.getAttribute("student");
    if (student == null) {
        response.sendRedirect("login.jsp");
        return;
    }
%>
<html>
<head>
    <title>Profile | Student Portal</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css" rel="stylesheet">
    <style>
        .profile-card { border-radius: 15px; box-shadow: 0 4px 6px rgba(0,0,0,0.1); }
        .nav-pills .nav-link.active { background: #0d6efd; }
    </style>
</head>
<body>
<nav class="navbar navbar-expand-lg navbar-dark bg-primary mb-4">
    <div class="container">
        <a class="navbar-brand" href="#">Student Portal</a>
        <div class="d-flex align-items-center">
            <span class="text-white me-3"><%= student.getName() %></span>
            <a href="login.jsp" class="btn btn-light">Logout</a
        </div>
    </div>
</nav>

<div class="container">
    <% if (request.getAttribute("message") != null) { %>
    <div class="alert alert-success alert-dismissible fade show mb-4">
        <%= request.getAttribute("message") %>
        <button type="button" class="btn-close" data-bs-dismiss="alert"></button>
    </div>
    <% } %>

    <div class="row">
        <div class="col-md-4">
            <div class="card profile-card mb-4">
                <div class="card-body">
                    <h5 class="card-title">Update Profile</h5>
                    <form action="profile" method="post">
                        <div class="mb-3">
                            <label class="form-label">Name</label>
                            <input type="text" name="name" value="<%= student.getName() %>"
                                   class="form-control" required>
                        </div>
                        <div class="mb-3">
                            <label class="form-label">New Password</label>
                            <input type="password" name="password"
                                   value="<%= student.getPassword() %>" class="form-control" required>
                        </div>
                        <button type="submit" class="btn btn-primary w-100">Update Profile</button>
                    </form>
                </div>
            </div>
        </div>

        <div class="col-md-8">
            <div class="card profile-card">
                <div class="card-body">
                    <h5 class="card-title mb-4">Course Management</h5>
                    <a href="courseSelection" class="btn btn-outline-primary btn-lg w-100 mb-3">
                        Select Course
                    </a>
                    <div class="mt-4">
                        <h6>Quick Links</h6>
                        <div class="list-group">
                            <a href="#" class="list-group-item list-group-item-action">My Courses</a>
                            <a href="#" class="list-group-item list-group-item-action">Academic Calendar</a>
                            <a href="#" class="list-group-item list-group-item-action">Payment History</a>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>
</div>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js"></script>
</body>
</html>