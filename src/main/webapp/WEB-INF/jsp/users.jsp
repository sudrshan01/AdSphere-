<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
    <title>Users</title>
    <!-- Bootstrap CSS -->
    <link href="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css" rel="stylesheet">
    <!-- Font Awesome -->
    <link href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.15.3/css/all.min.css" rel="stylesheet">
</head>
<body>
    <div class="container mt-4">
        <div class="d-flex justify-content-between align-items-center mb-2">
            <h1>Users</h1>
              <div>
               <a href="${pageContext.request.contextPath}/login/home" class="btn btn-secondary">Back</a>
            <!-- Add New User Button at the top-right -->
            <a href="${pageContext.request.contextPath}/user/add" class="btn btn-success">
                <i class="fas fa-plus-circle"></i> Add New User
            </a>
        </div>
  </div>
        <table class="table table-striped table-bordered">
            <thead>
                <tr>
                    <th>ID</th>
                    <th>Username</th>
                    <th>Email</th>
                    <th>Roles</th>
                    <th>Actions</th>
                </tr>
            </thead>
            <tbody>
                <c:forEach var="user" items="${users}">
                    <tr>
                        <td>${user.id}</td>
                        <td>${user.username}</td>
                        <td>${user.email}</td>
                        <td>
                            <c:forEach var="role" items="${user.roles}">
                                ${role.name}<br>
                            </c:forEach>
                        </td>
                        <td>
                            <!-- Action buttons with Font Awesome icons -->
                            <a href="${pageContext.request.contextPath}/user/edit/${user.id}" class="btn btn-primary btn-sm">
                                <i class="fas fa-edit"></i> Edit
                            </a> |
                            <a href="${pageContext.request.contextPath}/user/delete/${user.id}" class="btn btn-danger btn-sm" onclick="return confirm('Are you sure you want to delete this user?');">
                                <i class="fas fa-trash-alt"></i> Delete
                            </a>
                        </td>
                    </tr>
                </c:forEach>
            </tbody>
        </table>

        <a href="${pageContext.request.contextPath}/role/roles" class="btn btn-secondary">
            <i class="fas fa-cogs"></i> Manage Roles
        </a>
    </div>

    <!-- Bootstrap JS and dependencies -->
    <script src="https://code.jquery.com/jquery-3.5.1.slim.min.js"></script>
    <script src="https://cdn.jsdelivr.net/npm/@popperjs/core@2.5.2/dist/umd/popper.min.js"></script>
    <script src="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"></script>
</body>
</html>
