<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%
    String username = (String) session.getAttribute("username");
    String fullName = (String) session.getAttribute("fullName");
    if (username == null) {
        response.sendRedirect(request.getContextPath() + "/login.jsp");
        return;
    }
%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>Welcome - Dashboard</title>
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
        .card {
            background: #ffffff;
            padding: 2rem 2.5rem;
            border-radius: 8px;
            box-shadow: 0 4px 12px rgba(0, 0, 0, 0.1);
            text-align: center;
            max-width: 420px;
        }
        h1 {
            color: #1b5e20;
            margin-top: 0;
        }
        p {
            color: #444;
            font-size: 1.05rem;
        }
        .logout-btn {
            display: inline-block;
            margin-top: 1.2rem;
            padding: 0.6rem 1.4rem;
            background-color: #d32f2f;
            color: #fff;
            text-decoration: none;
            border-radius: 4px;
            font-weight: bold;
        }
        .logout-btn:hover {
            background-color: #b71c1c;
        }
    </style>
</head>
<body>
<div class="card">
    <h1>Login Successful!</h1>
    <p>Welcome, <strong><%= fullName %></strong> (<code><%= username %></code>)</p>
    <p>Your credentials were verified from the MySQL database (<code>login_db.users</code>).</p>
    <a class="logout-btn" href="<%= request.getContextPath() %>/logout">Logout</a>
</div>
</body>
</html>
