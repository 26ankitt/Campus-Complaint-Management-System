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
    <title>Submit Complaint</title>
    <link rel="stylesheet" href="css/style.css">
    <script src="js/script.js" defer></script>
</head>
<body>
<nav class="navbar">
    <div class="brand">Campus Complaints</div>
    <div><a href="student-dashboard.jsp">Dashboard</a><a href="studentComplaints">My Complaints</a><a href="logout">Logout</a></div>
</nav>
<main class="container narrow">
    <div class="card">
        <h2>Submit Complaint</h2>
        <% if (request.getAttribute("error") != null) { %><p class="alert error"><%= request.getAttribute("error") %></p><% } %>
        <form action="submitComplaint" method="post" onsubmit="return validateRequired(this)">
            <label>Title</label>
            <input type="text" name="title" required>
            <label>Description</label>
            <textarea name="description" rows="5" required></textarea>
            <label>Category</label>
            <select name="category" required>
                <option value="">Select category</option>
                <option>Academics</option><option>Infrastructure</option><option>Hostel</option>
                <option>Library</option><option>Transport</option><option>Internet</option><option>Other</option>
            </select>
            <label>Priority</label>
            <select name="priority" required>
                <option value="">Select priority</option>
                <option>LOW</option><option>MEDIUM</option><option>HIGH</option>
            </select>
            <button class="btn full" type="submit">Submit Complaint</button>
        </form>
    </div>
</main>
</body>
</html>
