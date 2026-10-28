<%@ page import="com.campuscomplaint.model.Complaint" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%
    String role = session == null ? null : (String) session.getAttribute("role");
    Complaint complaint = (Complaint) request.getAttribute("complaint");
    if (role == null || complaint == null) {
        response.sendRedirect(request.getContextPath() + "/login.jsp");
        return;
    }
%>
<!DOCTYPE html>
<html>
<head>
    <title>Complaint Details</title>
    <link rel="stylesheet" href="css/style.css">
</head>
<body>
<nav class="navbar">
    <div class="brand">Campus Complaints</div>
    <div>
        <a href="<%= "ADMIN".equals(role) ? "adminComplaints" : "studentComplaints" %>">Back</a>
        <a href="logout">Logout</a>
    </div>
</nav>
<main class="container">
    <h1>Complaint #<%= complaint.getId() %></h1>
    <% if (request.getParameter("success") != null) { %><p class="alert success"><%= request.getParameter("success") %></p><% } %>
    <% if (request.getParameter("error") != null) { %><p class="alert error"><%= request.getParameter("error") %></p><% } %>
    <div class="card">
        <p><strong>Student:</strong> <%= complaint.getStudentName() %></p>
        <p><strong>Title:</strong> <%= complaint.getTitle() %></p>
        <p><strong>Description:</strong> <%= complaint.getDescription() %></p>
        <p><strong>Category:</strong> <%= complaint.getCategory() %></p>
        <p><strong>Priority:</strong> <%= complaint.getPriority() %></p>
        <p><strong>Status:</strong> <span class="badge <%= complaint.getStatus().toLowerCase() %>"><%= complaint.getStatus() %></span></p>
        <p><strong>Admin Response:</strong> <%= complaint.getAdminResponse() == null || complaint.getAdminResponse().isEmpty() ? "No response yet." : complaint.getAdminResponse() %></p>
        <p><strong>Created:</strong> <%= complaint.getCreatedAt() %></p>
        <p><strong>Updated:</strong> <%= complaint.getUpdatedAt() %></p>
    </div>
    <% if ("ADMIN".equals(role)) { %>
    <div class="card">
        <h2>Update Complaint</h2>
        <form action="updateComplaint" method="post">
            <input type="hidden" name="id" value="<%= complaint.getId() %>">
            <label>Status</label>
            <select name="status" required>
                <option <%= "SUBMITTED".equals(complaint.getStatus()) ? "selected" : "" %>>SUBMITTED</option>
                <option <%= "IN_PROGRESS".equals(complaint.getStatus()) ? "selected" : "" %>>IN_PROGRESS</option>
                <option <%= "RESOLVED".equals(complaint.getStatus()) ? "selected" : "" %>>RESOLVED</option>
                <option <%= "REJECTED".equals(complaint.getStatus()) ? "selected" : "" %>>REJECTED</option>
            </select>
            <label>Admin Response</label>
            <textarea name="adminResponse" rows="4"><%= complaint.getAdminResponse() == null ? "" : complaint.getAdminResponse() %></textarea>
            <button class="btn" type="submit">Update</button>
        </form>
    </div>
    <% } %>
</main>
</body>
</html>
