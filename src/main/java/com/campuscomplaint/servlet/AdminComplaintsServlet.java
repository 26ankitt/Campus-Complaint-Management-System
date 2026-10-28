package com.campuscomplaint.servlet;

import com.campuscomplaint.dao.ComplaintDAO;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.io.IOException;

@WebServlet("/adminComplaints")
public class AdminComplaintsServlet extends HttpServlet {
    private final ComplaintDAO complaintDAO = new ComplaintDAO();

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        HttpSession session = request.getSession(false);
        if (session == null || !"ADMIN".equals(session.getAttribute("role"))) {
            response.sendRedirect(request.getContextPath() + (session != null && "STUDENT".equals(session.getAttribute("role")) ? "/student-dashboard.jsp" : "/login.jsp"));
            return;
        }

        try {
            request.setAttribute("complaints", complaintDAO.getAllComplaints());
            request.setAttribute("pageTitle", "All Complaints");
            request.getRequestDispatcher("complaints.jsp").forward(request, response);
        } catch (Exception e) {
            e.printStackTrace();
            request.setAttribute("error", "Unable to load complaints.");
            request.getRequestDispatcher("admin-dashboard.jsp").forward(request, response);
        }
    }
}
