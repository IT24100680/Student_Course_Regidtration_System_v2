<%@ page import="com.example.demo.models.Student" %>
<!DOCTYPE html>
<html lang="en">
<head>
  <meta charset="UTF-8">
  <meta name="viewport" content="width=device-width, initial-scale=1.0">
  <title>Student Registration</title>
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
      max-width: 500px;
      border: 1px solid var(--border-color);
    }

    h1 {
      text-align: center;
      color: var(--primary-color);
      margin-bottom: 1.5rem;
      font-weight: 500;
    }

    .form-group {
      margin-bottom: 1.2rem;
    }

    label {
      display: block;
      margin-bottom: 0.5rem;
      color: var(--text-muted);
      font-size: 0.9rem;
      font-weight: 500;
    }

    input[type="text"],
    input[type="email"],
    input[type="password"],
    input[type="date"],
    select {
      width: 100%;
      padding: 0.8rem;
      border: 1px solid var(--border-color);
      border-radius: 4px;
      background-color: var(--background-light);
      color: var(--text-dark);
      font-size: 1rem;
      transition: border 0.3s, box-shadow 0.3s;
    }

    input:focus,
    select:focus {
      outline: none;
      border-color: var(--primary-color);
      box-shadow: 0 0 0 2px rgba(37, 99, 233, 0.2);
    }

    .radio-group {
      display: flex;
      gap: 1rem;
      margin-top: 0.5rem;
    }

    .radio-option {
      display: flex;
      align-items: center;
    }

    .radio-option input {
      margin-right: 0.5rem;
    }

    .radio-option label {
      margin-bottom: 0;
      color: var(--text-dark);
    }

    button {
      width: 100%;
      padding: 0.9rem;
      background-color: var(--primary-color);
      color: white;
      border: none;
      border-radius: 4px;
      font-size: 1rem;
      font-weight: 500;
      cursor: pointer;
      transition: background-color 0.3s, box-shadow 0.3s;
    }

    button:hover {
      background-color: var(--secondary-color);
      box-shadow: 0 1px 2px rgba(0, 0, 0, 0.1);
    }

    .login-link {
      text-align: center;
      margin-top: 1.5rem;
      color: var(--text-muted);
      font-size: 0.9rem;
    }

    .login-link a {
      color: var(--primary-color);
      text-decoration: none;
      font-weight: 500;
    }

    .login-link a:hover {
      text-decoration: underline;
    }

    .error-message{
      color: red;
      font-weight: bold;
      text-align: center;
    }

    .success-message{
      color: green;
      font-weight: bold;
      text-align: center;
    }
  </style>
</head>
<body>
<%
  Student student = (Student) session.getAttribute("logged-student");
%>
<div class="container">
  <h1>Student Registration</h1>
  <form action="<%=request.getContextPath()%>/student-update" method="post">
    <input type="hidden" value="<%=student.getID()%>" name="student-id">

    <div class="form-group">
      <label for="email">Email</label>
      <input type="email" id="email" name="email" value="<%=student.getEmail()%>" readonly>
    </div>

    <div class="form-group">
      <label for="password">Password</label>
      <input type="password" id="password" name="password" value="<%=student.getPassword()%>" required>
    </div>

    <div class="form-group">
      <label for="name">Full Name</label>
      <input type="text" id="name" name="name" value="<%=student.getName()%>" required>
    </div>

    <div class="form-group">
      <label for="age">Age</label>
      <input type="text" id="age" name="age" value="<%=student.getAge()%>" required>
    </div>

    <div class="form-group">
      <label>Gender</label>
      <div class="radio-group">
        <div class="radio-option">
          <input type="radio" id="male" name="gender" value="male" <%= (student.getGender().equalsIgnoreCase("male")? "checked": "")%> required>
          <label for="male">Male</label>
        </div>
        <div class="radio-option">
          <input type="radio" id="female" name="gender" value="female" <%= (student.getGender().equalsIgnoreCase("female")? "checked": "")%>>
          <label for="female">Female</label>
        </div>
        <div class="radio-option">
          <input type="radio" id="other" name="gender" value="other" <%= (student.getGender().equalsIgnoreCase("other")? "checked": "")%>>
          <label for="other">Other</label>
        </div>
      </div>
    </div>

    <div class="form-group">
      <label for="contact-no">Contact No.</label>
      <input type="text" id="contact-no" name="contact-no" required value="<%=student.getContactNo()%>">
    </div>

    <button type="submit">Update Details</button>

  </form>
</div>
</body>
</html>