<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Outdoor Media Dashboard</title>
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css" rel="stylesheet">
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/js/bootstrap.bundle.min.js"></script>
<script src="https://cdn.jsdelivr.net/npm/chart.js"></script>
<style>
body {
    display: flex;
    flex-direction: column;
}

.header {
    background: #343a40;
    color: white;
    padding: 15px;
    display: flex;
    justify-content: space-between;
    align-items: center;
}

.header .buttons a {
    color: white;
    margin-left: 10px;
    text-decoration: none;
    padding: 5px 10px;
    background: #007bff;
    border-radius: 5px;
}

.header .buttons a:hover {
    background: #0056b3;
}

.main-container {
    display: flex;
    flex-grow: 1;
}

.sidebar {
    width: 250px;
    height: 100vh;
    background: #343a40;
    padding-top: 20px;
}

.sidebar a {
    color: white;
    display: block;
    padding: 10px;
    text-decoration: none;
}

.sidebar a:hover {
    background: #495057;
}

.content {
    flex-grow: 1;
    padding: 20px;
}

.card {margin-left:120px;
    margin-top: 20px;
}

.square-card {
    width: 400px;
    height: 250px;
}

.square-card > .card-body {
    display: flex;
    flex-direction: column;
    justify-content: center;
    align-items: center;
}

.dropdown:hover .dropdown-menu {
    display: block;
    margin-top: 0;
}

.dropdown-menu {
    background-color: #343a40;
    position: relative;
    left: 30px;
    display: none;
    width: calc(100% - 30px);
}

.dropdown-menu .dropdown-item {
    color: whitesmoke;
}

.dropdown-menu .dropdown-item:hover {
    background-color: #a9a9a9;
}

.dropdown-item {
    color: whitesmoke;
}

.dropdown-item:hover {
    background-color: #a9a9a9;
}

.logger-info {
    display: flex;
    align-items: center;
    gap: 15px;
    font-size: 16px;
}

.logger-info span {
    color: white;
    font-weight: bold;
}
</style>
</head>
<body>
    <div class="header">
        <h2>AdSphere  Dashboard</h2>
        <div class="logger-info">
            <span>Welcome, ${sessionScope.msgg}</span>
            <a href="${pageContext.request.contextPath}/login/logout" class="btn btn-danger btn-sm">Logout</a>
        </div>
    </div>

    <div class="main-container">
        <div class="sidebar">
            
            <div class="dropdown"><button class="btn text-white">CAMPAIGN</button>
                <ul class="dropdown-menu">
                    <li><a href="/OutDoorMedia/campaign/add">Add Campaign</a></li>
                    
                </ul>
            </div>
            <div class="dropdown"><button class="btn text-white">CONTENT</button>
                <ul class="dropdown-menu">
                    <li><a href="/OutDoorMedia/content/addContent">Add Content</a></li>
                    
                </ul>
            </div>
            <div class="dropdown"><button class="btn text-white">PAYMENT</button>
                <ul class="dropdown-menu">
                    <li><a href="/OutDoorMedia/payment/add">Add Payment</a></li>
                  
                </ul>
            </div>
            <div class="dropdown"><button class="btn text-white">USERFEEDBACK</button>
                <ul class="dropdown-menu">
                    <li><a href="/OutDoorMedia/userfd/add">Add UserFeedback</a></li>
                    
                </ul>
            </div>
            
           
        </div>

<div class="content">
    <div class="row g-4">
        <!-- Total Revenue -->
        <div class="col-md-6">
            <div class="card text-bg-success square-card">
                <div class="card-body">
                    <h4>Total Revenue</h4>
                    <p id="revenue"></p> <!-- Corrected this line -->
                </div>
            </div>
        </div>

        <!-- Total Assets -->
        <div class="col-md-6">
            <div class="card text-bg-primary square-card">
                <div class="card-body">
                    <h4>Total Assets</h4>
                    <p id="assets"></p> <!-- Corrected this line -->
                </div>
            </div>
        </div>

        <!-- Total Campaigns -->
        <div class="col-md-6">
            <div class="card text-bg-warning square-card">
                <div class="card-body">
                    <h4>Total Campaigns</h4>
                    <p id="campaigns"></p> <!-- Corrected this line -->
                </div>
            </div>
        </div>

        <!-- Total Users -->
        <div class="col-md-6">
            <div class="card text-bg-danger square-card">
                <div class="card-body">
                    <h4>Total Users</h4>
                    <p id="users"></p> <!-- Corrected this line -->
                </div>
            </div>
        </div>
    </div>
</div>

    </div>

    <script>
    document.addEventListener("DOMContentLoaded", function () {
        fetch('${pageContext.request.contextPath}/dash/summary')
            .then(response => response.json())
            .then(data => {
            	document.getElementById("revenue").textContent = "₹" + data.totalRevenue.toLocaleString();

                document.getElementById("assets").textContent = data.totalAssets + " Assets"; // Correctly inject total assets
                document.getElementById("campaigns").textContent = data.totalCampaigns + " Campaigns"; // Correctly inject campaigns
                document.getElementById("users").textContent = data.totalUser + " Users"; // Correctly inject users
            })
            .catch(error => console.error("Error loading dashboard summary:", error));
    });
    </script>
    
</body>
</html>
