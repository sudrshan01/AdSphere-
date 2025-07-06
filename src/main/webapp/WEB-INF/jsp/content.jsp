<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
    <title>Content</title>
    <!-- Bootstrap CSS -->
    <link href="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css" rel="stylesheet">
    <!-- Font Awesome -->
    <link href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.15.3/css/all.min.css" rel="stylesheet">
</head>
<body>
    <div class="container mt-4">
        <div class="d-flex justify-content-between align-items-center mb-2">
            <h1>Content</h1>  <div>
               <a href="${pageContext.request.contextPath}/login/home" class="btn btn-secondary">Back</a>
            <!-- Add New Content Button at the top-right -->
            <a href="${pageContext.request.contextPath}/content/addContent" class="btn btn-success">
                <i class="fas fa-plus-circle"></i> Add New Content
            </a>
        </div>  </div>
        <table class="table table-striped table-bordered">
            <thead>
                <tr>
                    <th>ID</th>
                    <th>Title</th>
                    <th>File</th>
                    <th>Description</th>
                    <th>Type</th>
                    <th>Created At</th>
                    <th>Status</th>
                    <th>User</th>
                    <th>Campaign</th>
                    <th>Action</th>
                </tr>
            </thead>
            <tbody>
                <c:forEach var="content" items="${contentList}">
                    <tr>
                        <td>${content.id}</td>
                        <td>${content.title}</td>
                        <td>${content.file_path}</td>
                        <td>${content.description}</td>
                        <td>${content.type}</td>
                        <td>${content.createdAt}</td>
                        <td>${content.status}</td>
                        <td>${content.user.username}</td>
                        <td>${content.campaign.name}</td>
                        <td>
                            <c:if test="${content.status.equals('Pending Approval')}">
                                <a href="${pageContext.request.contextPath}/content/updateContentStatus/${content.id}?status=Approved" class="btn btn-success btn-sm">
                                    <i class="fas fa-check-circle"></i> Approve
                                </a>
                                <a href="${pageContext.request.contextPath}/content/updateContentStatus/${content.id}?status=Rejected" class="btn btn-danger btn-sm">
                                    <i class="fas fa-times-circle"></i> Reject
                                </a>
                            </c:if>
                            <a href="${pageContext.request.contextPath}/content/edit/${content.id}" class="btn btn-primary btn-sm">
                                <i class="fas fa-edit"></i> Edit
                            </a>
                            <a href="${pageContext.request.contextPath}/content/delete/${content.id}" class="btn btn-danger btn-sm" onclick="return confirm('Are you sure?')">
                                <i class="fas fa-trash-alt"></i> Delete
                            </a>
                        </td>
                    </tr>
                </c:forEach>
            </tbody>
        </table>
        <!-- Add New Content Button -->
        <br>
    </div>

    <!-- Bootstrap JS and dependencies -->
    <script src="https://code.jquery.com/jquery-3.5.1.slim.min.js"></script>
    <script src="https://cdn.jsdelivr.net/npm/@popperjs/core@2.5.2/dist/umd/popper.min.js"></script>
    <script src="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"></script>
</body>
</html>
