<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%> 
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%> 
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %> 

<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Invoice</title>
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css">
    <style>
        body {
            background-color: #f1f5f8;
            font-family: 'Segoe UI', Tahoma, Geneva, Verdana, sans-serif;
        }
        .invoice-container {
            max-width: 850px;
            margin: auto;
            background: #ffffff;
            padding: 40px;
            border-radius: 10px;
            box-shadow: 0px 10px 30px rgba(0, 0, 0, 0.1);
        }
        .invoice-header {
            display: flex;
            justify-content: space-between;
            align-items: center;
            border-bottom: 2px solid #007bff;
            padding-bottom: 15px;
            margin-bottom: 25px;
        }
        .invoice-header h2 {
            font-size: 28px;
            color: #007bff;
            font-weight: bold;
        }
        .company-details {
            text-align: right;
            color: #333;
        }
        .company-details h5 {
            margin-bottom: 10px;
            color: #007bff;
        }
        .invoice-body {
            margin-bottom: 30px;
        }
        .invoice-body table {
            width: 100%;
            margin-bottom: 20px;
        }
        .invoice-body th {
            text-align: left;
            font-weight: bold;
            color: #333;
        }
        .invoice-body td {
            color: #555;
        }
        .amount {
            font-size: 18px;
            color: #333;
            font-weight: bold;
        }
        .btn-print {
            background-color: #007bff;
            color: white;
            width: 100%;
            padding: 12px;
            font-size: 16px;
            border: none;
            border-radius: 5px;
        }
        .btn-print:hover {
            background-color: #0056b3;
        }
    </style>
</head>
<body>
    <div class="container mt-5">
        <div class="invoice-container">
            <div class="invoice-header">
                <div>
                    <h2>Invoice</h2>
                    <p>Date: <fmt:formatDate value="${payment.paymentDate}" pattern="yyyy-MM-dd" /></p>
                    <p>Receipt No: ${payment.id} </p>
                </div>
                <div class="company-details">
                    <h5>Outdoor Media Solutions</h5>
                    <p>Email: info@outdoor.com</p>
                    <p>Phone: +91 7517423589</p>
                </div>
            </div>

            <div class="invoice-body">
                <table class="table table-borderless">
                    <tr>
                        <th>Content Title:</th>
                        <td>${payment.content.title}</td>
                    </tr>
                    <tr>
                        <th>Campaign Name:</th>
                        <td>${payment.campaign.name}</td>
                    </tr>
                    <tr>
                        <th>Content Type:</th>
                        <td>${payment.content.type}</td>
                    </tr>
                    <tr>
                        <th>Start Date:</th>
                        <td>${payment.campaign.startDate}</td>
                    </tr>
                    <tr>
                        <th>End Date:</th>
                        <td>${payment.campaign.endDate}</td>
                    </tr>
                    <tr>
                        <th>Amount:</th>
                        <td class="amount">₹${payment.amount}</td>
                    </tr>
                    <tr>
                        <th>Payment Method:</th>
                        <td>${payment.paymentMethod}</td>
                    </tr>
                </table>
            </div>

            <!-- Print Button -->
            <button class="btn-print" onclick="window.print()">Print Invoice</button>
        </div>
    </div>
</body>
</html>
