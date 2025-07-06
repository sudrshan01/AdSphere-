<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
    <title>Edit Role</title>
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
        <a href="${pageContext.request.contextPath}/role/roles" class="btn btn-secondary">Back</a>
    </div>
        <h2 class="mb-4 text-center">Edit Role</h2>

        <form action="${pageContext.request.contextPath}/role/update" method="post">
            <input type="hidden" name="id" value="${role.id}">

            <!-- Row for Name -->
            <div class="row mb-3">
                <div class="col-md-12">
                    <label class="form-label" for="name">Name:</label>
                    <input type="text" id="name" name="name" class="form-control" value="${role.name}" required>
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
