<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
    <title>Edit Campaign</title>
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
        <a href="${pageContext.request.contextPath}/campaign/list" class="btn btn-secondary">Back</a>
    </div>
    
        <h2 class="mb-4 text-center">Edit Campaign</h2>

        <form action="${pageContext.request.contextPath}/campaign/update" method="post">
            <input type="hidden" name="id" value="${campaign.id}"> <!-- Hidden field to hold campaign ID -->

            <!-- Row for Name and Description -->
            <div class="row mb-3">
                <div class="col-md-6">
                    <label class="form-label" for="name">Name:</label>
                    <input type="text" id="name" name="name" class="form-control" value="${campaign.name}" required>
                </div>
                <div class="col-md-6">
                    <label class="form-label" for="description">Description:</label>
                    <input type="text" id="description" name="description" class="form-control" value="${campaign.description}" required>
                </div>
            </div>

            <!-- Row for Start Date and End Date -->
            <div class="row mb-3">
                <div class="col-md-6">
                    <label class="form-label" for="startDate">Start Date:</label>
                    <input type="date" id="startDate" name="startDate" class="form-control" value="${campaign.startDate}" required>
                </div>
                <div class="col-md-6">
                    <label class="form-label" for="endDate">End Date:</label>
                    <input type="date" id="endDate" name="endDate" class="form-control" value="${campaign.endDate}" required>
                </div>
            </div>

            <!-- Row for Budget and Media Asset -->
            <div class="row mb-3">
                <div class="col-md-6">
                    <label class="form-label" for="budget">Budget:</label>
                    <input type="number" step="0.01" id="budget" name="budget" class="form-control" value="${campaign.budget}" required>
                </div>
                <div class="col-md-6">
                    <label class="form-label" for="mediaAsset">Media Asset:</label>
                    <select name="mediaAsset.id" id="mediaAsset" class="form-select" required>
                        <c:forEach var="asset" items="${mediaAssets}">
                            <option value="${asset.id}" ${asset.id == campaign.mediaAsset.id ? 'selected' : ''}>${asset.location} (${asset.type})</option>
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
