<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Student Login</title>
    <style>
        :root {
            --primary-color: #2563E9; /* Updated to exact requested blue */
            --secondary-color: #3B82F6; /* Slightly lighter blue */
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
            background-color: var(--background-lighter);
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

        input[type="email"],
        input[type="password"] {
            width: 100%;
            padding: 0.8rem;
            border: 1px solid var(--border-color);
            border-radius: 4px;
            background-color: var(--background-light);
            color: var(--text-dark);
            font-size: 1rem;
            transition: border 0.3s, box-shadow 0.3s;
        }

        input:focus {
            outline: none;
            border-color: var(--primary-color);
            box-shadow: 0 0 0 2px rgba(37, 99, 233, 0.2); /* Updated shadow color */
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

        .register-link {
            text-align: center;
            margin-top: 1.5rem;
            color: var(--text-muted);
            font-size: 0.9rem;
        }

        .register-link a {
            color: var(--primary-color);
            text-decoration: none;
            font-weight: 500;
        }

        .register-link a:hover {
            text-decoration: underline;
        }

        .forgot-password {
            text-align: right;
            margin-top: -0.5rem;
            margin-bottom: 1rem;
        }

        .forgot-password a {
            color: var(--primary-color);
            text-decoration: none;
            font-size: 0.85rem;
        }

        .forgot-password a:hover {
            text-decoration: underline;
        }

        .error-message{
            color: red;
            font-weight: bold;
            text-align: center;
        }
    </style>
</head>
<body>
    <div class="container">
        <h1>Student Login</h1>
        <form action="<%=request.getContextPath()%>/student-login" method="post">
            <div class="form-group">
                <label for="email">Email</label>
                <input type="email" id="email" name="email" required placeholder="Enter your email">
            </div>

            <div class="form-group">
                <label for="password">Password</label>
                <input type="password" id="password" name="password" required placeholder="Enter your password">
            </div>

            <button type="submit">Login</button>

            <p class="error-msg">
                <%if (session.getAttribute("email-password-incorrect") != null) { %>
                Email or Password incorrect !
                <%
                        session.removeAttribute("email-password-incorrect");
                    }
                %>
            </p>

            <div class="register-link">
                Don't have an account? <a href="<%=request.getContextPath()%>/pages/student/student-register.jsp">Register here</a>
            </div>


        </form>
    </div>
</body>
</html>