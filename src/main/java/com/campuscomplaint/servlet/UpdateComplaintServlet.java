package com.campuscomplaint.servlet;

import com.campuscomplaint.dao.ComplaintDAO;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.io.IOException;
import java.net.URLEncoder;

@WebServlet("/updateComplaint")
public class UpdateComplaintServlet extends HttpServlet {
    private final ComplaintDAO complaintDAO = new ComplaintDAO();

    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        HttpSession session = request.getSession(false);
        if (session == null || !"ADMIN".equals(session.getAttribute("role"))) {
            response.sendRedirect(request.getContextPath() + (session != null && "STUDENT".equals(session.getAttribute("role")) ? "/student-dashboard.jsp" : "/login.jsp"));
            return;
        }

        try {
            int id = Integer.parseInt(request.getParameter("id"));
            String status = request.getParameter("status");
            String adminResponse = request.getParameter("adminResponse");
            if (status == null || status.trim().isEmpty()) {
                response.sendRedirect(request.getContextPath() + "/complaintDetails?id=" + id + "&error=" + URLEncoder.encode("Status is required", "UTF-8"));
                return;
            }
            complaintDAO.updateComplaint(id, status, adminResponse == null ? "" : adminResponse.trim());
            response.sendRedirect(request.getContextPath() + "/complaintDetails?id=" + id + "&success=" + URLEncoder.encode("Complaint updated", "UTF-8"));
        } catch (Exception e) {
            e.printStackTrace();
            request.setAttribute("error", "Unable to update complaint.");
            request.getRequestDispatcher("admin-dashboard.jsp").forward(request, response);
        }
    }
}
