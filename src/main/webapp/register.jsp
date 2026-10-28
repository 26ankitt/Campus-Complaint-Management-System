<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html>
<head>
    <title>Register</title>
    <link rel="stylesheet" href="css/style.css">
    <script src="js/script.js" defer></script>
</head>
<body>
<nav class="navbar">
    <div class="brand">Campus Complaints</div>
    <div><a href="index.jsp">Home</a><a href="login.jsp">Login</a></div>
</nav>
<main class="container narrow">
    <div class="card">
        <h2>Student Registration</h2>
        <% if (request.getAttribute("error") != null) { %><p class="alert error"><%= request.getAttribute("error") %></p><% } %>
        <form action="register" method="post" onsubmit="return validateRequired(this)">
            <label>Name</label>
            <input type="text" name="name" required>
            <label>Email</label>
            <input type="email" name="email" required>
            <label>Password</label>
            <input type="password" name="password" required minlength="4">
            <button class="btn full" type="submit">Register</button>
        </form>
    </div>
</main>
</body>
</html>
