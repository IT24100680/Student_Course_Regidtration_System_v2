<%@ page import="com.academy.model.Course" %>
<%@ page import="java.util.List" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Course Selection</title>
    <style>
        body {
            font-family: 'Segoe UI', sans-serif;
            margin: 0;
            padding: 0;
            background-color: #f5f7fa;
        }

        .header {
            background-color: #1677ff;
            color: white;
            padding: 15px 30px;
            display: flex;
            justify-content: space-between;
            align-items: center;
        }

        .header h2 {
            margin: 0;
        }

        .container {
            max-width: 900px;
            margin: 40px auto;
            background: white;
            padding: 30px;
            border-radius: 8px;
            box-shadow: 0 5px 15px rgba(0,0,0,0.05);
        }

        h3 {
            margin-top: 0;
            color: #333;
        }

        table {
            width: 100%;
            border-collapse: collapse;
            margin-top: 20px;
        }

        th, td {
            padding: 12px 15px;
            border: 1px solid #ccc;
            text-align: center;
        }

        th {
            background-color: #f0f0f0;
        }

        .top-right-btn {
            position: absolute;
            right: 30px;
            top: 15px;
            padding: 8px 14px;
            font-size: 14px;
            background: white;
            color: #1677ff;
            border: 1px solid #1677ff;
            border-radius: 5px;
            text-decoration: none;
        }

        .top-right-btn:hover {
            background-color: #e6f0ff;
        }
    </style>
</head>
<body>

<div class="header">
    <h2>Student Portal</h2>
    <a href="profile.jsp" class="top-right-btn">Back to Profile</a>
</div>

<div class="container">
    <h3>Available Courses</h3>

    <%
        List<Course> courseList = (List<Course>) request.getAttribute("courses");
        if (courseList != null && !courseList.isEmpty()) {
    %>
    <table>
        <tr>
            <th>Course ID</th>
            <th>Course Name</th>
            <th>Fee</th>
        </tr>
        <% for (Course c : courseList) { %>
        <tr>
            <td><%= c.getCourseId() %></td>
            <td><%= c.getName() %></td>
            <td>$<%= String.format("%.2f", c.getFee()) %></td>
        </tr>
        <% } %>
    </table>
    <%
    } else {
    %>
    <p>No courses found.</p>
    <%
        }
    %>
</div>
</body>
</html>
