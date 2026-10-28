package com.campuscomplaint.dao;

import com.campuscomplaint.model.Complaint;
import com.campuscomplaint.util.DBConnection;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

public class ComplaintDAO {
    public boolean addComplaint(Complaint complaint) throws SQLException {
        String sql = "INSERT INTO complaints (user_id, title, description, category, priority, status) VALUES (?, ?, ?, ?, ?, 'SUBMITTED')";
        try (Connection con = DBConnection.getConnection();
             PreparedStatement ps = con.prepareStatement(sql)) {
            ps.setInt(1, complaint.getUserId());
            ps.setString(2, complaint.getTitle());
            ps.setString(3, complaint.getDescription());
            ps.setString(4, complaint.getCategory());
            ps.setString(5, complaint.getPriority());
            return ps.executeUpdate() > 0;
        }
    }

    public List<Complaint> getComplaintsByUserId(int userId) throws SQLException {
        String sql = "SELECT c.*, u.name FROM complaints c JOIN users u ON c.user_id = u.id WHERE c.user_id = ? ORDER BY c.created_at DESC";
        try (Connection con = DBConnection.getConnection();
             PreparedStatement ps = con.prepareStatement(sql)) {
            ps.setInt(1, userId);
            try (ResultSet rs = ps.executeQuery()) {
                return mapList(rs);
            }
        }
    }

    public List<Complaint> getAllComplaints() throws SQLException {
        String sql = "SELECT c.*, u.name FROM complaints c JOIN users u ON c.user_id = u.id ORDER BY c.created_at DESC";
        try (Connection con = DBConnection.getConnection();
             PreparedStatement ps = con.prepareStatement(sql);
             ResultSet rs = ps.executeQuery()) {
            return mapList(rs);
        }
    }

    public Complaint getComplaintById(int id) throws SQLException {
        String sql = "SELECT c.*, u.name FROM complaints c JOIN users u ON c.user_id = u.id WHERE c.id = ?";
        try (Connection con = DBConnection.getConnection();
             PreparedStatement ps = con.prepareStatement(sql)) {
            ps.setInt(1, id);
            try (ResultSet rs = ps.executeQuery()) {
                return rs.next() ? mapComplaint(rs) : null;
            }
        }
    }

    public boolean updateComplaint(int id, String status, String adminResponse) throws SQLException {
        String sql = "UPDATE complaints SET status = ?, admin_response = ?, updated_at = CURRENT_TIMESTAMP WHERE id = ?";
        try (Connection con = DBConnection.getConnection();
             PreparedStatement ps = con.prepareStatement(sql)) {
            ps.setString(1, status);
            ps.setString(2, adminResponse);
            ps.setInt(3, id);
            return ps.executeUpdate() > 0;
        }
    }

    private List<Complaint> mapList(ResultSet rs) throws SQLException {
        List<Complaint> complaints = new ArrayList<>();
        while (rs.next()) {
            complaints.add(mapComplaint(rs));
        }
        return complaints;
    }

    private Complaint mapComplaint(ResultSet rs) throws SQLException {
        Complaint complaint = new Complaint();
        complaint.setId(rs.getInt("id"));
        complaint.setUserId(rs.getInt("user_id"));
        complaint.setStudentName(rs.getString("name"));
        complaint.setTitle(rs.getString("title"));
        complaint.setDescription(rs.getString("description"));
        complaint.setCategory(rs.getString("category"));
        complaint.setPriority(rs.getString("priority"));
        complaint.setStatus(rs.getString("status"));
        complaint.setAdminResponse(rs.getString("admin_response"));
        complaint.setCreatedAt(rs.getTimestamp("created_at"));
        complaint.setUpdatedAt(rs.getTimestamp("updated_at"));
        return complaint;
    }
}
