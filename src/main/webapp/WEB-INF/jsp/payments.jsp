<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
    <title>Payments</title>
    <!-- Bootstrap CSS -->
    <link href="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css" rel="stylesheet">
    <!-- Font Awesome -->
    <link href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.15.3/css/all.min.css" rel="stylesheet">
</head>
<body>
    <div class="container mt-4">
        <div class="d-flex justify-content-between align-items-center mb-2">
            <h1>Payments</h1>
              <div>
               <a href="${pageContext.request.contextPath}/login/home" class="btn btn-secondary">Back</a>
            <!-- Add New Payment Button at the top-right -->
            <a href="${pageContext.request.contextPath}/payment/add" class="btn btn-success">
                <i class="fas fa-plus-circle"></i> Add New Payment
            </a>
        </div>
          </div>

        <table class="table table-striped table-bordered">
            <thead>
                <tr>
                    <th>ID</th>
                    <th>Payment Date</th>
                    <th>Amount</th>
                    <th>Payment Method</th>
                    <th>Campaign Id</th>
                    <th>Content Id</th>
                  
                    <th>Actions</th>
                </tr>
            </thead>
            <tbody>
                <c:forEach var="payment" items="${payments}">
                    <tr>
                        <td>${payment.id}</td>
                        <td>${payment.paymentDate}</td>
                        <td>${payment.amount}</td>
                        <td>${payment.paymentMethod}</td>
                        <td>${payment.campaign.id}</td>
                        <td>${payment.content.id}</td>
                        
                        <td>
                            <a href="${pageContext.request.contextPath}/payment/edit/${payment.id}" class="btn btn-primary btn-sm">
                                <i class="fas fa-edit"></i> Edit
                            </a> |
                            <a href="${pageContext.request.contextPath}/payment/delete/${payment.id}" class="btn btn-danger btn-sm" onclick="return confirm('Are you sure?')">
                                <i class="fas fa-trash-alt"></i> Delete
                            </a>|
                                                <a href="${pageContext.request.contextPath}/payment/in/${payment.id}" class="btn btn-primary">View Invoice</a>
                            
                        </td>
                    </tr>
                </c:forEach>
            </tbody>
        </table>

        <a href="${pageContext.request.contextPath}/invoice/invoices" class="btn btn-secondary">
            <i class="fas fa-arrow-left"></i> Back to Invoices
        </a>
    </div>

    <!-- Bootstrap JS and dependencies -->
    <script src="https://code.jquery.com/jquery-3.5.1.slim.min.js"></script>
    <script src="https://cdn.jsdelivr.net/npm/@popperjs/core@2.5.2/dist/umd/popper.min.js"></script>
    <script src="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"></script>
</body>
</html>
