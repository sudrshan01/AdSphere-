<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<title>Edit Content</title>
<link rel="stylesheet"
	href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css">
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
			<a href="${pageContext.request.contextPath}/content/contents"
				class="btn btn-secondary">Back</a>
		</div>
		<h2 class="mb-4 text-center">Edit Content</h2>

		<form
			action="${pageContext.request.contextPath}/content/updateContent"
			method="post" enctype="multipart/form-data">
			<input type="hidden" name="id" value="${content.id}">

			<!-- Row for Title and Description -->
			<div class="row mb-3">
				<div class="col-md-6">
					<label class="form-label" for="title">Title:</label> <input
						type="text" id="title" name="title" class="form-control"
						value="${content.title}" required>
				</div>
				<div class="col-md-6">
					<label class="form-label" for="filePath">Upload File:</label> <input
						type="file" id="filePath" name="filePath" class="form-control">
					<c:if test="${not empty content.file_path}">
						<p class="mt-2">
							Current file: <a href="${content.file_path}" target="_blank">${content.file_path}</a>
						</p>
					</c:if>
				</div>


			</div>

			<!-- Row for Type and File Path -->
			<div class="row mb-3">
				<div class="col-md-6">
					<label class="form-label" for="description">Description:</label>
					<textarea id="description" name="description" class="form-control"
						required>${content.description}</textarea>
				</div>
				<div class="col-md-6">
					<label class="form-label" for="type">Type:</label> <select
						name="type" id="type" class="form-select" required>
						<option value="Image" ${content.type == 'Image' ? 'selected' : ''}>Image</option>
						<option value="Video" ${content.type == 'Video' ? 'selected' : ''}>Video</option>
						<option value="Text" ${content.type == 'Text' ? 'selected' : ''}>Text</option>
					</select>
				</div>

			</div>

			<!-- Row for Created At and Status -->
			<div class="row mb-3">
				<div class="col-md-6">
					<label class="form-label" for="createdAt">Created At:</label> <input
						type="date" id="createdAt" name="createdAt" class="form-control"
						value="${content.createdAt}" required>
				</div>
				<div class="col-md-6">
					<label class="form-label" for="status">Status:</label> <select
						id="status" name="status" class="form-select" required>
						<option value="Draft"
							${content.status == 'Draft' ? 'selected' : ''}>Draft</option>
						<option value="Pending Approval"
							${content.status == 'Pending Approval' ? 'selected' : ''}>Pending
							Approval</option>
						<option value="Approved"
							${content.status == 'Approved' ? 'selected' : ''}>Approved</option>
						<option value="Rejected"
							${content.status == 'Rejected' ? 'selected' : ''}>Rejected</option>
					</select>
				</div>
			</div>

			<!-- Row for User and Campaign -->
			<div class="row mb-3">
				<div class="col-md-6">
					<label class="form-label" for="user">User:</label> <select
						name="user.id" id="user" class="form-select" required>
						<c:forEach var="user" items="${users}">
							<option value="${user.id}"
								${content.user.id == user.id ? 'selected' : ''}>${user.username}</option>
						</c:forEach>
					</select>
				</div>
				<div class="col-md-6">
					<label class="form-label" for="campaign">Campaign:</label> <select
						name="campaign.id" id="campaign" class="form-select" required>
						<c:forEach var="campaign" items="${campaigns}">
							<option value="${campaign.id}"
								${content.campaign.id == campaign.id ? 'selected' : ''}>${campaign.name}</option>
						</c:forEach>
					</select>
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
