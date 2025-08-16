<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
	<%@ page import="java.text.SimpleDateFormat" %>
	<%@ page import="model.applicant" %>

<%
    applicant u = (applicant) request.getAttribute("applicant");
    boolean isApproved = (u != null && "approved".equalsIgnoreCase(u.getStatus()));
    String dobFormatted = "";
    if (u != null && u.getDOB() != null) {
        dobFormatted = new SimpleDateFormat("yyyy-MM-dd").format(u.getDOB());
    }
%>


<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>Home</title>
<link rel="stylesheet" href="./ls.css">
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
			<li><a href="#">News & Updates</a></li>
			<!-- Comment -->

			<!-- Comment -->
		</ul>
		<div class="menu-icon">
			<i class="fas fa-bars" onclick="toggleMenu()"></i>
		</div>
	</nav>
<body class="container mt-4">

<%
    applicant us = (applicant) session.getAttribute("applicant");
%>


<form method="post" action="updateApplicant">
    <input type="hidden" name="email" value="<%= us.getEmail() %>">
    <input type="hidden" name="status" value="<%= us.getStatus() %>">

    <div class="form-floating mb-3">
        <input type="text" class="form-control" name="firstName" value="<%= us.getFirstName() %>" <%= isApproved ? "disabled" : "" %> required>
        <label>First Name</label>
    </div>

    <div class="form-floating mb-3">
        <input type="text" class="form-control" name="lastName" value="<%= us.getLastName() %>" <%= isApproved ? "disabled" : "" %> required>
        <label>Last Name</label>
    </div>
    <div class="form-floating mb-3">
    <input type="text" class="form-control" name="fullName" value="<%= us.getFullName() %>" readonly>
    <label>Full Name</label>
</div>
    


    <div class="form-floating mb-3">
        <input type="password" class="form-control" name="password" value="<%= us.getPassword() %>" <%= isApproved ? "disabled" : "" %> required>
        <label>Password</label>
    </div>

    <div class="form-floating mb-3">
        <input type="text" class="form-control" name="phone" value="<%= us.getPhone() %>" <%= isApproved ? "disabled" : "" %> required>
        <label>Phone</label>
    </div>


    <div class="form-floating mb-3">
        <select class="form-select" id="stream" name="stream" <%= isApproved ? "disabled" : "" %> required>
            <option disabled>Select Stream</option>
            <option value="Mathematics" <%= "mathematics".equals(us.getStream()) ? "selected" : "" %>>Mathematics</option>
            <option value="Science" <%= "science".equals(us.getStream()) ? "selected" : "" %>>Science</option>
            <option value="Technology" <%= "technology".equals(us.getStream()) ? "selected" : "" %>>Technology</option>
        </select>
        <label for="stream" class="stream-label">Stream</label>
    </div>

    <div class="mt-3">
        <button type="submit" class="btn btn-info" <%= isApproved ? "disabled" : "" %>>Update</button>
    </div>
    
    <script>
    const firstNameInput = document.querySelector('input[name="firstName"]');
    const lastNameInput = document.querySelector('input[name="lastName"]');
    const fullNameInput = document.querySelector('input[name="fullName"]');

    function updateFullName() {
        fullNameInput.value = `${firstNameInput.value} ${lastNameInput.value}`.trim();
    }

    firstNameInput.addEventListener('input', updateFullName);
    lastNameInput.addEventListener('input', updateFullName);
</script>
</form>


	<main>

		<div class="cont">

		
		</div>


	</main>

	<br>
	<!----------------------  FOOTER  ---------------------->
	<div class="footersec">
		<footer>
			<div class="footer-cols">
				<div class="footer-col">
					<h4>School</h4>
					<ul>
						<li><a href="#"><i class="fa-solid fa-building-columns"></i>
								About</a></li>
						<li><a href="#"><i class="fa-solid fa-user-graduate"></i>
								Programs</a></li>
						<li><a href="#"><i class="fa-solid fa-newspaper"></i>
								News & updates</a></li>
						<li><a href="#"><i class="fa-solid fa-briefcase"></i>
								Carieers</a></li>
						<li><a href="#"><i class="fa-solid fa-right-to-bracket"></i>
								Students Login</a></li>
					</ul>
				</div>

				<div class="footer-col">
					<h4>Contact</h4>
					<ul>

						<li><a href="#"><i class="fa-solid fa-phone"></i> +1 323
								556 6755</a></li>
						<li><a href="#"><i class="fa-solid fa-envelope"></i>
								info@mwhs.com</a></li>
						<li><a href="#"><i class="fa-solid fa-location-dot"></i>
								5431 Venice Blvd. <br> Los Angeles<br> California
								90019</a></li>
					</ul>
				</div>

				<div class="footer-col">
					<h4>Follow</h4>

					<div class="icons">
						<i class="fa-brands fa-linkedin"></i> <i
							class="fa-brands fa-square-instagram"></i> <i
							class="fa-brands fa-youtube"></i> <i
							class="fa-brands fa-square-facebook"></i>
						<!--<li><a href="#">LinkedIN</a></li>
                <li><a href="#">Instagram</a></li>
                <li><a href="#">Facebook</a></li> -->
					</div>
				</div>
				<br>

				<div class="footer-col">
					<div class="footerlogo">
						<img src="footerlogo.png" id="flogoid">
					</div>
				</div>

			</div>

			<div class="crt">
				<p>&copy; All rights reserved 2025</p>
			</div>
		</footer>
	</div>

	<!----------------------  JAVA SCRIPT  ---------------------->
	<script>
		let menuList = document.getElementById("menuList");
		menuList.style.maxHeight = "0px";

		function toggleMenu() {
			if (menuList.style.maxHeight == "0px") {
				menuList.style.maxHeight = "300px";
			} else {
				menuList.style.maxHeight = "0px"
			}
		}
	</script>
	<!----------------------  /JAVA SCRIPT  ---------------------->
</body>
</html>