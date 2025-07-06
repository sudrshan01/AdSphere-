<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
    <title>Add Content</title>
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css">
    <style>
        html, body {
            height: 100%; /* Ensure both html and body cover the full viewport */
            margin: 0; /* Remove default margin */
        }

   body {
    background: url('https://images.unsplash.com/photo-1507525428034-b723cf961d3e?auto=format&fit=crop&w=3840&q=100') no-repeat center center fixed;
    background-size: cover;
    background-position: center;
    background-attachment: fixed;
    font-family: 'Segoe UI', Tahoma, Geneva, Verdana, sans-serif;
    color: #343a40;
}



        .container {
            min-height: 100vh; /* Make sure content area takes up full screen height */
            display: flex;
            flex-direction: column;
        }
.card {
    background-color: rgba(255, 255, 255, 0.6); /* more transparent */
    border-radius: 10px;
    box-shadow: 0 4px 15px rgba(0,0,0,0.2); /* soft shadow */
}


        .form-label {
            font-size: 1.1rem; /* 5px larger than default */
            font-weight: 600; /* Make it darker */
            color: #343a40; /* Darker color */
        }

        .progress-container {
            position: relative;
            text-align: center;
        }

        .progress {
            height: 5px;
            background-color: #ddd;
        }

        .progress-bar {
            height: 5px;
            background-color: #007bff;
        }

        .step {
            font-size: 1rem;
            font-weight: 600;
            color: #6c757d;
            transition: color 0.3s;
        }

        .step.active {
            color: #007bff;
        }
    </style>
</head>
<body class="container mt-5">
    <!-- Step Progress Bar -->
    <div class="progress-container mb-4">
        <div class="progress">
            <div id="progress-bar" class="progress-bar" role="progressbar" style="width: 25%;" aria-valuenow="25" aria-valuemin="0" aria-valuemax="100"></div>
        </div>
        <div class="d-flex justify-content-between mt-2">
            <span class="step active">Campaign</span>
            <span class="step">Content</span>
            <span class="step">Payment</span>
            <span class="step">Invoice</span>
        </div>
    </div>
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

        <h2 class="mb-4 text-center">Add Content</h2>

        <form action="${pageContext.request.contextPath}/content/saveContent" method="post" enctype="multipart/form-data">

            <div class="row mb-3">
                <div class="col-md-6">
                    <label class="form-label">Title:</label> 
                    <input type="text" name="title" class="form-control" required>
                </div>
                <div class="col-md-6">
                    <label class="form-label">Upload File:</label> 
                    <input type="file" name="filePath" class="form-control" required placeholder="Enter file path">
                </div>
            </div>

            <div class="row mb-3">
                <div class="col-md-6">
                    <label class="form-label">Description:</label>
                    <textarea name="description" class="form-control" required></textarea>
                </div>
                <div class="col-md-6">
                    <label class="form-label">Type:</label> 
                    <select name="type" class="form-select" required>
                        <option value="Image">Image</option>
                        <option value="Video">Video</option>
                        <option value="Text">Text</option>
                    </select>
                </div>
            </div>

            <div class="row mb-3">
                <div class="col-md-6">
                    <label class="form-label">Created At:</label> 
                    <input type="date" name="createdAt" class="form-control" required>
                </div>
                <div class="col-md-6">
                    <label class="form-label">Status:</label> 
                    <select name="status" class="form-select" required>
                        <option value="Approved" selected>Approved</option>
                    </select>
                </div>
            </div>

            <div class="row mb-3">
                <div class="col-md-6">
                    <label class="form-label">User:</label> 
                    <select name="user.id" class="form-select" required>
                        <c:forEach var="user" items="${users}">
                            <option value="${user.id}">${user.username}</option>
                        </c:forEach>
                    </select>
                </div>
                <div class="col-md-6">
                    <label class="form-label">Campaign:</label> 
                    <input type="text" value="${lastCampaignName}" class="form-control" readonly>
                    <input type="hidden" name="campaign" value="${lastCampaignId}">
                </div>
            </div>

            <div class="text-center">
                <button type="submit" class="btn btn-primary">Save</button>
            </div>
        </form>
    </div>

    <script>
        document.addEventListener("DOMContentLoaded", function () {
            let steps = document.querySelectorAll(".step");
            let progressBar = document.getElementById("progress-bar");

            // Set active step dynamically
            let currentStep = "${currentStep}"; // Pass current step from backend
            let stepIndex = {
                "campaign": 0,
                "content": 1,
                "payment": 2,
                "invoice": 3
            };

            let activeIndex = stepIndex[currentStep] || 0;

            // Update UI
            steps.forEach((step, index) => {
                if (index <= activeIndex) {
                    step.classList.add("active");
                }
            });

            // Update progress bar width
            let progressWidth = ((activeIndex + 1) / steps.length) * 100;
            progressBar.style.width = progressWidth + "%";
        });
    </script>
</body>
</html>
