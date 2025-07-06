<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
	<title>Add Payment</title>
	<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css">
	<style>
		body {
	background: url('https://images.pexels.com/photos/1058279/pexels-photo-1058279.jpeg?auto=compress&cs=tinysrgb&w=3840&q=100') no-repeat center center fixed;
	background-size: cover;
	font-family: 'Segoe UI', sans-serif;
}


		.card {
			background: #ffffff;
			border: none;
			border-radius: 12px;
			box-shadow: 0 0 15px rgba(0, 0, 0, 0.05);
		}

		.form-label {
			font-size: 1rem;
			font-weight: 600;
			color: #212529;
		}

		.form-control {
			border-radius: 8px;
			box-shadow: none !important;
			border-color: #ced4da;
			transition: border-color 0.2s;
		}

		.form-control:focus {
			border-color: #0d6efd;
			box-shadow: 0 0 0 0.2rem rgba(13, 110, 253, 0.25);
		}

		.btn-primary {
			padding: 0.6rem 1.5rem;
			font-size: 1rem;
			border-radius: 8px;
			font-weight: 600;
		}

		.btn-secondary {
			font-size: 0.95rem;
			border-radius: 6px;
		}

		.progress-container {
			position: relative;
		}

		.progress {
			height: 6px;
			background-color: #e9ecef;
			border-radius: 5px;
			overflow: hidden;
		}

		.progress-bar {
			height: 6px;
			background-color: #0d6efd;
			transition: width 0.4s ease;
		}

		.step {
			font-size: 0.95rem;
			font-weight: 500;
			color: #adb5bd;
			transition: color 0.3s;
		}

		.step.active {
			color: #0d6efd;
			font-weight: 600;
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
		<div class="d-flex justify-content-end mb-3">
			<a href="${pageContext.request.contextPath}/payment/payments" class="btn btn-secondary">Show List</a>
		</div>
		<h2 class="mb-4 text-center text-primary">Add Payment</h2>

		<form action="${pageContext.request.contextPath}/payment/savePayment" method="post">
			<div class="row mb-3">
				<div class="col-md-6">
					<label class="form-label" for="paymentDate">Payment Date:</label>
					<input type="date" id="paymentDate" name="paymentDate" class="form-control" required>
				</div>
				<div class="col-md-6">
					<label class="form-label" for="amount">Amount:</label>
					<input type="number" step="0.01" id="amount" name="amount" value="${amount}" class="form-control" required>
				</div>
			</div>

			<div class="row mb-3">
				<div class="col-md-6">
					<label class="form-label" for="paymentMethod">Payment Method:</label>
<select id="paymentMethod" name="paymentMethod" class="form-control" required>
    <option value="" disabled selected>Select Payment Method</option>
    <option value="Upi">UPI</option>
    <option value="Credit Card">Credit Card</option>
    
    <option value="Debit Card">Debit Card</option>
    <option value="PayPal">PayPal</option>
    <option value="Bank Transfer">Bank Transfer</option>
    <option value="Cash">Cash</option>
</select>

				</div>
				<div class="col-md-6">
					<label class="form-label" for="invoice">Campaign:</label>
					<input type="text" value="${lastCampaignName}" class="form-control" readonly>
					<input type="hidden" name="campaign" value="${lastCampaignId}">
				</div>
			</div>

			<div class="row mb-4">
				<div class="col-md-6">
					<label class="form-label" for="Content">Content:</label>
					<input type="text" value="${lastContentName}" class="form-control" readonly>
					<input type="hidden" name="content" value="${lastContentId}">
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

			let currentStep = "${currentStep}";
			let stepIndex = {
				"campaign": 0,
				"content": 1,
				"payment": 2,
				"invoice": 3
			};

			let activeIndex = stepIndex[currentStep] || 0;

			steps.forEach((step, index) => {
				if (index <= activeIndex) {
					step.classList.add("active");
				}
			});

			let progressWidth = ((activeIndex + 1) / steps.length) * 100;
			progressBar.style.width = progressWidth + "%";
		});
	</script>

</body>
</html>
