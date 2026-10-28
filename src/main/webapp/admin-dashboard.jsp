<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%
    if (session == null || !"ADMIN".equals(session.getAttribute("role"))) {
        response.sendRedirect(request.getContextPath() + "/login.jsp");
        return;
    }
%>
<!DOCTYPE html>
<html>
<head>
    <title>Admin Dashboard</title>
    <link rel="stylesheet" href="css/style.css">
</head>
<body>
<nav class="navbar">
    <div class="brand">Campus Complaints</div>
    <div><a href="admin-dashboard.jsp">Dashboard</a><a href="adminComplaints">All Complaints</a><a href="logout">Logout</a></div>
</nav>
<main class="container">
    <h1>Admin Dashboard</h1>
    <% if (request.getAttribute("error") != null) { %><p class="alert error"><%= request.getAttribute("error") %></p><% } %>
    <div class="grid">
        <div class="card">
            <h3>Complaint Management</h3>
            <p>Review submitted complaints, update status, and add responses for students.</p>
            <a class="btn" href="adminComplaints">View All Complaints</a>
        </div>
    </div>
</main>
</body>
</html>
