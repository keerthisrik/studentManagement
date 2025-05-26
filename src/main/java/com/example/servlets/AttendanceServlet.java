package com.example.servlets;

import com.example.dao.AttendanceDAO;
import com.example.model.Attendance;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.util.List;

@WebServlet("/AttendanceServlet")
public class AttendanceServlet extends HttpServlet {
    private static final long serialVersionUID = 1L;

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        AttendanceDAO attendanceDAO = new AttendanceDAO();
        List<Attendance> attendanceList = attendanceDAO.getAllAttendance();
        request.setAttribute("attendanceList", attendanceList);
        request.getRequestDispatcher("attendance_list.jsp").forward(request, response);
    }

    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String studentId = request.getParameter("studentId");
        String date = request.getParameter("date");
        String status = request.getParameter("status");

        if (studentId == null || date == null || status == null) {
            request.setAttribute("error", "All fields are required.");
            request.getRequestDispatcher("mark_attendance.jsp").forward(request, response);
            return;
        }

        Attendance attendance = new Attendance();
        attendance.setStudentId(studentId);
        attendance.setDate(date);
        attendance.setStatus(status);

        AttendanceDAO attendanceDAO = new AttendanceDAO();
        boolean isInserted = attendanceDAO.addAttendance(attendance);

        if (isInserted) {
            request.setAttribute("message", "Attendance marked successfully.");
        } else {
            request.setAttribute("error", "Failed to mark attendance.");
        }

        request.getRequestDispatcher("mark_attendance.jsp").forward(request, response);
    }
}
