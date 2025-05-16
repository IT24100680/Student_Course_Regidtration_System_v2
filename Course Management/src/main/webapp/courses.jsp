<%@ page import="java.util.*, com.coursemanagement.model.Course" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html>
<head>
  <title>Course Management</title>
  <meta name="viewport" content="width=device-width, initial-scale=1.0">
  <link href="https://fonts.googleapis.com/css2?family=Inter:wght@300;400;500;600;700&display=swap" rel="stylesheet">
  <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.0.0/css/all.min.css">
  <style>
    :root {
      --primary: #4361ee;
      --primary-hover: #3a56d4;
      --secondary: #6c757d;
      --secondary-hover: #5a6268;
      --success: #28a745;
      --success-hover: #218838;
      --danger: #dc3545;
      --danger-hover: #c82333;
      --background: #f8fafc;
      --card: #ffffff;
      --text: #1e293b;
      --text-light: #64748b;
      --border: #e2e8f0;
      --shadow: 0 4px 6px -1px rgba(0, 0, 0, 0.1), 0 2px 4px -1px rgba(0, 0, 0, 0.06);
      --shadow-hover: 0 10px 15px -3px rgba(0, 0, 0, 0.1), 0 4px 6px -2px rgba(0, 0, 0, 0.05);
      --radius: 12px;
      --radius-sm: 8px;
      --transition: all 0.2s cubic-bezier(0.4, 0, 0.2, 1);
    }

    * {
      box-sizing: border-box;
      margin: 0;
      padding: 0;
    }

    body {
      font-family: 'Inter', system-ui, -apple-system, sans-serif;
      background-color: var(--background);
      color: var(--text);
      line-height: 1.5;
      padding: 2rem 1rem;
    }

    .container {
      max-width: 1200px;
      margin: 0 auto;
    }

    .header {
      display: flex;
      justify-content: space-between;
      align-items: center;
      margin-bottom: 2rem;
      flex-wrap: wrap;
      gap: 1rem;
    }

    h1 {
      font-size: 1.75rem;
      font-weight: 600;
      color: var(--text);
    }

    .search-container {
      display: flex;
      gap: 0.75rem;
      width: 100%;
      max-width: 600px;
    }

    .search-input {
      flex: 1;
      padding: 0.75rem 1rem;
      border: 1px solid var(--border);
      border-radius: var(--radius-sm);
      font-size: 0.9375rem;
      background-color: var(--card);
      transition: var(--transition);
    }

    .search-input:focus {
      border-color: var(--primary);
      outline: none;
      box-shadow: 0 0 0 3px rgba(67, 97, 238, 0.15);
    }

    .btn {
      padding: 0.75rem 1.25rem;
      border: none;
      border-radius: var(--radius-sm);
      font-size: 0.9375rem;
      font-weight: 500;
      cursor: pointer;
      transition: var(--transition);
      display: inline-flex;
      align-items: center;
      gap: 0.5rem;
    }

    .btn-primary {
      background-color: var(--primary);
      color: white;
    }

    .btn-primary:hover {
      background-color: var(--primary-hover);
      transform: translateY(-1px);
    }

    .btn-secondary {
      background-color: var(--secondary);
      color: white;
    }

    .btn-secondary:hover {
      background-color: var(--secondary-hover);
      transform: translateY(-1px);
    }

    .btn-success {
      background-color: var(--success);
      color: white;
    }

    .btn-success:hover {
      background-color: var(--success-hover);
      transform: translateY(-1px);
    }

    .btn-danger {
      background-color: var(--danger);
      color: white;
    }

    .btn-danger:hover {
      background-color: var(--danger-hover);
      transform: translateY(-1px);
    }

    .action-bar {
      display: flex;
      justify-content: space-between;
      align-items: center;
      margin-bottom: 1.5rem;
      flex-wrap: wrap;
      gap: 1rem;
    }

    .card {
      background-color: var(--card);
      border-radius: var(--radius);
      box-shadow: var(--shadow);
      overflow: hidden;
      transition: var(--transition);
    }

    .card:hover {
      box-shadow: var(--shadow-hover);
    }

    .table-responsive {
      overflow-x: auto;
    }

    table {
      width: 100%;
      border-collapse: collapse;
    }

    th {
      background-color: var(--primary);
      color: white;
      font-weight: 500;
      text-align: left;
      padding: 1rem;
      position: sticky;
      top: 0;
    }

    td {
      padding: 1rem;
      border-bottom: 1px solid var(--border);
      color: var(--text);
    }

    tr:last-child td {
      border-bottom: none;
    }

    tr:hover td {
      background-color: rgba(67, 97, 238, 0.03);
    }

    .badge {
      display: inline-block;
      padding: 0.35rem 0.65rem;
      font-size: 0.75rem;
      font-weight: 500;
      line-height: 1;
      text-align: center;
      white-space: nowrap;
      vertical-align: baseline;
      border-radius: 50rem;
    }

    .badge-online {
      background-color: #e3f2fd;
      color: #1976d2;
    }

    .badge-offline {
      background-color: #e8f5e9;
      color: #388e3c;
    }

    .actions-cell {
      display: flex;
      gap: 0.5rem;
      flex-wrap: wrap;
    }

    .empty-state {
      padding: 3rem 1rem;
      text-align: center;
      color: var(--text-light);
    }

    .empty-state i {
      font-size: 2.5rem;
      margin-bottom: 1rem;
      color: var(--border);
    }

    .empty-state h3 {
      font-weight: 500;
      margin-bottom: 0.5rem;
      color: var(--text);
    }

    @media (max-width: 768px) {
      .header {
        flex-direction: column;
        align-items: flex-start;
      }

      .search-container {
        width: 100%;
      }

      .actions-cell {
        flex-direction: column;
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
  <div class="header">
    <h1>Course Management</h1>
    <form method="get" action="courses" class="search-container">
      <input
              type="text"
              name="search"
              class="search-input"
              placeholder="Search courses by name, instructor..."
              value="<%= request.getParameter("search") != null ? request.getParameter("search") : "" %>"
      />
      <button type="submit" class="btn btn-primary">
        <i class="fas fa-search"></i> Search
      </button>
      <a href="courses" class="btn btn-secondary">
        <i class="fas fa-times"></i> Clear
      </a>
    </form>
  </div>

  <div class="action-bar">
    <a href="courseForm" class="btn btn-primary">
      <i class="fas fa-plus"></i> Add New Course
    </a>
  </div>

  <div class="card table-responsive">
    <table>
      <thead>
      <tr>
        <th>Course Name</th>
        <th>Type</th>
        <th>Instructor</th>
        <th>Credits</th>
        <th>Capacity</th>
        <th>Actions</th>
      </tr>
      </thead>
      <tbody>
      <%
        List<Course> courses = (List<Course>) request.getAttribute("courses");
        if (courses != null && !courses.isEmpty()) {
          for (int i = 0; i < courses.size(); i++) {
            Course c = courses.get(i);
      %>
      <tr>
        <td><strong><%= c.getName() %></strong></td>
        <td>
            <span class="badge <%= "Online".equals(c.getType()) ? "badge-online" : "badge-offline" %>">
              <%= c.getType() %>
            </span>
        </td>
        <td><%= c.getInstructor() %></td>
        <td><%= c.getCredits() %></td>
        <td><%= c.getCapacity() %></td>
        <td class="actions-cell">
          <a href="courseForm?action=edit&index=<%=i%>" class="btn btn-success">
            <i class="fas fa-edit"></i> Edit
          </a>
          <a href="deleteCourse?index=<%=i%>" class="btn btn-danger">
            <i class="fas fa-trash-alt"></i> Delete
          </a>
        </td>
      </tr>
      <%
        }
      } else {
      %>
      <tr>
        <td colspan="6">
          <div class="empty-state">
            <i class="fas fa-book-open"></i>
            <h3>No courses found</h3>
            <p><%= request.getParameter("search") != null ?
                    "Try adjusting your search query" :
                    "Add your first course to get started" %>
            </p>
          </div>
        </td>
      </tr>
      <%
        }
      %>
      </tbody>
    </table>
  </div>
</div>
</body>
</html>