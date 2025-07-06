<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
    <title>Dashboard</title>
    <script src="https://cdn.jsdelivr.net/npm/chart.js"></script>
</head>
<body>
    <h1>Dashboard</h1>
    <div>
        <h2>Key Metrics</h2>
        <p>Total Campaigns: ${totalCampaigns}</p>
        <p>Total Media Assets: ${totalAssets}</p>
        <p>Total Invoices: ${totalInvoices}</p>
        <p>Total Revenue: $${totalRevenue}</p>
    </div>
    <div>
        <h2>Campaign Performance</h2>
        <canvas id="campaignChart" width="400" height="200"></canvas>
        <script>
            const ctx = document.getElementById('campaignChart').getContext('2d');
            const campaignChart = new Chart(ctx, {
                type: 'bar',
                data: {
                    labels: [
                        <c:forEach var="analytic" items="${analytics}">
                            "${analytic.campaign.name}",
                        </c:forEach>
                    ],
                    datasets: [{
                        label: 'Impressions',
                        data: [
                            <c:forEach var="analytic" items="${analytics}">
                                ${analytic.impressions},
                            </c:forEach>
                        ],
                        backgroundColor: 'rgba(75, 192, 192, 0.2)',
                        borderColor: 'rgba(75, 192, 192, 1)',
                        borderWidth: 1
                    }]
                },
                options: {
                    scales: {
                        y: {
                            beginAtZero: true
                        }
                    }
                }
            });
        </script>
    </div>
    <br>
    <a href="${pageContext.request.contextPath}/analytic/analytics">View Analytics</a>
</body>
</html>