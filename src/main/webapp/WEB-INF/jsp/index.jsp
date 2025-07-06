<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Login Page</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css" rel="stylesheet">
    <style>
        body {
            background: url('https://www.adworthmedia.org/blog/wp-content/uploads/2024/06/image-17.png') no-repeat center center fixed;
            background-size: cover;
            height: 100vh;
            margin: 0;
        }
        .form-label {
            font-size: 1.25rem;
            font-weight: bold;
            color: #000;
        }
        h3 {
            font-size: 2.2rem;
            font-weight: bold;
            color: #000;
        }
        .brand-header {
            background-color: rgba(52, 58, 64, 0.8); /* Dark overlay on header */
            color: #fff;
            padding: 20px 0;
            text-align: center;
            margin-bottom: 30px;
        }
        .brand-header h1 {
            margin: 0;
            font-size: 2.5rem;
        }
        .card {
            margin-top: 50px;
            padding: 30px;
            background-color: rgba(255, 255, 255, 0.9); /* Card background with slight transparency */
            box-shadow: 0 4px 6px rgba(0, 0, 0, 0.1);
        }
    </style>
</head> 
<body>

    <!-- Outdoor Media Management Banner -->
    <div class="brand-header">
        <h1>AdSphere</h1>
    </div>

    <div class="container d-flex justify-content-center align-items-center min-vh-150">
        <div class="card shadow-lg" style="width: 350px;">
            <h4 class="text-center text-danger">${msg}</h4>
            <h3 class="text-center">Login</h3>
            <form action="${pageContext.request.contextPath}/login/checkLogin" method="post">
                <div class="mb-3">
                    <label class="form-label">Username</label>
                    <input type="text" name="username" class="form-control" required>
                </div>
                <div class="mb-3">
                    <label class="form-label">Password</label>
                    <div class="input-group">
                        <input type="password" class="form-control" name="password" id="loginPassword" required>
                        <button class="btn btn-outline-secondary" type="button" onclick="togglePassword('loginPassword')">👁</button>
                    </div>
                </div>
                <button type="submit" class="btn btn-primary w-100">Login</button>
            </form>
            <div class="text-center mt-3">
                <p>Don't have an account? <a href="/OutDoorMedia/user/add">Sign Up</a></p>
            </div>
        </div>
    </div>

    <script>
        function togglePassword(id) {
            var input = document.getElementById(id);
            if (input.type === "password") {
                input.type = "text";
            } else {
                input.type = "password";
            }
        }
    </script>

    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/js/bootstrap.bundle.min.js"></script>
</body>
</html>
