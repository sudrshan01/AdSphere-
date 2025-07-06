<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
    <title>Media Assets</title>
    <!-- Bootstrap CSS -->
    <link href="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css" rel="stylesheet">
    <!-- Font Awesome -->
    <link href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.15.3/css/all.min.css" rel="stylesheet">
</head>
<body>
    <div class="container mt-4">
    <div class="d-flex justify-content-between align-items-center mb-2">
            <h1>Media Assets</h1>  <div>
               <a href="${pageContext.request.contextPath}/login/home" class="btn btn-secondary">Back</a>
            <!-- Add New Campaign Button at the top-right -->
             <a href="${pageContext.request.contextPath}/media/add" class="btn btn-success">
            <i class="fas fa-plus-circle"></i> Add New Asset
        </a>
           
        </div>  </div>
        
        <table class="table table-striped table-bordered">
            <thead>
                <tr>
                    <th>ID</th>
                    <th>Location</th>
                    <th>Type</th>
                    <th>Price</th>
                    <th>Actions</th>
                </tr>
            </thead>
            <tbody>
                <c:forEach var="asset" items="${assets}">
                    <tr>
                        <td>${asset.id}</td>
                        <td>${asset.location}</td>
                        <td>${asset.type}</td>
                        <td>${asset.price}</td>
                        <td>
                            <a href="${pageContext.request.contextPath}/media/edit/${asset.id}" class="btn btn-primary btn-sm">
                                <i class="fas fa-edit"></i> Edit
                            </a>
                            <a href="${pageContext.request.contextPath}/media/delete/${asset.id}" 
                               class="btn btn-danger btn-sm" 
                               onclick="return confirm('Are you sure?')">
                                <i class="fas fa-trash-alt"></i> Delete
                            </a>
                        </td>
                    </tr>
                </c:forEach>
            </tbody>
        </table>
       
    </div>

    <!-- Bootstrap JS and dependencies -->
    <script src="https://code.jquery.com/jquery-3.5.1.slim.min.js"></script>
    <script src="https://cdn.jsdelivr.net/npm/@popperjs/core@2.5.2/dist/umd/popper.min.js"></script>
    <script src="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"></script>
</body>
</html>
