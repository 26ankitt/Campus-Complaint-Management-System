package com.campuscomplaint.servlet;

import com.campuscomplaint.dao.ComplaintDAO;
import com.campuscomplaint.model.Complaint;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.io.IOException;
import java.net.URLEncoder;

@WebServlet("/submitComplaint")
public class SubmitComplaintServlet extends HttpServlet {
    private final ComplaintDAO complaintDAO = new ComplaintDAO();

    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        HttpSession session = request.getSession(false);
        if (!isStudent(session)) {
            response.sendRedirect(request.getContextPath() + redirectFor(session));
            return;
        }

        String title = request.getParameter("title");
        String description = request.getParameter("description");
        String category = request.getParameter("category");
        String priority = request.getParameter("priority");

        if (isBlank(title) || isBlank(description) || isBlank(category) || isBlank(priority)) {
            request.setAttribute("error", "All complaint fields are required.");
            request.getRequestDispatcher("submit-complaint.jsp").forward(request, response);
            return;
        }

        try {
            Complaint complaint = new Complaint();
            complaint.setUserId((Integer) session.getAttribute("userId"));
            complaint.setTitle(title.trim());
            complaint.setDescription(description.trim());
            complaint.setCategory(category);
            complaint.setPriority(priority);
            complaintDAO.addComplaint(complaint);
            response.sendRedirect(request.getContextPath() + "/studentComplaints?success=" + URLEncoder.encode("Complaint submitted successfully", "UTF-8"));
        } catch (Exception e) {
            e.printStackTrace();
            request.setAttribute("error", "Unable to submit complaint.");
            request.getRequestDispatcher("submit-complaint.jsp").forward(request, response);
        }
    }

    private boolean isStudent(HttpSession session) {
        return session != null && "STUDENT".equals(session.getAttribute("role"));
    }

    private String redirectFor(HttpSession session) {
        return session != null && "ADMIN".equals(session.getAttribute("role")) ? "/admin-dashboard.jsp" : "/login.jsp";
    }

    private boolean isBlank(String value) {
        return value == null || value.trim().isEmpty();
    }
}
