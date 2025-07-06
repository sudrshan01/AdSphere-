<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
    <title>Edit User Feedback</title>
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css">
    <style>
        /* Custom CSS for label styling */
        .form-label {
            font-size: 1.1rem; /* Increased label size by 5px */
            font-weight: 600; /* Darker label */
            color: #343a40; /* Darker label color */
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
        <a href="${pageContext.request.contextPath}/userfd/userFeedback" class="btn btn-secondary">Back</a>
    </div>
        <h2 class="mb-4 text-center">Edit User Feedback</h2>

        <form action="${pageContext.request.contextPath}/userfd/update/${userFeedback.id}" method="post">

            <!-- Row for Feedback and Rating -->
            <div class="row mb-3">
                <div class="col-md-6">
                    <label class="form-label" for="feedback">Feedback:</label>
                    <textarea id="feedback" name="feedback" class="form-control" required>${userFeedback.feedback}</textarea>
                </div>
                <div class="col-md-6">
                    <label class="form-label" for="rating">Rating:</label>
                    <input type="number" id="rating" name="rating" class="form-control" min="1" max="5" value="${userFeedback.rating}" required>
                </div>
            </div>

            <!-- Row for Created At and User -->
            <div class="row mb-3">
                <div class="col-md-6">
                    <label class="form-label" for="createdAt">Created At:</label>
                    <input type="date" id="createdAt" name="createdAt" class="form-control" value="${userFeedback.createdAt}" required>
                </div>
                <div class="col-md-6">
                    <label class="form-label" for="user">User:</label>
                    <select id="user" name="user.id" class="form-control" required>
                        <c:forEach var="user" items="${users}">
                            <option value="${user.id}" ${user.id == userFeedback.user.id ? 'selected' : ''}>${user.username}</option>
                        </c:forEach>
                    </select>
                </div>
            </div>

            <!-- Row for Campaign and Media Asset -->
            <div class="row mb-3">
                <div class="col-md-6">
                    <label class="form-label" for="campaign">Campaign:</label>
                    <select id="campaign" name="campaign.id" class="form-control">
                        <option value="">None</option>
                        <c:forEach var="campaign" items="${campaigns}">
                            <option value="${campaign.id}" ${campaign.id == userFeedback.campaign.id ? 'selected' : ''}>${campaign.name}</option>
                        </c:forEach>
                    </select>
                </div>
                <div class="col-md-6">
                    <label class="form-label" for="mediaAsset">Media Asset:</label>
                    <select id="mediaAsset" name="mediaAsset.id" class="form-control">
                        <option value="">None</option>
                        <c:forEach var="mediaAsset" items="${mediaAssets}">
                            <option value="${mediaAsset.id}" ${mediaAsset.id == userFeedback.mediaAsset.id ? 'selected' : ''}>${mediaAsset.location}</option>
                        </c:forEach>
                    </select>
                </div>
            </div>

            <!-- Submit Button -->
            <div class="text-center">
                <button type="submit" class="btn btn-primary">Update</button>
            </div>
        </form>
    </div>

</body>
</html>
