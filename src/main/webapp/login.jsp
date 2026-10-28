<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html>
<head>
    <title>Login</title>
    <link rel="stylesheet" href="css/style.css">
    <script src="js/script.js" defer></script>
</head>
<body>
<nav class="navbar">
    <div class="brand">Campus Complaints</div>
    <div><a href="index.jsp">Home</a><a href="register.jsp">Register</a></div>
</nav>
<main class="container narrow">
    <div class="card">
        <h2>Login</h2>
        <% if (request.getAttribute("error") != null) { %><p class="alert error"><%= request.getAttribute("error") %></p><% } %>
        <% if (request.getAttribute("success") != null) { %><p class="alert success"><%= request.getAttribute("success") %></p><% } %>
        <form action="login" method="post" onsubmit="return validateRequired(this)">
            <label>Email</label>
            <input type="email" name="email" required>
            <label>Password</label>
            <input type="password" name="password" required>
            <button class="btn full" type="submit">Login</button>
        </form>
        <p class="muted">New student? <a href="register.jsp">Register here</a></p>
    </div>
</main>
</body>
</html>
