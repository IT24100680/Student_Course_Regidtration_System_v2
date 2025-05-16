<%@ page import="com.coursemanagement.model.Course" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%
  Course course = (Course) request.getAttribute("course");
  Integer index = (Integer) request.getAttribute("index");
%>
<!DOCTYPE html>
<html>
<head>
  <title>Course Form</title>
  <meta name="viewport" content="width=device-width, initial-scale=1.0">
  <link href="https://fonts.googleapis.com/css2?family=Inter:wght@300;400;500;600;700&display=swap" rel="stylesheet">
  <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.0.0/css/all.min.css">
  <style>
    :root {
      --primary: #4361ee;
      --primary-hover: #3a56d4;
      --secondary: #6c757d;
      --secondary-hover: #5a6268;
      --background: #f8fafc;
      --card: #ffffff;
      --text: #1e293b;
      --text-light: #64748b;
      --border: #e2e8f0;
      --radius: 12px;
      --radius-sm: 8px;
      --transition: all 0.2s cubic-bezier(0.4, 0, 0.2, 1);
    }

    * { box-sizing: border-box; }

    body {
      font-family: 'Inter', system-ui, -apple-system, sans-serif;
      background-color: var(--background);
      color: var(--text);
      padding: 2rem;
      line-height: 1.5;
    }

    .container {
      max-width: 800px;
      margin: 0 auto;
      background-color: var(--card);
      padding: 2.5rem;
      border-radius: var(--radius);
      box-shadow: 0 4px 6px rgba(0, 0, 0, 0.1);
    }

    h1 {
      text-align: center;
      font-size: 1.75rem;
      margin-bottom: 2.5rem;
      color: var(--text);
      position: relative;
      padding-bottom: 0.75rem;
    }

    h1::after {
      content: '';
      position: absolute;
      bottom: 0;
      left: 50%;
      transform: translateX(-50%);
      width: 80px;
      height: 4px;
      background: linear-gradient(90deg, #4361ee, #3a0ca3);
      border-radius: 2px;
    }

    .form-group { margin-bottom: 1.75rem; }

    label {
      display: block;
      margin-bottom: 0.75rem;
      font-weight: 500;
      font-size: 0.9375rem;
      color: var(--text-light);
    }

    .required::after { content: ' *'; color: #ef4444; }

    input[type="text"],
    input[type="number"],
    input[type="url"],
    select,
    textarea {
      width: 100%;
      padding: 0.875rem 1.25rem;
      border: 1px solid var(--border);
      border-radius: var(--radius-sm);
      font-size: 0.9375rem;
      transition: var(--transition);
      background-color: white;
    }

    select {
      appearance: none;
      background-image: url("data:image/svg+xml,%3Csvg xmlns='http://www.w3.org/2000/svg' width='16' height='16' fill='%2364748b' viewBox='0 0 16 16'%3E%3Cpath d='M7.247 11.14 2.451 5.658C1.885 5.013 2.345 4 3.204 4h9.592a1 1 0 0 1 .753 1.659l-4.796 5.48a1 1 0 0 1-1.506 0z'/%3E%3C/svg%3E");
      background-repeat: no-repeat;
      background-position: right 1.25rem center;
      background-size: 16px 12px;
    }

    textarea {
      min-height: 140px;
      resize: vertical;
      line-height: 1.5;
    }

    input:focus, select:focus, textarea:focus {
      outline: none;
      border-color: var(--primary);
      box-shadow: 0 0 0 3px rgba(67, 97, 238, 0.15);
    }

    .form-actions {
      display: flex;
      justify-content: flex-end;
      gap: 1.25rem;
      margin-top: 2.5rem;
      padding-top: 1.75rem;
      border-top: 1px solid var(--border);
    }

    .btn {
      padding: 0.875rem 1.75rem;
      border: none;
      border-radius: var(--radius-sm);
      font-size: 0.9375rem;
      font-weight: 500;
      cursor: pointer;
      transition: var(--transition);
      display: inline-flex;
      align-items: center;
      gap: 0.75rem;
    }

    .btn-primary {
      background-color: var(--primary);
      color: white;
    }

    .btn-primary:hover {
      background-color: var(--primary-hover);
      transform: translateY(-2px);
      box-shadow: 0 2px 4px rgba(0, 0, 0, 0.1);
    }

    .btn-secondary {
      background-color: var(--secondary);
      color: white;
    }

    .btn-secondary:hover {
      background-color: var(--secondary-hover);
      transform: translateY(-2px);
      box-shadow: 0 2px 4px rgba(0, 0, 0, 0.1);
    }

    @media (max-width: 640px) {
      body { padding: 1.25rem; }
      .container { padding: 1.75rem; }
      .form-actions {
        flex-direction: column;
        gap: 1rem;
      }
      .btn {
        width: 100%;
        justify-content: center;
      }
    }
  </style>
</head>
<body>
<div class="container">
  <h1><%= index != null ? "Edit Course" : "Create New Course" %></h1>
  <form method="post" action="saveCourse">
    <input type="hidden" name="index" value="<%= index != null ? index : "" %>"/>

    <div class="form-group">
      <label for="name" class="required">Course Name</label>
      <input type="text" id="name" name="name"
             value="<%= course != null ? course.getName() : "" %>"
             required pattern="[A-Za-z\s]{3,50}"
             title="Only letters and spaces, 3–50 characters"
             placeholder="Enter course name"/>
    </div>

    <div class="form-group">
      <label for="type" class="required">Course Type</label>
      <select id="type" name="type" required>
        <option value="" disabled <%= course == null ? "selected" : "" %>>Select course type</option>
        <option value="Online" <%= course != null && "Online".equals(course.getType()) ? "selected" : "" %>>Online</option>
        <option value="Offline" <%= course != null && "Offline".equals(course.getType()) ? "selected" : "" %>>Offline</option>
      </select>
    </div>

    <div class="form-group">
      <label for="description">Description</label>
      <textarea id="description" name="description" maxlength="500"
                placeholder="Enter course description (max 500 characters)"><%= course != null ? course.getDescription() : "" %></textarea>
    </div>

    <div class="form-group">
      <label for="instructor" class="required">Instructor</label>
      <input type="text" id="instructor" name="instructor"
             value="<%= course != null ? course.getInstructor() : "" %>"
             required pattern="[A-Za-z\s]{3,50}"
             title="Only letters and spaces, 3–50 characters"
             placeholder="Enter instructor name"/>
    </div>

    <div class="form-group">
      <label for="credits" class="required">Credits</label>
      <input type="number" id="credits" name="credits"
             value="<%= course != null ? course.getCredits() : "" %>"
             min="1" max="10" required
             placeholder="Enter credit value"/>
    </div>

    <div class="form-group">
      <label for="capacity" class="required">Capacity</label>
      <input type="number" id="capacity" name="capacity"
             value="<%= course != null ? course.getCapacity() : "" %>"
             min="1" max="1000" required
             placeholder="Enter maximum capacity"/>
    </div>

    <div class="form-group">
      <label for="platform">Platform</label>
      <input type="text" id="platform" name="platform"
             value="<%= course != null ? course.getPlatform() : "" %>"
             pattern="[A-Za-z\s]{3,50}"
             title="Only letters and spaces, 3–50 characters"
             placeholder="e.g., Zoom, Google Meet"/>
    </div>

    <div class="form-group">
      <label for="meetingLink">Meeting Link</label>
      <input type="url" id="meetingLink" name="meetingLink"
             value="<%= course != null ? course.getMeetingLink() : "" %>"
             placeholder="Enter meeting URL (e.g., https://...)"/>
    </div>

    <div class="form-actions">
      <a href="courses" class="btn btn-secondary"><i class="fas fa-times"></i> Cancel</a>
      <button type="submit" class="btn btn-primary"><i class="fas fa-save"></i> Save Course</button>
    </div>
  </form>
</div>

<!-- ✅ Input restriction script -->
<script>
  // Letters and spaces only
  document.getElementById("name").addEventListener("input", function () {
    this.value = this.value.replace(/[^A-Za-z\s]/g, '');
  });

  document.getElementById("instructor").addEventListener("input", function () {
    this.value = this.value.replace(/[^A-Za-z\s]/g, '');
  });

  document.getElementById("platform").addEventListener("input", function () {
    this.value = this.value.replace(/[^A-Za-z\s]/g, '');
  });

  // Digits only
  document.getElementById("credits").addEventListener("input", function () {
    this.value = this.value.replace(/[^0-9]/g, '');
  });

  document.getElementById("capacity").addEventListener("input", function () {
    this.value = this.value.replace(/[^0-9]/g, '');
  });
</script>
</body>
</html>
