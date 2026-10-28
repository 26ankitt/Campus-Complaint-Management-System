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

@WebServlet("/complaintDetails")
public class ComplaintDetailsServlet extends HttpServlet {
    private final ComplaintDAO complaintDAO = new ComplaintDAO();

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        HttpSession session = request.getSession(false);
        if (session == null || session.getAttribute("role") == null) {
            response.sendRedirect(request.getContextPath() + "/login.jsp");
            return;
        }

        try {
            int id = Integer.parseInt(request.getParameter("id"));
            Complaint complaint = complaintDAO.getComplaintById(id);
            if (complaint == null) {
                request.setAttribute("error", "Complaint not found.");
                request.getRequestDispatcher(backPage(session)).forward(request, response);
                return;
            }
            if ("STUDENT".equals(session.getAttribute("role")) && complaint.getUserId() != (Integer) session.getAttribute("userId")) {
                response.sendRedirect(request.getContextPath() + "/studentComplaints?error=" + URLEncoder.encode("Unauthorized access", "UTF-8"));
                return;
            }

            request.setAttribute("complaint", complaint);
            request.getRequestDispatcher("complaint-details.jsp").forward(request, response);
        } catch (Exception e) {
            e.printStackTrace();
            request.setAttribute("error", "Invalid complaint request.");
            request.getRequestDispatcher(backPage(session)).forward(request, response);
        }
    }

    private String backPage(HttpSession session) {
        return "ADMIN".equals(session.getAttribute("role")) ? "admin-dashboard.jsp" : "student-dashboard.jsp";
    }
}
