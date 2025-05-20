<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Student Portal</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css" rel="stylesheet">
    <meta http-equiv="refresh" content="3;url=login.jsp">
    <style>
        body {
            background: linear-gradient(135deg, #667eea 0%, #764ba2 100%);
            min-height: 100vh;
        }
        .welcome-card {
            border-radius: 20px;
            box-shadow: 0 10px 30px rgba(0,0,0,0.2);
            background: rgba(255, 255, 255, 0.95);
            backdrop-filter: blur(10px);
        }
        .spinner {
            width: 5rem;
            height: 5rem;
        }
    </style>
</head>
<body class="d-flex align-items-center">
<div class="container">
    <div class="row justify-content-center">
        <div class="col-md-8 col-lg-6">
            <div class="welcome-card p-5 text-center">
                <h1 class="display-4 mb-4 text-primary">Welcome to Student Portal</h1>
                <p class="lead mb-4 text-muted">
                    Manage your courses, update your profile, and handle payments
                    through our comprehensive student platform.
                </p>

                <div class="my-5">
                    <div class="spinner-border text-primary" role="status">
                        <span class="visually-hidden">Loading...</span>
                    </div>
                    <p class="mt-3 text-muted">Redirecting to login...</p>
                </div>

                <div class="mt-4">
                    <p class="text-muted">Not redirecting?
                        <a href="login.jsp" class="text-decoration-none">Click here</a>
                    </p>
                </div>
            </div>
        </div>
    </div>
</div>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js"></script>
</body>
</html>