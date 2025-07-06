<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
    <title>Add Media Asset</title>
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css">
    <style>
        body {
            background: url('https://images.unsplash.com/photo-1533750349088-cd871a92f312?auto=format&fit=crop&w=3840&q=100') no-repeat center center fixed;
            background-size: cover;
            font-family: 'Segoe UI', sans-serif;
        }

        /* Overlay to improve form readability */
        .overlay {
            position: fixed;
            top: 0;
            left: 0;
            width: 100%;
            height: 100%;
            background-color: rgba(255, 255, 255, 0.85);
            z-index: -1;
        }

        .form-label {
            font-size: 1.1rem;
            font-weight: 600;
            color: #343a40;
        }

        .header-container {
            position: relative;
        }

        .center-title {
            position: absolute;
            left: 50%;
            transform: translateX(-50%);
            margin: 0;
            font-size: 1.8rem;
            font-weight: bold;
            color: #212529;
        }

        .card {
            background-color: #ffffffe6;
            border: none;
            border-radius: 1rem;
        }

        .btn-primary {
            background-color: #007bff;
            border: none;
        }

        .btn-primary:hover {
            background-color: #0056b3;
        }

        .btn-secondary {
            border-radius: 0.5rem;
        }
    </style>
</head>
<body class="container mt-5">
    <div class="overlay"></div>

    <div class="card shadow-lg p-4">
        <!-- Header with title and back button -->
        <div class="header-container mb-4">
            <h2 class="center-title">Add Media Asset</h2>
            <div class="d-flex justify-content-end">
                <c:choose>
                    <c:when test="${sessionScope.role == 'admin' || sessionScope.role == 'advtiser'}">
                        <a href="${pageContext.request.contextPath}/login/home" class="btn btn-secondary">Back</a>
                    </c:when>
                    <c:when test="${sessionScope.role == 'user'}">
                        <a href="${pageContext.request.contextPath}/login/userhome" class="btn btn-secondary">Back</a>
                    </c:when>
                    <c:otherwise>
                        <a href="${pageContext.request.contextPath}/index" class="btn btn-secondary">Back</a>
                    </c:otherwise>
                </c:choose>
            </div>
        </div>

        <!-- Form Section -->
        <form action="${pageContext.request.contextPath}/media/save" method="post">
            <div class="row mb-3">
                <div class="col-md-6">
                    <label class="form-label">Location:</label>
                    <input type="text" name="location" class="form-control" required>
                </div>
                <div class="col-md-6">
                    <label class="form-label">Type:</label>
                    <input type="text" name="type" class="form-control" required>
                </div>
            </div>
            <div class="row mb-3">
                <div class="col-md-6">
                    <label class="form-label">Price:</label>
                    <input type="number" name="price" class="form-control" step="0.01" min="0" required>
                </div>
            </div>
            <div class="text-center">
                <button type="submit" class="btn btn-primary">Save</button>
            </div>
        </form>
    </div>
    <script src="https://cdn.jsdelivr.net/npm/sweetalert2@11"></script>

<c:if test="${not empty successMessage}">
    <script>
        Swal.fire({
            icon: 'success',
            title: 'Success',
            text: '${successMessage}',
            confirmButtonColor: '#3085d6',
            confirmButtonText: 'OK'
        }).then((result) => {
            if (result.isConfirmed) {
                window.location.href = '${redirectAfterAlert}';
            }
        });
    </script>
</c:if>

    
</body>
</html>
