<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

<!DOCTYPE html>
<html>
<head>
    <title>Add Campaign</title>
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css">
    <style>
        body {
            background-image: url('https://images.unsplash.com/photo-1504384308090-c894fdcc538d');
            background-size: cover;
            background-repeat: no-repeat;
            background-attachment: fixed;
            background-position: center;
            min-height: 100vh;
        }

        .card {
            background-color: rgba(255, 255, 255, 0.95);
            border-radius: 15px;
        }

        .form-label {
            font-size: 1.1rem;
            font-weight: 600;
            color: #2c3e50;
        }

        h2 {
            font-weight: bold;
            color: #007bff;
        }

        .btn-primary {
            background-color: #007bff;
            border: none;
        }

        .btn-primary:hover {
            background-color: #0056b3;
        }

        .btn-secondary {
            margin-bottom: 1rem;
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
            font-weight: bold;
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

    <!-- Back Button -->
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

    <h2 class="mb-4 text-center">Add Campaign</h2>

    <form action="${pageContext.request.contextPath}/campaign/save" method="post">
        <div class="row mb-3">
            <div class="col-md-6">
                <label class="form-label">Name:</label>
                <input type="text" name="name" class="form-control" required>
            </div>
            <div class="col-md-6">
                <label class="form-label">Description:</label>
                <input type="text" name="description" class="form-control" required>
            </div>
        </div>

        <div class="row mb-3">
            <div class="col-md-6">
                <label class="form-label">Start Date:</label>
                <input type="date" id="startDate" name="startDate" class="form-control" required onchange="calculateBudget()">
            </div>
            <div class="col-md-6">
                <label class="form-label">End Date:</label>
                <input type="date" id="endDate" name="endDate" class="form-control" required onchange="calculateBudget()">
            </div>
        </div>

        <div class="row mb-3">
            <div class="col-md-6">
                <label class="form-label">Media Asset:</label>
                <select id="mediaAsset" name="mediaAsset.id" class="form-select" required>
                    <option value="">Select Media Asset</option>
                </select>
            </div>
            <div class="col-md-6">
                <label class="form-label">Budget:</label>
                <input type="number" id="budget" name="budget" class="form-control" step="0.01" min="0" required readonly>
            </div>
        </div>

        <div class="text-center">
            <button type="submit" class="btn btn-primary">Save</button>
        </div>
    </form>
</div>

<input type="hidden" id="contextPath" value="${pageContext.request.contextPath}" />

<!-- Scripts -->
<script>
    function calculateDays(startDate, endDate) {
        const start = new Date(startDate);
        const end = new Date(endDate);
        const diff = (end - start) / (1000 * 60 * 60 * 24);
        return diff + 1; // include start day
    }

    function fetchAvailableAssets(startDate, endDate) {
        var contextPath = document.getElementById("contextPath").value;
        var url = contextPath + "/campaign/available?startDate=" + startDate + "&endDate=" + endDate;

        fetch(url)
            .then(function(response) {
                if (!response.ok) throw new Error("HTTP status " + response.status);
                return response.json();
            })
            .then(function(data) {
                var select = document.getElementById("mediaAsset");
                select.disabled = false;
                select.innerHTML = '<option value="">Select Media Asset</option>';

                data.forEach(function(asset) {
                    var option = document.createElement("option");
                    option.value = asset.id;
                    option.setAttribute("data-price", asset.price);
                    option.textContent = asset.location + " (" + asset.type + ")";
                    select.appendChild(option);
                });

                document.getElementById("budget").value = "";
            })
            .catch(function(err) {
                console.error("Error fetching media assets:", err);
            });
    }

    function calculateBudget() {
        const startDate = document.getElementById("startDate").value;
        const endDate = document.getElementById("endDate").value;

        if (startDate && endDate) {
            fetchAvailableAssets(startDate, endDate);
        }
    }

    document.addEventListener("DOMContentLoaded", function () {
        const select = document.getElementById("mediaAsset");
        const budgetInput = document.getElementById("budget");

        select.addEventListener("change", function () {
            const price = this.options[this.selectedIndex].getAttribute("data-price");
            const startDate = document.getElementById("startDate").value;
            const endDate = document.getElementById("endDate").value;

            if (startDate && endDate && price) {
                const days = calculateDays(startDate, endDate);
                const total = days * parseFloat(price);
                budgetInput.value = total.toFixed(2);
            } else {
                budgetInput.value = "";
            }
        });

        // Progress bar update
        const steps = document.querySelectorAll(".step");
        const progressBar = document.getElementById("progress-bar");
        const stepIndex = { "campaign": 0, "content": 1, "payment": 2, "invoice": 3 };
        const currentStep = "campaign";
        const activeIndex = stepIndex[currentStep] || 0;

        steps.forEach((step, index) => {
            if (index <= activeIndex) step.classList.add("active");
        });

        progressBar.style.width = ((activeIndex + 1) / steps.length) * 100 + "%";
    });
</script>
</body>
</html>
