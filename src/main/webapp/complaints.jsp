<%@ page import="java.util.List" %>
<%@ page import="com.campuscomplaint.model.Complaint" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%
    String role = session == null ? null : (String) session.getAttribute("role");
    if (role == null) {
        response.sendRedirect(request.getContextPath() + "/login.jsp");
        return;
    }
    List<Complaint> complaints = (List<Complaint>) request.getAttribute("complaints");
%>
<!DOCTYPE html>
<html>
<head>
    <title><%= request.getAttribute("pageTitle") %></title>
    <link rel="stylesheet" href="css/style.css">
</head>
<body>
<nav class="navbar">
    <div class="brand">Campus Complaints</div>
    <div>
        <a href="<%= "ADMIN".equals(role) ? "admin-dashboard.jsp" : "student-dashboard.jsp" %>">Dashboard</a>
        <a href="logout">Logout</a>
    </div>
</nav>
<main class="container">
    <h1><%= request.getAttribute("pageTitle") %></h1>
    <% if (request.getParameter("success") != null) { %><p class="alert success"><%= request.getParameter("success") %></p><% } %>
    <% if (request.getParameter("error") != null) { %><p class="alert error"><%= request.getParameter("error") %></p><% } %>
    <div class="table-wrap">
        <table>
            <thead>
            <tr>
                <th>ID</th>
                <% if ("ADMIN".equals(role)) { %><th>Student</th><% } %>
                <th>Title</th>
                <th>Category</th>
                <th>Priority</th>
                <th>Status</th>
                <th>Created</th>
                <th>Action</th>
            </tr>
            </thead>
            <tbody>
            <% if (complaints == null || complaints.isEmpty()) { %>
            <tr><td colspan="<%= "ADMIN".equals(role) ? 8 : 7 %>">No complaints found.</td></tr>
            <% } else { for (Complaint c : complaints) { %>
            <tr>
                <td><%= c.getId() %></td>
                <% if ("ADMIN".equals(role)) { %><td><%= c.getStudentName() %></td><% } %>
                <td><%= c.getTitle() %></td>
                <td><%= c.getCategory() %></td>
                <td><span class="badge priority"><%= c.getPriority() %></span></td>
                <td><span class="badge <%= c.getStatus().toLowerCase() %>"><%= c.getStatus() %></span></td>
                <td><%= c.getCreatedAt() %></td>
                <td><a class="btn small" href="complaintDetails?id=<%= c.getId() %>">Details</a></td>
            </tr>
            <% }} %>
            </tbody>
        </table>
    </div>
</main>
</body>
</html>
