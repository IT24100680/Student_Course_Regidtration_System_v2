<%@ page import="com.example.demo.models.Student" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Student Profile</title>
    <style>
        :root {
            --primary-color: #2563E9;
            --secondary-color: #3B82F6;
            --background-light: #ffffff;
            --background-lighter: #f8f9fa;
            --text-dark: #202124;
            --text-muted: #5f6368;
            --border-color: #dadce0;
        }

        body {
            font-family: 'Segoe UI', Tahoma, Geneva, Verdana, sans-serif;
            background-color: var(--background-light);
            color: var(--text-dark);
            margin: 0;
            padding: 0;
            display: flex;
            justify-content: center;
            align-items: center;
            min-height: 100vh;
        }

        .container {
            background-color: var(--background-light);
            padding: 2rem;
            border-radius: 8px;
            box-shadow: 0 2px 10px rgba(0, 0, 0, 0.1);
            width: 100%;
            max-width: 600px;
            border: 1px solid var(--border-color);
        }

        h1 {
            text-align: center;
            color: var(--primary-color);
            margin-bottom: 1.5rem;
            font-weight: 500;
        }

        .profile-header {
            display: flex;
            align-items: center;
            margin-bottom: 2rem;
            gap: 1.5rem;
        }

        .profile-pic {
            width: 100px;
            height: 100px;
            border-radius: 50%;
            object-fit: cover;
            border: 3px solid var(--primary-color);
        }

        .profile-info {
            flex: 1;
        }

        .profile-name {
            font-size: 1.5rem;
            margin: 0;
            color: var(--text-dark);
            font-weight: 500;
        }

        .profile-email {
            color: var(--text-muted);
            margin: 0.3rem 0;
        }

        .profile-details {
            display: grid;
            grid-template-columns: 1fr 1fr;
            gap: 1.5rem;
        }

        .detail-group {
            margin-bottom: 1.2rem;
        }

        .detail-label {
            display: block;
            margin-bottom: 0.3rem;
            color: var(--text-muted);
            font-size: 0.9rem;
            font-weight: 500;
        }

        .detail-value {
            padding: 0.8rem;
            background-color: var(--background-lighter);
            border: 1px solid var(--border-color);
            border-radius: 4px;
            color: var(--text-dark);
        }

        .action-buttons {
            display: flex;
            gap: 1rem;
            margin-top: 2rem;
        }

        .btn {
            padding: 0.8rem 1.5rem;
            border: none;
            border-radius: 4px;
            font-size: 1rem;
            font-weight: 500;
            cursor: pointer;
            transition: all 0.3s;
            flex: 1;
            text-align: center;
            text-decoration: none;
        }

        .btn-primary {
            background-color: var(--primary-color);
            color: white;
        }

        .btn-primary:hover {
            background-color: var(--secondary-color);
            box-shadow: 0 1px 2px rgba(0, 0, 0, 0.1);
        }

        .btn-secondary {
            background-color: var(--background-light);
            color: var(--primary-color);
            border: 1px solid var(--border-color);
        }

        .btn-secondary:hover {
            background-color: #f1f3f4;
        }
    </style>
</head>
<body>
    <%
        Student student = (Student) session.getAttribute("logged-student");
    %>
    <div class="container">
        <h1>Student Profile</h1>

        <div class="profile-header">
            <img src="https://ui-avatars.com/api/?name=Alex+Johnson&background=2563E9&color=fff&size=100" alt="Profile Picture" class="profile-pic">
            <div class="profile-info">
                <h2 class="profile-name"><%=student.getName()%></h2>
                <p class="profile-email"><%=student.getEmail()%></p>
            </div>
        </div>

        <div class="profile-details">
            <div class="detail-group">
                <span class="detail-label">Student ID</span>
                <div class="detail-value"><%=student.getID()%></div>
            </div>

            <div class="detail-group">
                <span class="detail-label">Age</span>
                <div class="detail-value"><%=student.getAge()%></div>
            </div>

            <div class="detail-group">
                <span class="detail-label">Gender</span>
                <div class="detail-value"><%=student.getGender()%></div>
            </div>

            <div class="detail-group">
                <span class="detail-label">Contact No</span>
                <div class="detail-value"><%=student.getContactNo()%></div>
            </div>

        </div>

        <div class="action-buttons">
            <a href="<%=request.getContextPath()%>/pages/student/student-profile-edit.jsp" class="btn btn-primary">Edit Profile</a>
            <form action="<%=request.getContextPath()%>/student-logout" method="post">
                <input type="submit" value="Logout" class="btn btn-secondary">
            </form>
        </div>
    </div>
</body>
</html>