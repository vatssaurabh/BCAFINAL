<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>User Login - JSP &amp; Servlet</title>
    <style>
        body {
            font-family: Arial, sans-serif;
            background-color: #f4f6f9;
            display: flex;
            justify-content: center;
            align-items: center;
            height: 100vh;
            margin: 0;
        }
        .login-card {
            background: #ffffff;
            padding: 2rem 2.5rem;
            border-radius: 8px;
            box-shadow: 0 4px 12px rgba(0, 0, 0, 0.1);
            width: 340px;
        }
        h2 {
            margin-top: 0;
            color: #333;
            text-align: center;
        }
        .form-group {
            margin-bottom: 1rem;
        }
        label {
            display: block;
            margin-bottom: 0.4rem;
            color: #555;
            font-weight: bold;
        }
        input[type="text"], input[type="password"] {
            width: 100%;
            padding: 0.6rem;
            border: 1px solid #ccc;
            border-radius: 4px;
            box-sizing: border-box;
        }
        button {
            width: 100%;
            padding: 0.7rem;
            background-color: #0066cc;
            border: none;
            color: white;
            font-size: 1rem;
            border-radius: 4px;
            cursor: pointer;
        }
        button:hover {
            background-color: #0052a3;
        }
        .alert-error {
            background-color: #fdecea;
            color: #b71c1c;
            padding: 0.7rem;
            border-radius: 4px;
            margin-bottom: 1rem;
            font-size: 0.9rem;
        }
        .alert-success {
            background-color: #e8f5e9;
            color: #1b5e20;
            padding: 0.7rem;
            border-radius: 4px;
            margin-bottom: 1rem;
            font-size: 0.9rem;
        }
        .hint {
            margin-top: 1.2rem;
            font-size: 0.82rem;
            color: #666;
            background: #f8f9fa;
            padding: 0.6rem;
            border-radius: 4px;
            border: 1px dashed #ccc;
        }
    </style>
</head>
<body>
<div class="login-card">
    <h2>Login Portal</h2>

    <%
        String errorMessage = (String) request.getAttribute("errorMessage");
        if (errorMessage != null) {
    %>
        <div class="alert-error"><%= errorMessage %></div>
    <%
        }
        if ("true".equals(request.getParameter("logout"))) {
    %>
        <div class="alert-success">You have been logged out successfully.</div>
    <%
        }
    %>

    <form action="<%= request.getContextPath() %>/login" method="post">
        <div class="form-group">
            <label for="username">Username</label>
            <input type="text" id="username" name="username" placeholder="Enter username" required autofocus>
        </div>

        <div class="form-group">
            <label for="password">Password</label>
            <input type="password" id="password" name="password" placeholder="Enter password" required>
        </div>

        <button type="submit">Sign In</button>
    </form>

    <div class="hint">
        <strong>Default DB Accounts:</strong><br>
        &bull; <code>admin</code> / <code>admin123</code><br>
        &bull; <code>saurabh</code> / <code>pass123</code>
    </div>
</div>
</body>
</html>
