<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>

<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Home</title>
    <link rel="stylesheet" href="./ls.css"> 
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.7.2/css/all.min.css" integrity="sha512-Evv84Mr4kqVGRNSgIGL/F/aIDqQb7xQ2vcrdIwxfjThSH8CSR7PBEakCr51Ck+w+/U6swU2Im1vVX0SVk9ABhg==" crossorigin="anonymous" referrerpolicy="no-referrer" />
	<link rel="stylesheet" href="css/bootstrap.min.css">
	
</head>

<body>
    <nav>
        <div class="logo">
            <a href="https://google.com"><img src = "logo3.png" id="logoid"></a>
        </div>

        <ul id="menuList">
            <li><a class="currentpg" href="#">Home</a></li>
            <li><a href="#">About</a></li>
            <li><a href="#">Programs</a></li>
            <li><a href="#">Student Life</a></li>
            <li><a href="#">News & updates</a></li> <!-- Comment -->
            
            <!-- Comment -->
        </ul>
        <div class="menu-icon">
            <i class="fas fa-bars" onclick="toggleMenu()"></i>
        </div>
    </nav>


    <main>
    
        <div class="cont">
        
        
        	<div class="regformarea">
        	<div class="regform">
        	<div class = "titlebarap">
        		<h1>Register With Us </h1>
        		
        </div>
        	
        		<form method="post" action="${pageContext.request.contextPath}/addApplicant" enctype="multipart/form-data" id ="regfrm">

		<div class="form-floating mb-1">
			<input type="text" class="form-control" id="firstName"
				name="firstName" placeholder="Alex">
			<label for="firstName">First Name</label>
		</div>

		<div class="form-floating mb-1">
			<input type="text" class="form-control" id="lastName"
				name="lastName" placeholder="Johnson">
			<label for="lastName">Last Name</label>
		</div>

		

		<div class="form-floating mb-1">
			<input type="email" class="form-control" id="email"
				name="email" placeholder="name@example.com">
			<label for="email">Email address</label>
		</div>

		<div class="form-floating mb-1">
			<input type="password" class="form-control" id="password"
				name="password" placeholder="Password">
			<label for="password">Password</label>
		</div>

		<div class="form-floating mb-1">
			<input type="text" class="form-control" id="phone"
				name="phone" placeholder="0712345678">
			<label for="phone">Phone</label>
		</div>

		<div class="form-floating mb-1">
			<input type="date" class="form-control" id="DOB"
				name="DOB" placeholder="Date of Birth">
			<label for="DOB">Date of Birth</label>
		</div>

		<div class="form-floating mb-1">
			<select class="form-select" id="stream" name="stream">
				<option selected disabled>Select Stream</option>
				<option value="mathematics">Mathematics</option>
				<option value="science">Science</option>
				<option value="technology">Technology</option>
			</select>
			<label for="stream">Stream</label>
		</div>

		<div class="mb-1">
			<label class="form-label">Attach your O/L Certificate</label>
			<input class="form-control" type="file" name="document" required>
		</div>
		
		
		<input type="hidden" name="status" value="pending">
		
		<button type="submit" class="btn btn-info">Submit</button>
	</form>
        	</div>
        
        </div>
        
        </div>
		    <br><br><br><br><br><br>

    </main>


    <!----------------------  FOOTER  ---------------------->
    <div class="footersec">
        <footer>
            <div class="footer-cols">
        <div class="footer-col">
            <h4>School</h4>
            <ul>
                <li><a href="#"><i class="fa-solid fa-building-columns"></i> About</a></li>
                <li><a href="#"><i class="fa-solid fa-user-graduate"></i> Programs</a></li>
                <li><a href="#"><i class="fa-solid fa-newspaper"></i> News & updates</a></li>
                <li><a href="#"><i class="fa-solid fa-briefcase"></i> Carieers</a></li>
                <li><a href="#"><i class="fa-solid fa-right-to-bracket"></i> Students Login</a></li>
            </ul>
        </div>

        <div class="footer-col">
            <h4>Contact</h4>
            <ul>
                
                <li><a href="#"><i class="fa-solid fa-phone"></i> +1 323 556 6755</a></li>
                <li><a href="#"><i class="fa-solid fa-envelope"></i> info@mwhs.com</a></li>
                <li><a href="#"><i class="fa-solid fa-location-dot"></i> 5431 Venice Blvd. <br>  Los Angeles<br>  California 90019</a></li>
            </ul>
        </div>

        <div class="footer-col">
            <h4>Follow</h4>
            
                <div class="icons">
                <i class="fa-brands fa-linkedin"></i>
                <i class="fa-brands fa-square-instagram"></i>
                <i class="fa-brands fa-youtube"></i>
                <i class="fa-brands fa-square-facebook"></i>
                <!--<li><a href="#">LinkedIN</a></li>
                <li><a href="#">Instagram</a></li>
                <li><a href="#">Facebook</a></li> -->
                </div>
        </div>
        <br>
        
        <div class="footer-col">
            <div class="footerlogo">
                <img src = "footerlogo.png" id="flogoid"> 
            </div>
        </div>

    </div>

    <div class="crt"><p>&copy; All rights reserved 2025</p></div>
    </footer>    
    </div>
    
   <!----------------------  JAVA SCRIPT  ---------------------->
   <script>
        let menuList = document.getElementById("menuList");
        menuList.style.maxHeight = "0px";

        function toggleMenu(){
            if(menuList.style.maxHeight == "0px"){
                menuList.style.maxHeight = "300px";
            }else{
                menuList.style.maxHeight = "0px"
            }
        }
   </script>
   <!----------------------  /JAVA SCRIPT  ---------------------->
</body>
</html>