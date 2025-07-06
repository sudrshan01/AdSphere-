<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<title>Add User</title>
<link rel="stylesheet"
	href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css">
<style>
    body {
background: url('https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcRvwP7McLMQbwP6dZ8KI8TKIo63nBc4muAcfZRN-1KccgvUg0zxIn6NHt4PO1ctkn2sk58&usqp=CAU&w=1920&q=100') no-repeat center center fixed;
        background-size: cover;
        background-attachment: fixed;
        font-family: Arial, sans-serif;
    }

    .card {
        background-color: rgba(255, 255, 255, 0.95); /* Allows background to slightly show through */
        box-shadow: 0 0 20px rgba(0, 0, 0, 0.3);
        border-radius: 15px;
    }

    .form-label {
        font-size: 1.1rem;
        font-weight: 600;
        color: #343a40;
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

<script>
	function validateForm() {
		let password = document.getElementById("password").value;
		let confirmPassword = document.getElementById("confirmPassword").value;
		if (password !== confirmPassword) {
			alert("Passwords do not match!");
			return false;
		}
		return true;
	}
</script>
</head>
<body class="container">
	<div class="card shadow-lg p-4 form-container">
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
		<h2 class="mb-4 text-center">Add User</h2>

		<form action="${pageContext.request.contextPath}/user/saveUser"
			method="post" onsubmit="return validateForm()">
			<div class="row mb-3">
				<div class="col-md-6">
					<label class="form-label" for="email">Email:</label> <input
						type="email" id="email" name="email" class="form-control" required>
				</div>
				<div class="col-md-6">
					<label class="form-label" for="username">Username:</label> <input
						type="text" id="username" name="username" class="form-control"
						required>
				</div>
			</div>

			<div class="row mb-3">
				<div class="col-md-6">
					<label class="form-label" for="password">Password:</label> <input
						type="password" id="password" name="password" class="form-control"
						required>
				</div>
				<div class="col-md-6">
					<label class="form-label" for="confirmPassword">Confirm
						Password:</label> <input type="password" id="confirmPassword"
						name="confirmPassword" class="form-control" required>
				</div>
			</div>

			<!-- Role Selection -->
			<div class="mb-3">
    <label class="form-label">Assign Roles:</label>
    <select class="form-select" name="roleIds" required disabled>
        <c:forEach var="role" items="${roles}">
            <c:if test="${role.id == 2}">
                <option value="${role.id}" selected>${role.name}</option>
            </c:if>
        </c:forEach>
    </select>
    <input type="hidden" name="roleIds" value="2" />
</div>


			<div class="text-center">
				<button type="submit" class="btn btn-primary">Save</button>
			</div>
		</form>
	</div>
	<!-- SweetAlert2 CDN -->
<script src="https://cdn.jsdelivr.net/npm/sweetalert2@11"></script>

<c:if test="${not empty successMessage}">
    <script>
        Swal.fire({
            icon: 'success',
            title: 'Success',
            text: '${successMessage}',
            confirmButtonText: 'OK'
        }).then((result) => {
            if (result.isConfirmed) {
                window.location.href = '${pageContext.request.contextPath}${redirectAfterAlert}';
            }
        });
    </script>
</c:if>
	
</body>
</html>
