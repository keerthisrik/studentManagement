<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<html>
<head>
    <title>Mark Attendance</title>
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css">
    <style>
        .banner {
            background: url('https://static.vecteezy.com/system/resources/previews/004/807/800/original/back-to-school-banner-children-rejoice-at-the-start-of-the-school-year-satisfied-schoolchildren-vector.jpg') no-repeat center center/cover;
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
                    <li class="nav-item"><a class="nav-link" href="index.jsp">Home</a></li>
                    <li class="nav-item"><a class="nav-link" href="AttendanceServlet">View Attendance</a></li>
                    <li class="nav-item"><a class="nav-link" href="LogoutServlet">Logout</a></li>
                </ul>
            </div>
        </div>
    </nav>
    
    <!-- Banner -->
    <div class="banner">Mark Attendance</div>
    
    <div class="container mt-5">
        <h2 class="text-center">Mark Attendance</h2>
        
        <form action="AttendanceServlet" method="post" class="w-50 mx-auto border p-4 shadow rounded">
            <input type="text" name="studentId" class="form-control mb-3" placeholder="Student ID (e.g., S1001)" required>
            <input type="date" name="date" class="form-control mb-3" required>
            <select name="status" class="form-control mb-3">
                <option value="Present">Present</option>
                <option value="Absent">Absent</option>
            </select>
            <button type="submit" class="btn btn-success w-100">Submit</button>
            
            <% if (request.getAttribute("message") != null) { %>
                <div class="alert alert-success mt-3"><%= request.getAttribute("message") %></div>
            <% } %>

            <% if (request.getAttribute("error") != null) { %>
                <div class="alert alert-danger mt-3"><%= request.getAttribute("error") %></div>
            <% } %>
        </form>
    </div>
    
    <!-- Footer -->
    <div class="footer">&copy; 2025 Attendance Management System. All Rights Reserved.</div>
    
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/js/bootstrap.bundle.min.js"></script>
</body>
</html>
