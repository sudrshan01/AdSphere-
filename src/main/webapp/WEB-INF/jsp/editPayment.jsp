<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
    <title>Edit Payment</title>
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

    <!-- Back Button in Top-Right -->
    

    <div class="card shadow-lg p-4 form-container">
    <div class="back-btn">
        <a href="${pageContext.request.contextPath}/payment/payments" class="btn btn-secondary">Back</a>
    </div>
        <h2 class="mb-4 text-center">Edit Payment</h2>

        <form action="${pageContext.request.contextPath}/payment/update" method="post">
            <input type="hidden" name="id" value="${payment.id}">

            <!-- Row for Payment Date and Amount -->
            <div class="row mb-3">
                <div class="col-md-6">
                    <label class="form-label" for="paymentDate">Payment Date:</label>
                    <input type="date" id="paymentDate" name="paymentDate" class="form-control" value="${payment.paymentDate}" required>
                </div>
                <div class="col-md-6">
                    <label class="form-label" for="amount">Amount:</label>
                    <input type="number" step="0.01" id="amount" name="amount" class="form-control" value="${payment.amount}" required>
                </div>
            </div>
            
            

            <!-- Row for Payment Method and Invoice -->
            <div class="row mb-3">
                <div class="col-md-6">
                    <label class="form-label" for="paymentMethod">Payment Method:</label>
                    <input type="text" id="paymentMethod" name="paymentMethod" class="form-control" value="${payment.paymentMethod}" required>
                </div>
                <div class="col-md-6">
                <label>Campaign ID:</label>
                <input type="text" class="form-control" name="campaign" value="${payment.campaign.id}" readonly>
            </div>
                
            </div>
            <div class="row mb-3">
            
            
            <div class="col-md-6">
                <label>Content ID:</label>
                <input type="text" class="form-control" name="content" value="${payment.content.id}" readonly>
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
