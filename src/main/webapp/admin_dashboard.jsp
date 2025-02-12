<%@ page import="java.util.List, model.Attendance" %>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<html>
<head>
    <title>Attendance Management</title>
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css">
    <style>
        .banner {
            background: url('https://ufreeonline.net/wp-content/uploads/2019/04/student-of-the-month-banner-elegant-kym-jackson-shen-wedding-and-event-planning-courses-of-student-of-the-month-banner.png') no-repeat center center/cover;
            height: 300px;
            display: flex;
            align-items: center;
            justify-content: center;
            color: white;
            font-size: 2rem;
            font-weight: bold;
        }
        .footer {
            background-color: #343a40;
            color: white;
            text-align: center;
            padding: 10px;
            position: fixed;
            bottom: 0;
            width: 100%;
        }
    </style>
</head>
<body>
    <!-- Navbar -->
    <nav class="navbar navbar-expand-lg navbar-dark bg-dark">
        <div class="container">
            <a class="navbar-brand" href="#">Attendance System</a>
            <button class="navbar-toggler" type="button" data-bs-toggle="collapse" data-bs-target="#navbarNav">
                <span class="navbar-toggler-icon"></span>
            </button>
            <div class="collapse navbar-collapse" id="navbarNav">
                <ul class="navbar-nav ms-auto">
                    <li class="nav-item"><a class="nav-link" href="mark_attendance.jsp">Mark Attendance</a></li>
                    <li class="nav-item"><a class="nav-link" href="AttendanceServlet">View Attendance</a></li>
                    <li class="nav-item"><a class="nav-link" href="LogoutServlet">Logout</a></li>
                </ul>
            </div>
        </div>
    </nav>
    
    <!-- Banner -->
    <div class="banner">Welcome to the Attendance Management System</div>
    
    <div class="container mt-5">
        <h2 class="text-center">Attendance Records</h2>
        <table class="table table-bordered">
            <thead class="table-dark">
                <tr>
                    <th>Student ID</th>
                    <th>Date</th>
                    <th>Status</th>
                </tr>
            </thead>
            <tbody>
                <% 
                    List<Attendance> attendanceList = (List<Attendance>) request.getAttribute("attendanceList");
                    if (attendanceList != null) {
                        for (Attendance a : attendanceList) { 
                %>
                <tr>
                    <td><%= a.getStudentId() %></td>  
                    <td><%= a.getDate() %></td>
                    <td><%= a.getStatus() %></td>
                </tr>
                <% 
                        }
                    } else { 
                %>
                <tr>
                    <td colspan="3" class="text-center">No records found</td>
                </tr>
                <% } %>
            </tbody>
        </table>
        
        <div class="text-center mt-4">
            <a href="mark_attendance.jsp" class="btn btn-primary">Mark Attendance</a>
            <a href="AttendanceServlet" class="btn btn-info">View Attendance</a>
            <a href="LogoutServlet" class="btn btn-danger">Logout</a>
        </div>
    </div>
    
    <!-- Footer -->
    <div class="footer">&copy; 2025 Attendance Management System. All Rights Reserved.</div>
    
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/js/bootstrap.bundle.min.js"></script>
</body>
</html>
