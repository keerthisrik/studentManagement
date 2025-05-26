package com.example.dao;

import com.example.model.Attendance;
import com.example.dbconnection.DBConnection;

import java.sql.*;
import java.util.ArrayList;
import java.util.List;

public class AttendanceDAO {

    // Method to insert attendance into the database
    public boolean addAttendance(Attendance attendance) {
        String query = "INSERT INTO attendance (student_id, date, status) VALUES (?, ?, ?)";
        try (Connection conn = DBConnection.getConnection();
             PreparedStatement stmt = conn.prepareStatement(query)) {

            stmt.setString(1, attendance.getStudentId());
            stmt.setString(2, attendance.getDate());
            stmt.setString(3, attendance.getStatus());

            int rowsAffected = stmt.executeUpdate();
            return rowsAffected > 0; // Returns true if insert was successful
        } catch (SQLException e) {
            e.printStackTrace();
            return false;
        }
    }

    // Method to retrieve all attendance records
    public List<Attendance> getAllAttendance() {
        List<Attendance> attendanceList = new ArrayList<>();
        String query = "SELECT * FROM attendance ORDER BY date DESC";

        try (Connection conn = DBConnection.getConnection();
             Statement stmt = conn.createStatement();
             ResultSet rs = stmt.executeQuery(query)) {

            while (rs.next()) {
                Attendance attendance = new Attendance();
                attendance.setId(rs.getInt("id"));
                attendance.setStudentId(rs.getString("student_id"));
                attendance.setDate(rs.getString("date"));
                attendance.setStatus(rs.getString("status"));

                attendanceList.add(attendance);
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return attendanceList;
    }
}
