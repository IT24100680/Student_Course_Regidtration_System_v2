<%@ page contentType="text/html;charset=UTF-8" %>
<html>
<head>
    <title>Register | Student Portal</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css" rel="stylesheet">
    <style>
        body { background: #f8f9fa; }
        .card { border-radius: 15px; box-shadow: 0 4px 6px rgba(0,0,0,0.1); }
        .form-control:focus { box-shadow: none; border-color: #0d6efd; }
    </style>
</head>
<body class="min-vh-100 d-flex align-items-center">
<div class="container">
    <div class="row justify-content-center">
        <div class="col-md-6 col-lg-5">
            <div class="card p-4">
                <h2 class="text-center mb-4">Student Registration</h2>
                <form action="register" method="post">
                    <div class="mb-3">
                        <label class="form-label">Student ID</label>
                        <input type="text" name="id" class="form-control" required>
                    </div>
                    <div class="mb-3">
                        <label class="form-label">Full Name</label>
                        <input type="text" name="name" class="form-control" required>
                    </div>
                    <div class="mb-3">
                        <label class="form-label">Email</label>
                        <input type="email" name="email" class="form-control" required>
                    </div>
                    <div class="mb-3">
                        <label class="form-label">Password</label>
                        <input type="password" name="password" class="form-control" required>
                    </div>
                    <div class="mb-4">
                        <label class="form-label">Student Type</label>
                        <select name="type" class="form-select">
                            <option value="Undergraduate">Undergraduate</option>
                            <option value="Graduate">Graduate</option>
                        </select>
                    </div>
                    <button type="submit" class="btn btn-primary w-100 mb-3">Create Account</button>
                    <div class="text-center">
                        Already have an account? <a href="login.jsp" class="text-decoration-none">Login here</a>
                    </div>
                </form>
            </div>
        </div>
    </div>
</div>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js"></script>
</body>
</html>