<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
    <title>Add Role</title>
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css">
   <style>
    body {
background: url('https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcT7zo4fmQ4g-NXMIgjP5qEU0Dwo4k6ApjJBEQ&s') no-repeat center center fixed;
        background-size: cover;
        background-attachment: fixed;
        font-family: Arial, sans-serif;
    }

    .card {
    background-color: rgba(255, 255, 255, 0.85);
    box-shadow: 0 0 20px rgba(0, 0, 0, 0.3);
    border-radius: 15px;
}


    .form-label {
        font-size: 1.1rem;
        font-weight: 600;
        color: #343a40;
    }
</style>

</head>
<body class="container mt-5">

    

    <div class="card shadow-lg p-4">
    <!-- Back Button in Top-Right -->
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
        <h2 class="mb-4 text-center">Add Role</h2>

        <form action="${pageContext.request.contextPath}/role/saveRole" method="post">
            <div class="row mb-3">
                <div class="col-md-6">
                    <label class="form-label" for="name">Role Name:</label>
                    <input type="text" id="name" name="name" class="form-control" required>
                </div>
            </div>

            <div class="text-center">
                <button type="submit" class="btn btn-primary">Save</button>
            </div>
        </form>
    </div>

</body>
</html>
