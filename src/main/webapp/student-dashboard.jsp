<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%
    if (session == null || !"STUDENT".equals(session.getAttribute("role"))) {
        response.sendRedirect(request.getContextPath() + "/login.jsp");
        return;
    }
%>
<!DOCTYPE html>
<html>
<head>
    <title>Student Dashboard</title>
    <link rel="stylesheet" href="css/style.css">
</head>
<body>
<nav class="navbar">
    <div class="brand">Campus Complaints</div>
    <div><a href="student-dashboard.jsp">Dashboard</a><a href="studentComplaints">My Complaints</a><a href="logout">Logout</a></div>
</nav>
<main class="container">
    <h1 style="font-size: 40px;">Welcome, <%= session.getAttribute("userName") %></h1>
    <% if (request.getAttribute("error") != null) { %><p class="alert error"><%= request.getAttribute("error") %></p><% } %>
    <div class="grid">
        <div class="card">
            <h3>Submit Complaint</h3>
            <p>Report academic, hostel, transport, internet, or other campus issues.</p>
            <a class="btn" href="submit-complaint.jsp">Submit Now</a>
        </div>
        <div class="card">
            <h3>Track Complaints</h3>
            <p>View complaint status and admin responses.</p>
            <a class="btn secondary" href="studentComplaints">View My Complaints</a>
        </div>
    </div>
</main>
</body>
</html>
