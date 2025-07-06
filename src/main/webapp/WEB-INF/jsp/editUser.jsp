<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
    <title>Edit User</title>
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css">
    <style>
        .form-label {
            font-size: 1.1rem;
            font-weight: 600;
            color: #343a40;
        }
        .form-container {
            margin-top: 50px;
        }
        .back-btn {
            position: absolute;
            top: 20px;
            right: 20px;
        }
    </style>
</head>
<body class="container">
    <div class="card shadow-lg p-4 form-container">
        <div class="back-btn">
            <a href="${pageContext.request.contextPath}/user/users" class="btn btn-secondary">Back</a>
        </div>
        <h2 class="mb-4 text-center">Edit User</h2>

        <form action="${pageContext.request.contextPath}/user/update/${user.id}" method="post">
            <div class="row mb-3">
                <div class="col-md-6">
                    <label class="form-label" for="email">Email:</label> 
                    <input type="email" id="email" name="email" class="form-control" value="${user.email}" required>
                </div>
                <div class="col-md-6">
                    <label class="form-label" for="username">Username:</label> 
                    <input type="text" id="username" name="username" class="form-control" value="${user.username}" required>
                </div>
            </div>

            <div class="row mb-3">
                <div class="col-md-6">
                    <label class="form-label" for="password">Password:</label> 
                   <input type="password" id="password" name="password" class="form-control" value="${user.password}" required>
                </div>
                <div class="col-md-6">
                <label class="form-label">Assign Roles:</label> 
                <select class="form-select" name="roleIds"  required>
                    <c:forEach var="role" items="${roles}">
                        <option value="${role.id}" 
                            <c:forEach var="userRole" items="${user.roles}">
                                <c:if test="${userRole.id == role.id}">
                                    selected
                                </c:if>
                            </c:forEach>
                        >${role.name}</option>
                    </c:forEach>
                </select>
            </div>
            </div>

            <!-- Role Selection -->
            

            <div class="text-center">
                <button type="submit" class="btn btn-primary">Save Changes</button>
            </div>
        </form>
    </div>
</body>
</html>
