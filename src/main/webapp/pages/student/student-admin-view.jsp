<%@ page import="java.util.ArrayList" %>
<%@ page import="com.example.demo.models.Student" %>
<%@ page import="com.example.demo.services.StudentManager" %>
<!DOCTYPE html>
<html lang="en">
<head>
  <meta charset="UTF-8">
  <title>Student Management</title>
  <style>
    body {
      font-family: 'Segoe UI', Tahoma, Geneva, Verdana, sans-serif;
      background-color: #f9fbfc;
      margin: 0;
      padding: 20px;
      color: #333;
    }

    h1 {
      color: #111;
    }

    .nav {
      display: flex;
      align-items: center;
      gap: 15px;
      margin-bottom: 25px;
    }

    .nav button {
      background-color: #2563E9;
      color: white;
      border: none;
      padding: 10px 20px;
      border-radius: 6px;
      cursor: pointer;
      font-weight: bold;
    }

    .nav button:hover {
      background-color: #1e4fc4;
    }

    table {
      width: 100%;
      border-collapse: collapse;
      background-color: white;
      box-shadow: 0 4px 8px rgba(0,0,0,0.05);
    }

    th, td {
      padding: 12px 15px;
      text-align: left;
      border-bottom: 1px solid #e0e0e0;
    }

    th {
      background-color: #f1f5f9;
      color: #333;
    }

    .actions input[type="submit"] {
      border: none;
      padding: 5px 10px;
      cursor: pointer;
      border-radius: 4px;
      font-size: 14px;
      background-color: #e53e3e;
      color: white;
    }

    .actions input[type="submit"]:hover {
      background-color: #c53030;
    }
  </style>
</head>
<body>
  <%
    StudentManager.readStudents();
    ArrayList<Student> students = StudentManager.getStudents();
  %>

  <h1>Student Management</h1>

  <div class="nav">
    <button>Dashboard</button>
  </div>

  <table>
    <thead>
      <tr>
        <th>ID</th>
        <th>Name</th>
        <th>Email</th>
        <th>Age</th>
        <th>Gender</th>
        <th>Contact No</th>
      </tr>
    </thead>
    <tbody>
      <% for (Student student: students) {%>
        <tr>
          <td><%=student.getID()%></td>
          <td><%=student.getName()%></td>
          <td><%=student.getEmail()%></td>
          <td><%=student.getAge()%></td>
          <td><%=student.getGender()%></td>
          <td><%=student.getContactNo()%></td>
          <td class="actions">
            <form action="<%=request.getContextPath()%>/delete-student" method="post" onsubmit="return confirm('Are you sure you want to delete this student ?')">
                <input type="hidden" name="student-id" value="<%=student.getID()%>">
                <input type="submit" value="Delete">
            </form>
          </td>
        </tr>
    <% } %>
    </tbody>
  </table>

</body>
</html>
