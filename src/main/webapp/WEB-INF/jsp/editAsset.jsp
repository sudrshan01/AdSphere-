<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
    <title>Edit Media Asset</title>
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
        <a href="${pageContext.request.contextPath}/media/assets" class="btn btn-secondary">Back</a>
    </div>
    
        <h2 class="mb-4 text-center">Update Media Asset</h2>

        <form action="${pageContext.request.contextPath}/media/update" method="post">
            <input type="hidden" name="id" value="${asset.id}">

            <!-- Row for Location and Type -->
            <div class="row mb-3">
                <div class="col-md-6">
                    <label class="form-label" for="location">Location:</label>
                    <input type="text" id="location" name="location" class="form-control" value="${asset.location}" required>
                </div>
                <div class="col-md-6">
                    <label class="form-label" for="type">Type:</label>
                    <input type="text" id="type" name="type" class="form-control" value="${asset.type}" required>
                </div>
            </div>

            <!-- Row for Price -->
            <div class="row mb-3">
                <div class="col-md-6">
                    <label class="form-label" for="price">Price:</label>
                    <input type="number" step="0.01" id="price" name="price" class="form-control" value="${asset.price}" required>
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
