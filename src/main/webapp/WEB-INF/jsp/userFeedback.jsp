<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
    <title>User Feedback</title>
    <!-- Bootstrap CSS -->
    <link href="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css" rel="stylesheet">
    <!-- Font Awesome -->
    <link href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.15.3/css/all.min.css" rel="stylesheet">
</head>
<body>
    <div class="container mt-4">
        <div class="d-flex justify-content-between align-items-center mb-2">
        <h1>User Feedback</h1>
        <div>
            <a href="${pageContext.request.contextPath}/login/home" class="btn btn-secondary mr-2">
                <i class="fas fa-arrow-left"></i> Back
            </a>
            <a href="${pageContext.request.contextPath}/userfd/add" class="btn btn-success">
                <i class="fas fa-plus-circle"></i> Add New Feedback
            </a>
        </div>
</div>
        <table class="table table-striped table-bordered">
            <thead>
                <tr>
                    <th>ID</th>
                    <th>Feedback</th>
                    <th>Rating</th>
                    <th>Created At</th>
                    <th>User</th>
                    <th>Campaign</th>
                    <th>Media Asset</th>
                    <th>Actions</th>
                </tr>
            </thead>
            <tbody>
                <c:forEach var="feedback" items="${feedbackList}">
                    <tr>
                        <td>${feedback.id}</td>
                        <td>${feedback.feedback}</td>
                        <td>${feedback.rating}</td>
                        <td>${feedback.createdAt}</td>
                        <td>${feedback.user.username}</td>
                        <td>${feedback.campaign != null ? feedback.campaign.name : 'N/A'}</td>
                        <td>${feedback.mediaAsset != null ? feedback.mediaAsset.location : 'N/A'}</td>
                        <td>
                            <!-- Action buttons with Font Awesome icons -->
                            <a href="${pageContext.request.contextPath}/userfd/edit/${feedback.id}" class="btn btn-primary btn-sm">
                                <i class="fas fa-edit"></i> Edit
                            </a> |
                            <a href="${pageContext.request.contextPath}/userfd/delete/${feedback.id}" class="btn btn-danger btn-sm" onclick="return confirm('Are you sure you want to delete this feedback?');">
                                <i class="fas fa-trash-alt"></i> Delete
                            </a>
                        </td>
                    </tr>
                </c:forEach>
            </tbody>
        </table>

        <a href="${pageContext.request.contextPath}/userfd/list" class="btn btn-secondary">
            <i class="fas fa-arrow-left"></i> Back to Feedback List
        </a>
    </div>

    <!-- Bootstrap JS and dependencies -->
    <script src="https://code.jquery.com/jquery-3.5.1.slim.min.js"></script>
    <script src="https://cdn.jsdelivr.net/npm/@popperjs/core@2.5.2/dist/umd/popper.min.js"></script>
    <script src="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"></script>
</body>
</html>
