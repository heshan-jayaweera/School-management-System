<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>User Profile</title>
<link rel="stylesheet" href="css/bootstrap.min.css">
<link rel="stylesheet" href="${pageContext.request.contextPath}/ls-lpg.css">
<link rel="stylesheet"
    href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.7.2/css/all.min.css"
    integrity="sha512-Evv84Mr4kqVGRNSgIGL/F/aIDqQb7xQ2vcrdIwxfjThSH8CSR7PBEakCr51Ck+w+/U6swU2Im1vVX0SVk9ABhg=="
    crossorigin="anonymous" referrerpolicy="no-referrer" />
<link rel="stylesheet" href="css/bootstrap.min.css">
</head>
<body>
    <nav>
        <div class="logo">
            <a href="https://google.com"><img src="logo3.png" id="logoid"></a>
        </div>

        <ul id="menuList">
            <li><a class="currentpg" href="#">Home</a></li>
            <li><a href="#">About</a></li>
            <li><a href="#">Programs</a></li>
            <li><a href="#">Student Life</a></li>
            <li><a href="#">News & updates</a></li>
        </ul>
        <div class="menu-icon">
            <i class="fas fa-bars" onclick="toggleMenu()"></i>
        </div>
    </nav>
 
	<div class="container mt-5">
		<h1 class="text-center">Applicant Profile</h1>

		<!-- Display user details -->
		<div class="row justify-content-center">
			<div class="col-md-6">
				<table class="table table-bordered">
					<thead>
						<tr>
							<th colspan="2" class="text-center">Personal Information</th>
						</tr>
					</thead>
					<tbody>
 

						<tr>
							<td><strong>First Name</strong></td>
							<td><c:out value="${applicant.firstName}" /></td>
						</tr>

						<tr>
							<td><strong>Last Name</strong></td>
							<td><c:out value="${applicant.lastName}" /></td>
						</tr>

						<tr>
							<td><strong>Full Name</strong></td>
							<td><c:out value="${applicant.fullName}" /></td>
						</tr>

						<tr>
							<td><strong>Email</strong></td>
							<td><c:out value="${applicant.email}" /></td>
						</tr>
						<tr>
							<td><strong>Phone</strong></td>
							<td><c:out value="${applicant.phone}" /></td>
						</tr>
						<tr>
							<td><strong>Stream</strong></td>
							<td><c:out value="${applicant.stream}" /></td>
						</tr>

						<tr>
							<td><strong>Date of Birth</strong></td>
							<td><c:out value="${applicant.DOB}" /></td>
						</tr>
						<tr>
							<td><strong>Status</strong></td>
							<td><c:out value="${applicant.status}" /></td>
						</tr>


					</tbody>
				</table>

				<c:choose>

					<c:when test="${applicant.status eq 'approved'}">
						<div class="alert alert-warning text-center">Your request
							has been approved. Updates are no longer allowed.</div>
						<div class="text-center">
							<a href=# class="btn btn-secondary disabled">Update Disabled</a>
							<br> <a href="payment.jsp" class="btn btn-primary mt-2">Proceed
								to payment</a>
						</div>
					</c:when>

					<c:otherwise>
						<div class="text-center">
							<a href="updateapplicant.jsp" class="btn btn-primary">Update Profile</a> <br>

						</div>
					</c:otherwise>
				</c:choose>








				<div class="text-center mt-3">
					<a href="applicantlogin.jsp" class="btn btn-danger">Logout</a>
				</div>
				<div class="text-center mt-3">
					<form method="post" action="deleteApplicant" class="btn btn-danger"
						onsubmit="return confirm('Are you sure you want to delete your account? This action cannot be undone.');">
						<input type="hidden" name="email"
							value="<%=((model.applicant) session.getAttribute("applicant")).getEmail()%>">
						<button type="submit" class="btn btn-danger">Delete My
							Account</button>
					</form>
				</div>
			</div>
		</div>
	</div>
	

	<script src="js/bootstrap.bundle.min.js"></script>


	

				</tbody>
			</table>
		</div>
	</div>
</body>
</html>
